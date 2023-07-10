import 'dart:convert';

class YearResponse {
  final List<int> years;

  YearResponse({required this.years});

  factory YearResponse.fromJson(String jsonString) {
    List<int> years = json.decode(jsonString);
    return YearResponse(years: years);
  }
}

class YearRequest {
  String? year;
  String? model;
  String? make;

  YearRequest({this.make, this.model, this.year});

  static Map<String, dynamic> toMap(YearRequest? request) {
    Map<String, dynamic> result = json.decode(json.encode(request));
    return result;
  }
}
/**
 * {
 *  make: hyundai
 * }
 * 
 * YearRequest###{make=hyundai}
 */