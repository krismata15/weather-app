import 'package:dio/dio.dart';

void handleDioErrors(DioError e) {
  if (e.type == DioErrorType.CONNECT_TIMEOUT) {
    throw ('Error de conexión - Asegurese estar conectado a internet antes de continuar');
    //return;
  }

  if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
// ...
    throw ('Error de conexión - Asegurese estar conectado a internet antes de continuar');
  }

  if (e.type == DioErrorType.RESPONSE) {
    print('DioErrorType.RESPONSE');
    print(e.response.data);

    throw ('Error obteniendo datos - Intente de nuevo');
  }

  if (e.type == DioErrorType.CANCEL) {
    throw ('Solicitud cancelada por el usuario');
  }

  if (e.type == DioErrorType.DEFAULT) {
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
