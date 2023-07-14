import 'dart:convert';

class VinResponse {
  final Map<String, dynamic> specs;
  final List<Map<String, dynamic>> trims;
  final String year;
  final String make;
  final String model;
  final String trim;

  VinResponse(
      {required this.year,
      required this.make,
      required this.model,
      required this.trim,
      required this.specs,
      required this.trims});

  factory VinResponse.fromJson(String jsonString) {
    VinResponse response = json.decode(jsonString);
    return response;
  }

  static VinResponse empty = VinResponse(
      year: "", make: "", model: "model", trim: "trim", specs: {}, trims: []);

  bool get isEmpty => this == VinResponse.empty;
  bool get isNotEmpty => this != VinResponse.empty;
}

class VinRequest {
  final String vin;

  VinRequest({required this.vin});
  static Map<String, dynamic> toMap(VinRequest? request) {
    Map<String, dynamic> result = json.decode(json.encode(request));
    return result;
  }
}
