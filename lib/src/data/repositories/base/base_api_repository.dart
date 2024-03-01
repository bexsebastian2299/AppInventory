// ignore_for_file: empty_catches, deprecated_member_use, avoid_print

import 'dart:io' show HttpStatus;

import 'package:bexpicking_app/src/data/repositories/base/dio_exceptions.dart';
import 'package:bexpicking_app/src/utils/resources/data_state.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

abstract class BaseApiRepository {
  @protected
  Future<DataState<T>> getStateOf<T>({
    required Future<Response<T>> Function() request,
  }) async {
    try {
      final httpResponse = await request();
      if(httpResponse.statusCode == HttpStatus.ok || httpResponse.statusCode == HttpStatus.created) {
        return DataSuccess(httpResponse.data as T);
      } else {
        throw DioError(
          response: httpResponse,
          requestOptions: httpResponse.requestOptions
        );
      }
    } on DioError catch (error) {
      print(error.response);
      print(error.message);
      print(error.error);
      print(error.type);
      final errorMessage = DioExceptions.fromDioError(error).toString();
      return DataFailed(errorMessage);
    }
  }
}