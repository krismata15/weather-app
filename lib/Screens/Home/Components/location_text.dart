import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationText extends StatelessWidget {
  final String? city, countryCode;

  const LocationText({Key? key, required this.city, required this.countryCode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        textBaseline: TextBaseline.alphabetic,
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: GoogleFonts.openSans(
                fontSize: 38.0,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(text: '$city, '),
                TextSpan(
                  text: countryCode,
                  style: const TextStyle(
                    fontSize: 40,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
