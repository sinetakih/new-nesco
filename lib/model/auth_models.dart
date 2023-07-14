class RegisterRequest {
  final String username;
  final String email;
  final String password;
  final String confrimPassword;

  RegisterRequest({
    required this.password,
    required this.username,
    required this.email,
    required this.confrimPassword,
  });
}

class LoginRequest {
  final String email;
  final String password;

  LoginRequest({required this.email, required this.password});
}
