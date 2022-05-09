import 'package:flutter/material.dart';

class ErrorHandlerComponent extends StatelessWidget {
  final String? title, description;
  final Function? retryHandler;

  const ErrorHandlerComponent(
      {Key? key, this.title, this.description, this.retryHandler})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/clima_error.png',
            scale: 3,
          ),
          Text(
            title ?? 'Ha ocurrido un error inesperado',
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Text(
              description ?? '',
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          if (retryHandler != null)
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                primary: Colors.white,
              ),
              onPressed: retryHandler as void Function()?,
              child: const Text(
                'Reintentar',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
