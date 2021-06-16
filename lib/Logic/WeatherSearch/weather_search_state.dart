import 'package:flutter/cupertino.dart';
import 'package:weatherAppMobile/Models/city_weather.dart';

abstract class WeatherSearchState {}

class SearchWaiting extends WeatherSearchState {}

class SearchLoading extends WeatherSearchState {}

class SearchLoaded extends WeatherSearchState {
  final List<CityWeather> cities;

  SearchLoaded({@required this.cities});
}

class SearchError extends WeatherSearchState {
  final String error;

  SearchError({@required this.error});
}
