import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nesco/constant.api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VinResponse {
  final Map<String, dynamic> specs;
  final List<dynamic> trims;
  final String year;
  final String make;
  final String model;
  final String trim;

  final firestore = FirebaseFirestore.instance;

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

  factory VinResponse.fromJsonn(Map<String, dynamic> json) {
    return VinResponse(
        year: json['year'].toString(),
        make: json['make'],
        model: json['model'],
        trim: json['trim'],
        specs: json['specs'],
        trims: json['trims']);
  }

  static VinResponse empty = VinResponse(
      year: "", make: "", model: "model", trim: "trim", specs: {}, trims: []);

  bool get isEmpty => this == VinResponse.empty;
  bool get isNotEmpty => this != VinResponse.empty;

  Map<String, dynamic> toJson() {
    return {
      "year": year,
      "make": make,
      "model": model,
      "trim": trim,
      "specs": specs,
      "trims": trims
    };
  }

  // Save to firebase firestore
  Future<void> save() async {
    final user = FirebaseAuth.instance.currentUser;

    CollectionReference vins = firestore.collection('vins');
    vins
        .add({
          "year": year,
          "make": make,
          "model": model,
          "trim": trim,
          "specs": specs,
          "trims": trims,
          "user": user!.uid
        })
        .then((value) => print("Vin Added"))
        .catchError((error) => print("Failed to add vin: $error"));
  }
}

class VinRequest {
  final String vin;
  final dio = Dio();
  final baseUrl = ApiConstants.BASE_URL;

  VinRequest({required this.vin});
  static Map<String, dynamic> toMap(VinRequest? request) {
    Map<String, dynamic> result = json.decode(json.encode(request));
    return result;
  }

  login() async {
    String url = "$baseUrl/auth/login";
    try {
      var response = await dio.post(url, data: {
        "api_token": ApiConstants.API_TOKEN,
        "api_secret": ApiConstants.API_SECRET,
      });
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("token", response.data);
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }

  getVin() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      if (!prefs.containsKey("token")) {
        login();
      }
      final dio = Dio();
      dio.options.headers["Authorization"] =
          "Bearer ${prefs.getString("token")}";
      final response = await dio.get("$baseUrl/vin/$vin");
      VinResponse vinR = VinResponse.fromJsonn(response.data);

      return vinR;
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        throw Exception("VIN not found");
      }
      throw Exception("There was an error processing the request");
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'vin': vin,
    };
  }
}
