import 'dart:async';

import 'package:weather_app/Logic/WeatherSearch/weather_search_state.dart';
import 'package:weather_app/Models/city_weather.dart';
import 'package:weather_app/Services/weather_service.dart';

class WeatherSearchLogicView {
  WeatherSearchLogicView.initialSearchState() {
    initial();
  }

  final StreamController<WeatherSearchState> _searchStream =
      StreamController<WeatherSearchState>.broadcast();

  Stream<WeatherSearchState> get searchStream => _searchStream.stream;

  void initial() {
    _searchStream.add(SearchWaiting());
  }

  Timer? _debounce;

  void initSearch(String query) {
    if (query.isEmpty) {
      _searchStream.add(SearchWaiting());
    } else {
      _searchStream.add(SearchLoading());
      if (_debounce?.isActive ?? false) {
        _debounce!.cancel();
      }
      _debounce = Timer(const Duration(milliseconds: 600), () {
        searchWeatherOptions(query);
      });
    }
  }

  void searchWeatherOptions(String query) async {
    try {
      List<CityWeather>? cities =
          await WeatherService.getCityRecommendations(query);
      _searchStream.add(SearchLoaded(cities: cities));
    } catch (e) {
      _searchStream.add(SearchError(error: e.toString()));
    }
  }
}
