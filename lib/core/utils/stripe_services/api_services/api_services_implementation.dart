import 'package:dio/dio.dart';


import '../../../api/end_points.dart';
import 'api_services.dart';

class StripeApiServicesImplementation implements StripeApiServices {
  Dio? _dio1;

  StripeApiServicesImplementation() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: EndPoints.stripeBaseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    );
    _dio1 = Dio(baseOptions);
  }

  @override
  Future<Response> get({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {
    _dio1!.options.headers = {
      'Authorization': 'Bearer $token' ?? '',
      'Accept': 'application/json',
    };
    Response data = await _dio1!.get(endPoint, queryParameters: queryParameters);
    return data;
  }

  @override
  Future<Response> post(
      {
        required String endPoint,
        Map<String, dynamic>? queryParameters,
        String? token,
        required Map<String, dynamic>? data,
        Map<String,String>? headers,
      }
      ) async {
    // _dio!.options.headers = {
    //   'Authorization': 'Bearer $token' ?? '',
    // };
    return await _dio1!.post(
      endPoint,
      queryParameters: queryParameters,
      data: data,
      options: Options(
          contentType: Headers.formUrlEncodedContentType,
        headers: headers?? {'Authorization' :  'Bearer $token',}
      )
    );
  }

  @override
  Future<Response> delete({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    String? token,
    Map<String, dynamic>? data,
  }) async {
    _dio1!.options.headers = {
      'Authorization': 'Bearer $token' ?? '',
      'Accept': 'application/json',
    };
    return await _dio1!.delete(
      endPoint,
      queryParameters: queryParameters,
      data: data,
    );
  }
}
