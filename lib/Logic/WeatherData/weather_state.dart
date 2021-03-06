import 'package:flutter/cupertino.dart';
import 'package:weatherAppMobile/Models/weather_data.dart';

abstract class WeatherState {}

class WeatherLoadInProgress extends WeatherState {}

class WeatherLoadSuccessful extends WeatherState {
  final WeatherData weatherData;

  WeatherLoadSuccessful({@required this.weatherData});
}

class WeatherLoadError extends WeatherState {
  final String error;

  WeatherLoadError({@required this.error});
}
