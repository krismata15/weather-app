import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/Models/city_weather.dart';
import 'package:weather_app/Services/weather_service.dart';

part 'weather_search_event.dart';
part 'weather_search_state.dart';

class WeatherSearchBloc extends Bloc<WeatherSearchEvent, WeatherSearchState> {
  WeatherSearchBloc() : super(WeatherSearchInitial()) {
    on<InitSearch>(initSearch);
    on<CleanSearch>(cleanSearch);
    on<EmitSearchComplete>(
        (event, emit) => emit(WeatherSearchLoaded(cities: event.cities)));
    on<EmitSearchCompleteError>(
        (event, emit) => emit(WeatherSearchError(error: event.error)));
  }

  Timer? _debounce;

  void initSearch(InitSearch event, emit) {
    final String query = event.query;

    if (query.isEmpty) {
      emit(WeatherSearchWaiting());
      if (_debounce?.isActive ?? false) {
        _debounce!.cancel();
      }
    } else {
      emit(WeatherSearchLoading(query: query));
      if (_debounce?.isActive ?? false) {
        _debounce!.cancel();
      }
      _debounce = Timer(const Duration(milliseconds: 600), () {
        _searchWeatherOptions(query);
      });
    }
  }

  void cleanSearch(event, emit) {
    emit(WeatherSearchWaiting());
  }

  Future<void> _searchWeatherOptions(String query) async {
    try {
      final List<CityWeather>? cities =
          await WeatherService.getCityRecommendations(query);
      add(EmitSearchComplete(cities: cities));
    } catch (e) {
      add(EmitSearchCompleteError(error: e.toString()));
    }
  }
}
