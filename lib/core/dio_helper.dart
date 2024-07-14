import 'dart:developer';
import 'package:dio/dio.dart';

import 'strings.dart';
import 'package:flutter/foundation.dart';


class DioHelper {
  static late Dio dio;
  // static final Map<String, dynamic> _headers = {};

  static init() {
    dio = Dio(BaseOptions(baseUrl: baseUrl ));
    dio.interceptors.add(InterceptorsWrapper(
      onError: (error, handler) {
        log('err ${error.response?.statusCode}', error: error);
        handler.next(error);
      },
    ));
    dio.interceptors.add(LogInterceptor(
      request: false,
      requestBody: true,
      responseBody: true,
      requestHeader: true,
      responseHeader: false,
      error: true,
    ));
  }
}




class Utility {
  static myPrintX(object) async {
    if (!kReleaseMode) {
      print(object);
    }
  }
}
