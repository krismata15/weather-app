import 'package:weatherAppMobile/Models/city_weather.dart';
import 'package:weatherAppMobile/Models/city_weather_details.dart';
import 'package:weatherAppMobile/Models/forecast_weather.dart';

class WeatherData {
  CityWeather cityWeather;
  CityWeatherDetails cityWeatherDetails;

  WeatherData({this.cityWeatherDetails, this.cityWeather});

  WeatherData.fromJson(dynamic json) {
    cityWeather =
        json['current'] != null ? CityWeather.fromJson(json['current']) : null;
    cityWeatherDetails = json['forecast'] != null
        ? CityWeatherDetails.fromJson(json['forecast'])
        : null;
  }
}
