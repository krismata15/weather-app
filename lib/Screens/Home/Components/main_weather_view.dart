import 'package:flutter/material.dart';
import 'package:weather_app/Screens/Home/Components/min_max_tile.dart';
import 'package:weather_app/utils/util_functions.dart';

class MainWeatherView extends StatelessWidget {
  final double? temp;
  final double? min, max;
  final String? weather;

  MainWeatherView({this.temp, this.min, this.max, this.weather});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            ' ${temp!.ceil()}°',
            style: TextStyle(
              fontSize: 150.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Center(
          child: Text(
            parseWeatherDescriptionToEs(weather),
            style: TextStyle(
              fontSize: 32.0,
              //color: Colors.white.withOpacity(0.7),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        MinMaxTile(
          max: max,
          min: min,
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
