import 'package:flutter/material.dart';
import 'package:weather_app/Models/city_weather.dart';
import 'package:weather_app/Screens/Search/Components/search_result_tile.dart';

class SearchResults extends StatelessWidget {
  final List<CityWeather>? cities;

  const SearchResults({Key? key, required this.cities}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cities!.length,
      itemBuilder: (_, int index) => WeatherResultTile(
        cityWeather: cities!.elementAt(index),
      ),
    );
  }
}
