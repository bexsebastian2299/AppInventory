

// ignore_for_file: deprecated_member_use, avoid_print

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class Logging extends Interceptor{
  Logging({
    required this.dio,
  });

  final Dio dio;

  @override 
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if(kDebugMode){
      print('REQUEST[${options.method}] => PATH: ${options.path}');
    }
    try{
      options.headers[HttpHeaders.contentTypeHeader] = 'application/json';
      options.headers[HttpHeaders.acceptHeader] = 'application/json';
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler){
    if(kDebugMode) {
      print(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}'
      );
    }
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (_shouldRetryOnHttpException(err)){
      try {
        handler.resolve(await DioHttpRequestRetrier(dio:dio)
          .requestRetry(err.requestOptions)

          // ignore: body_might_complete_normally_catch_error
          .catchError((e){
            handler.next(err);
          }));
      } catch (e){
        handler.next(err);
      }
    } else {
      handler.next(err);
    }
  }

  bool _shouldRetryOnHttpException(DioError err) {
    
    print(err.type);
    print(err.error is HttpException);
    print(err.message);

    return err.type == DioErrorType.unknown && 
        ((err.error is HttpException && 
          err.message!.contains(
            'Connection closed before full header was received')));
  }
}

class DioHttpRequestRetrier {
  DioHttpRequestRetrier({
    required this.dio,
  });

  final Dio dio;

  Future<Response> requestRetry(RequestOptions requestOptions) async {
    return dio.request(
      requestOptions.path,
      cancelToken: requestOptions.cancelToken,
      data: requestOptions.data,
      onReceiveProgress: requestOptions.onReceiveProgress,
      onSendProgress: requestOptions.onSendProgress,
      queryParameters: requestOptions.queryParameters,
      options: Options(
        contentType: requestOptions.contentType,
        headers: requestOptions.headers,
        sendTimeout: requestOptions.sendTimeout,
        receiveTimeout: requestOptions.receiveTimeout,
        extra: requestOptions.extra,
        followRedirects: requestOptions.followRedirects,
        listFormat: requestOptions.listFormat,
        maxRedirects: requestOptions.maxRedirects,
        method: requestOptions.method,
        receiveDataWhenStatusError: requestOptions.receiveDataWhenStatusError,
        requestEncoder: requestOptions.requestEncoder,
        responseDecoder: requestOptions.responseDecoder,
        responseType: requestOptions.responseType,
        validateStatus: requestOptions.validateStatus,
      ),
    );
  }
}