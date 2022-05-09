import 'dart:async';

import 'package:weather_app/Logic/WeatherData/weather_state.dart';
import 'package:weather_app/Models/city_weather.dart';
import 'package:weather_app/Models/lat_lon_data.dart';
import 'package:weather_app/Models/weather_data.dart';
import 'package:weather_app/Services/weather_service.dart';

class WeatherDataLogicView {
  WeatherDataLogicView.initialLocalData(CityWeather? cityWeather) {
    getSelectedOption(cityWeather);
  }

  final StreamController<WeatherState> _weatherStream =
      StreamController<WeatherState>();

  Stream<WeatherState> get weatherStream => _weatherStream.stream;

  //Methods are like event for change state
  void getSelectedOption(CityWeather? cityWeather) async {
    try {
      _weatherStream.add(WeatherLoadInProgress());

      /*Map<String, double?> searchParameter = {
        'latitude': cityWeather?.coord?.lat,
        'longitude': cityWeather?.coord?.lon,
      };*/
      WeatherData? weatherData =
          await WeatherService.getCityWeatherWithForecast(
              const LatLonData.emptyLocation());
      _weatherStream.add(WeatherLoadSuccessful(weatherData: weatherData));
    } catch (e) {
      _weatherStream.add(WeatherLoadError(error: e.toString()));
    }
  }
}
