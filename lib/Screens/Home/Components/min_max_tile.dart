import 'package:flutter/material.dart';

class MinMaxTile extends StatelessWidget {
  final double? min, max;
  final bool center;
  MinMaxTile({this.min, this.max, this.center = true});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: center ? 0 : 10,
        ),
        Row(
          children: [
            Icon(
              Icons.arrow_drop_down_sharp,
              size: 30,
              //color: Colors.white,
            ),
            Text(
              '${min!.ceil()}°',
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
              '${max!.ceil()}°',
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
    );
  }
}
