import 'package:flutter/material.dart';

class LoadingDataComponent extends StatelessWidget {
  final String? title;

  const LoadingDataComponent({Key? key, this.title}) : super(key: key);

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
          const SizedBox(
            height: 12,
          ),
          const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
