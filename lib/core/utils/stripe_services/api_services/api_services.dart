import 'package:dio/dio.dart';

abstract class StripeApiServices {
  Future<Response> get({
    required String endPoint,
    Map<String, dynamic> queryParameters,
    String? token,
  });

  Future<Response> post({
    required String endPoint,
    Map<String, dynamic> queryParameters,
    String token,
    required Map<String, dynamic> data,
    Map<String,String>? headers,
  });
  Future<Response> delete({
    required String endPoint,
    Map<String, dynamic> queryParameters,
    String token,
    Map<String, dynamic> data,
  });
}
