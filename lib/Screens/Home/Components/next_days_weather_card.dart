import 'dart:ui';

import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
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
                Text(
                  'Martes 18',
                ),
                /*Text(
                  '17 sep',
                ),*/
                SizedBox(
                  height: 14,
                ),
                Icon(
                  Icons.wb_sunny_outlined,
                  size: 60,
                  //color: Colors.white,
                ),
                SizedBox(
                  height: 14,
                ),
                Text(
                  ' 30°',
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
                Text(
                  'Despejado',
                  style: TextStyle(
                    fontSize: 15.0,
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
