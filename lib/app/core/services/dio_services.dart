import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;

class DioService extends getx.GetxService {
  late Dio _dio;

  Future<DioService> init() async {
    _dio = Dio();
    return this;
  }

  Future<Response> getRequest(String url,
      {Map<String, dynamic>? queryParameters,
      Map<String, String>? headers}) async {
    try {
      Response response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return response;
    } catch (e) {
      throw Exception('Error making GET request: $e');
    }
  }

  Future<Response> postRequest(String url,
      {dynamic data, Map<String, String>? headers}) async {
    try {
      Response response = await _dio.post(
        url,
        data: data,
        options: Options(headers: headers),
      );
      return response;
    } catch (e) {
      throw Exception('Error making POST request: $e');
    }
  }

  Future<Response> putRequest(String url,
      {dynamic data, Map<String, String>? headers}) async {
    try {
      Response response = await _dio.put(
        url,
        data: data,
        options: Options(headers: headers),
      );
      return response;
    } catch (e) {
      throw Exception('Error making PUT request: $e');
    }
  }

  Future<Response> deleteRequest(String url,
      {dynamic data, Map<String, String>? headers}) async {
    try {
      Response response = await _dio.delete(
        url,
        data: data,
        options: Options(headers: headers),
      );
      return response;
    } catch (e) {
      throw Exception('Error making DELETE request: $e');
    }
  }
}
