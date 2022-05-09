import 'package:equatable/equatable.dart';
import 'package:weather_app/Models/city_weather.dart';
import 'package:weather_app/Models/city_weather_details.dart';

class WeatherDataList extends Equatable {
  Map<int, WeatherData> weatherDataByCities;

  WeatherDataList({required this.weatherDataByCities});

  @override
  List<Object?> get props => [weatherDataByCities];

  /*WeatherDataList.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      citiesWeather = [];
      json['list'].forEach((v) {
        citiesWeather!.add(CityWeather.fromJson(v));
      });
    }
  }*/
}

class WeatherData extends Equatable {
  CityWeather? cityWeather;
  CityWeatherDetails? cityWeatherDetails;
  FromWhereData? fromWhereData;

  WeatherData(
      {this.cityWeatherDetails,
      this.cityWeather,
      this.fromWhereData = FromWhereData.search});

  WeatherData.fromJson(dynamic json) {
    cityWeather =
        json['current'] != null ? CityWeather.fromJson(json['current']) : null;
    cityWeatherDetails = json['forecast'] != null
        ? CityWeatherDetails.fromJson(json['forecast'])
        : null;
  }

  @override
  List<Object?> get props => [cityWeather, cityWeatherDetails];
}

enum FromWhereData { location, local, search }
