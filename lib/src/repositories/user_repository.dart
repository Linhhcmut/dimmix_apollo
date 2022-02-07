import 'dart:developer';
import 'package:http/http.dart' as http;

class User_Repository {
  String signUpUrl = "http://35.219.99.254:4321/api/auth/signup";
  final httpClient = http.Client();

  Future<void> signUp({
    String username,
    String email,
    String password,
    String name,
    String phone,
  }) async {
    Map<String, dynamic> sendata = {
      "username": username.toString(),
      "email": email.toString(),
      "password": password.toString(),
      "name": name.toString(),
      "phone": phone.toString(),
    };
    log("2");
    final Uri url = Uri.parse(signUpUrl);
    http.Response response =
        await httpClient.post(url, headers: {}, body: sendata);
    log(response.statusCode.toString());
    log(response.body);
    return response.body;
  }
}
