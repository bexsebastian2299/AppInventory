




import 'dart:io';

import 'package:bexpicking_app/src/data/datasources/remote/interceptor_api_service.dart';
import 'package:bexpicking_app/src/locator.dart';
import 'package:bexpicking_app/src/services/storage.dart';
import 'package:dio/dio.dart';

final LocalStorageService _storageService = locator<LocalStorageService>();

class ApiService {
  ApiService() {
    late Dio dio;

    ApiService(){
      dio = Dio(
        BaseOptions(
          baseUrl: '', //url del dominio
          connectTimeout: const Duration(minutes: 1),
          receiveTimeout: const Duration(minutes: 1),
          headers: {HttpHeaders.contentTypeHeader: 'application/json'}),
      );

      dio.interceptors.add(Logging(dio: dio));
    }

    //aqui van a ir las funciones

  }
}