import 'package:flutter/material.dart';

class LoadingDataComponent extends StatelessWidget {
  final String title;

  LoadingDataComponent({this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/clima_1.png',
            scale: 3,
          ),
          Text(
            title ?? 'Obteniendo datos',
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 12,
          ),
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}
