import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:nesco/constant.api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient<T> {
  final String baseUrl = ApiConstants.BASE_URL;

  ApiClient();

  Future<T?> get({
    required String path,
    required T Function(String) converter,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var url = Uri.parse(
          this.baseUrl + path + (_queryParams(queryParameters) ?? ""));

      var token =
          "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJjYXJhcGkuYXBwIiwic3ViIjoiZTU0ZWJkZjctZmIwNS00NTliLTg1NjAtZThiMGUwMDA2OWM0IiwiYXVkIjoiZTU0ZWJkZjctZmIwNS00NTliLTg1NjAtZThiMGUwMDA2OWM0IiwiZXhwIjoxNjg5NTU1MDUwLCJpYXQiOjE2ODg5NTAyNTAsImp0aSI6IjY0MzM1YWUyLTljZDYtNDQ0Ni1iOTdmLTQxY2Y2NGRkZGIwZSIsInVzZXIiOnsic3Vic2NyaWJlZCI6ZmFsc2V9fQ.19Uo9hCNT0U8EG6Aw70VVmTC96UrUe5Gm_4KB2anJNE";
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      Map<String, String> headers = {"Authorization": "Bearer ${token}"};
      var response = await http.get(url, headers: headers);

      var statusCode = response.statusCode;
      if (statusCode >= 200 && statusCode < 300) {
        T _model = converter(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<T?> post({
    required String path,
    required Object? body,
    required T Function(String) converter,
  }) async {
    try {
      var url = Uri.parse(this.baseUrl + path);

      var response = await http.post(url, body: body);

      var statusCode = response.statusCode;
      if (statusCode >= 200 && statusCode < 300) {
        T _model = converter(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  String? _queryParams(Map<String, dynamic>? params) {
    if (params == null) {
      return null;
    }
    var p = "?";
    params.forEach((key, value) {
      p = "${p + key + "=" + value}&";
    });
    return p;
  }
}
