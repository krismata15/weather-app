import 'package:flutter/material.dart';
import 'package:weather_app/Screens/Home/Components/min_max_tile.dart';
import 'package:weather_app/utils/util_functions.dart';

class MainWeatherView extends StatelessWidget {
  final double? temp;
  final double? min, max;
  final String? weather;

  const MainWeatherView({Key? key, this.temp, this.min, this.max, this.weather})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            ' ${temp!.ceil()}°',
            style: const TextStyle(
              fontSize: 150.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Center(
          child: Text(
            parseWeatherDescriptionToEs(weather),
            style: const TextStyle(
              fontSize: 32.0,
              //color: Colors.white.withOpacity(0.7),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        MinMaxTile(
          max: max,
          min: min,
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
