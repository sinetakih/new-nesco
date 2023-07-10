import 'package:nesco/constant.api.dart';
import 'package:nesco/service/api/api.client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final ApiClient client;

  AuthService({required this.client});

  Future<String?> login() async {
    Map<String, String> body = {
      "api_token": ApiConstants.API_TOKEN,
      "api_secret": ApiConstants.API_SECRET
    };
    var token =
        await client.post(path: "/auth/login", body: body, converter: (p) => p);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(ApiConstants.API_TOKEN_KEY, token);
    return token;
  }
}
