import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTextFormatted extends StatelessWidget {
  const DateTextFormatted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String date =
        DateFormat('EEEE dd MMMM yyyy', 'es').format(DateTime.now().toLocal());
    return Text(
      date,
      style: TextStyle(
        fontSize: 18.0,
        color: Colors.white.withOpacity(0.7),
      ),
    );
  }
}
