import 'package:dio/dio.dart';

void handleDioErrors(DioError e) {
  if (e.type == DioErrorType.connectTimeout) {
    throw ('Error de conexión - Asegurese estar conectado a internet antes de continuar');
    //return;
  }

  if (e.type == DioErrorType.receiveTimeout) {
// ...
    throw ('Error de conexión - Asegurese estar conectado a internet antes de continuar');
  }

  if (e.type == DioErrorType.response) {
    print('DioErrorType.RESPONSE');
    print(e.response!.data);

    throw ('Error obteniendo datos - Intente de nuevo');
  }

  if (e.type == DioErrorType.cancel) {
    throw ('Solicitud cancelada por el usuario');
  }

  if (e.type == DioErrorType.other) {
    if (e.error != null) {
      if (e.toString().contains('SocketException')) {
        throw ('Error de conexión - Asegurese estar conectado a internet antes de continuar');
      } else {
        print(e);
        throw ('Error obteniendo datos - Intente de nuevo');
      }
    }
    // ...
  }
}
