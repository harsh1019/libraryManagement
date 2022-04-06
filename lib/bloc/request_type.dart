abstract class RequestType {}

class LoginRequest extends RequestType {
  String admin;
  String password;
  LoginRequest({required this.admin, required this.password});
}

class LogoutRequest extends RequestType {}
