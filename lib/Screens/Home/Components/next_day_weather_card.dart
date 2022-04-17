import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/Models/city_weather_details.dart';
import 'package:weather_app/Screens/Home/Components/min_max_tile.dart';
import 'package:weather_app/utils/util_functions.dart';

class NextDayWeatherCard extends StatelessWidget {
  final Daily forecastData;
  final DateFormat dateFormat = DateFormat('E dd MMMM', 'es');

  NextDayWeatherCard({required this.forecastData});

  String formatDateFromUnixTime() {
    DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(forecastData.dt! * 1000);
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
                  height: 6,
                ),
                Text(
                  formatDateFromUnixTime(),
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                CircleAvatar(
                  minRadius: 10,
                  maxRadius: 30,
                  child: CachedNetworkImage(
                    imageUrl:
                        'http://openweathermap.org/img/wn/${forecastData.weather!.first.icon}@2x.png',
                    placeholder: (context, url) => CircleAvatar(),
                    errorWidget: (context, url, error) => CircleAvatar(),
                  ),
                ),
                /*Icon(
                  Icons.wb_sunny_outlined,
                  size: 60,
                  //color: Colors.amberAccent,
                ),*/
                SizedBox(
                  height: 6,
                ),
                Text(
                  ' ${forecastData.feelsLike!.day!.ceil()}°',
                  style: TextStyle(
                    fontSize: 26.0,
                  ),
                ),
                Text(
                  '${parseWeatherDescriptionToEs(forecastData.weather!.first.main)}',
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: MinMaxTile(
                      max: forecastData.temp!.max,
                      min: forecastData.temp!.min,
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
