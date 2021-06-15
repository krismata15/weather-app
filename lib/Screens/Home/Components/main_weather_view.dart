import 'package:flutter/material.dart';

class MainWeatherView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            ' 22°',
            style: TextStyle(
              fontSize: 150.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Center(
          child: Text(
            'Despejado',
            style: TextStyle(
              fontSize: 28.0,
              //color: Colors.white.withOpacity(0.7),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(
                  Icons.arrow_drop_down_sharp,
                  size: 30,
                  //color: Colors.white,
                ),
                Text(
                  '12°',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Row(
              children: [
                Icon(
                  Icons.arrow_drop_up_sharp,
                  size: 30,
                  //color: Colors.white,
                ),
                Text(
                  '25°',
                  style: TextStyle(
                    //color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 18,
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
