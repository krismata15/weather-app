import 'package:dio/dio.dart';
import 'package:weather_app/Models/city_weather.dart';
import 'package:weather_app/Models/city_weather_details.dart';
import 'package:weather_app/Models/weather_data.dart';
import 'package:weather_app/utils/constants.dart';
import 'package:weather_app/utils/utils_error_handler.dart';

class WeatherService {
  static BaseOptions options = BaseOptions(
    baseUrl: SERVER_URL,
    connectTimeout: 10000,
    receiveTimeout: 10000,
  );

  static Dio dio = Dio(options);

  static Future<CityWeather?> getCityWeather() async {
    String url = '/city-weather';
    CityWeather? cityWeather;
    try {
      Response response = await dio.get(
        url,
      );

      if (response.statusCode == 200) {
        cityWeather = CityWeather.fromJson(response.data);
      }

      return cityWeather;
    } catch (e) {
      if (e is DioError) {
        handleDioErrors(e);
      }
      rethrow;
    }
  }

  static Future<WeatherData?> getCityWeatherWithForecast(
      Map<String, double?> searchParameter) async {
    String url = '/city-weather-forecast';
    WeatherData? weather;
    try {
      Response response = await dio.get(
        url,
        queryParameters: searchParameter,
      );

      if (response.statusCode == 200) {
        weather = WeatherData.fromJson(response.data);
      }

      return weather;
    } catch (e) {
      if (e is DioError) {
        handleDioErrors(e);
      }
      rethrow;
    }
  }

  static Future<List<CityWeather>?> getCityRecommendations(String query) async {
    String url = '/city-weather-list';
    CityWeatherList cities = CityWeatherList();
    try {
      Response response =
          await dio.get(url, queryParameters: {'busqueda': query});

      if (response.statusCode == 200) {
        if (response.data['list'] != null) {
          cities = CityWeatherList.fromJson(response.data);
        }
      }

      return cities.citiesWeather;
    } catch (e) {
      if (e is DioError) {
        handleDioErrors(e);
      }
      rethrow;
    }
  }

  static Future<CityWeatherDetails?> getCityWeatherDetailed() async {
    String url = '/city-weather-detailed';
    CityWeatherDetails? cityWeatherDetails;
    try {
      Response response = await dio.get(
        url,
      );

      if (response.statusCode == 200) {
        cityWeatherDetails = CityWeatherDetails.fromJson(response.data);
      }

      return cityWeatherDetails;
    } catch (e) {
      if (e is DioError) {
        handleDioErrors(e);
      }
      rethrow;
    }
  }
}
