import 'package:flutter/material.dart';
import 'package:weatherAppMobile/Models/city_weather.dart';
import 'package:weatherAppMobile/Screens/Search/Components/search_result_tile.dart';

class SearchResults extends StatelessWidget {
  final List<CityWeather> cities;

  SearchResults({@required this.cities});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cities.length,
      itemBuilder: (_, int index) => WeatherResultTile(
        cityWeather: cities.elementAt(index),
      ),
    );
  }
}
