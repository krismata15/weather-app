import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationText extends StatelessWidget {
  final String city, countryCode;

  LocationText({@required this.city, @required this.countryCode});

  @override
  Widget build(BuildContext context) {
    return Row(
      textBaseline: TextBaseline.alphabetic,
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: GoogleFonts.openSans(
              fontSize: 42.0,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(text: '$city, '),
              TextSpan(
                text: countryCode,
                style: TextStyle(
                  fontSize: 36,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
