import 'package:flutter/material.dart';

class GettingInitialDataComponent extends StatelessWidget {
  const GettingInitialDataComponent({Key? key}) : super(key: key);

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
          const Text(
            'Obteniendo información inicial',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
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
