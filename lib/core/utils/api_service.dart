import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);
  String baseUrl = 'https://www.googleapis.com/books/v1/';
  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var result = await _dio.get('$baseUrl$endPoint');

    return result.data;
  }
}
