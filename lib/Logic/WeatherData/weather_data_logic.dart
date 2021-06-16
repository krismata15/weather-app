import 'dart:async';

import 'package:weatherAppMobile/Logic/WeatherData/weather_state.dart';
import 'package:weatherAppMobile/Models/city_weather.dart';
import 'package:weatherAppMobile/Models/weather_data.dart';
import 'package:weatherAppMobile/Services/weather_service.dart';

class WeatherDataLogicView {
  WeatherDataLogicView.initialLocalData(CityWeather cityWeather) {
    getSelectedOption(cityWeather);
  }

  final StreamController<WeatherState> _weatherStream =
      StreamController<WeatherState>();

  Stream<WeatherState> get weatherStream => _weatherStream.stream;

  //Methods are like event for change state
  void getSelectedOption(CityWeather cityWeather) async {
    try {
      _weatherStream.add(WeatherLoadInProgress());

      Map<String, double> searchParameter = {
        'latitude': cityWeather?.coord?.lat,
        'longitude': cityWeather?.coord?.lon,
      };
      WeatherData weatherData =
          await WeatherService.getCityWeatherWithForecast(searchParameter);
      _weatherStream.add(WeatherLoadSuccessful(weatherData: weatherData));
    } catch (e) {
      rethrow;
      _weatherStream.add(WeatherLoadError(error: e));
    }
  }
}
