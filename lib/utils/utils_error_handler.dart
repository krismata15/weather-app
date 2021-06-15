import 'package:dio/dio.dart';

void handleDioErrors(DioError e) {
  if (e.type == DioErrorType.CONNECT_TIMEOUT) {
    throw ('Connection Error - Make sure you\'re connected before continue');
    //return;
  }

  if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
// ...
    throw ('Connection Error - Make sure you\'re connected before continue');
  }

  if (e.type == DioErrorType.RESPONSE) {
    print('DioErrorType.RESPONSE');
    print(e.response.data);

    throw e.response;
  }

  if (e.type == DioErrorType.CANCEL) {
    throw ('Canceled by user');
  }

  if (e.type == DioErrorType.DEFAULT) {
    if (e.error != null) {
      if (e.toString().contains('SocketException')) {
        throw ('Connection Error - Make sure you\'re connected before continue');
      } else {
        print(e);
        throw ('Error getting data, please try again');
      }
    }
    // ...
  }
}
