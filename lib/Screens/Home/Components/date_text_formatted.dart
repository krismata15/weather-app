import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTextFormatted extends StatelessWidget {
  final String date =
      DateFormat('EEEE dd MMMM yyyy', 'es').format(DateTime.now().toLocal());
  @override
  Widget build(BuildContext context) {
    return Text(
      date,
      style: TextStyle(
        fontSize: 18.0,
        color: Colors.white.withOpacity(0.7),
      ),
    );
  }
}
