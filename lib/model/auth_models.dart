class RegisterRequest {
  final String username;
  final String email;
  final String momoNumber;
  final String momoName;
  final String password;

  RegisterRequest(
      {required this.password,
      required this.username,
      required this.email,
      required this.momoName,
      required this.momoNumber});
}

class LoginRequest {
  final String username;
  final String email;
  final String password;

  LoginRequest(
      {required this.username, required this.email, required this.password});
}

///tentative class, might remove if not needed
class PayCardUser {
  final String username;
  final String email;
  final String momoNumber;
  final String momoName;

  PayCardUser(
      {required this.email,
      required this.username,
      required this.momoNumber,
      required this.momoName});
}
