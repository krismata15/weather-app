import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherAppMobile/Models/city_weather_details.dart';
import 'package:weatherAppMobile/Models/forecast_weather.dart';
import 'package:weatherAppMobile/Screens/Home/Components/min_max_tile.dart';

class NextDayWeatherCard extends StatelessWidget {
  final Daily forecastData;
  final DateFormat dateFormat = DateFormat('E dd MMMM', 'es');

  NextDayWeatherCard({@required this.forecastData});

  String formatDateFromUnixTime() {
    DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(forecastData.dt * 1000);
    return dateFormat.format(dateTime.toUtc());
  }

  @override
  Widget build(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width * 0.28;
    return Container(
      width: cardWidth,
      height: 190,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            //width: 200.0,
            //height: 200.0,
            decoration: BoxDecoration(
              color: Colors.grey.shade200.withOpacity(0.5),
              boxShadow: [
                BoxShadow(
                  color: Colors.transparent,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 2,
                ),
                Text(
                  formatDateFromUnixTime(),
                ),
                SizedBox(
                  height: 14,
                ),
                Icon(
                  Icons.wb_sunny_outlined,
                  size: 60,
                  //color: Colors.amberAccent,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  ' ${forecastData.feelsLike.day.ceil()}°',
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
                Text(
                  '${forecastData.weather.first.main}',
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: MinMaxTile(
                      max: forecastData.temp.max,
                      min: forecastData.temp.min,
                      center: false,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
