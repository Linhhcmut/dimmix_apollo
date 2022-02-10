import 'dart:async';
import 'dart:developer';

import 'package:garage_apollo/src/repositories/user_repository.dart';
import 'package:garage_apollo/src/validations/user_validation.dart';

class LoginBloc {
  User_Repository _user_repository = User_Repository();

  StreamController _usernameController = new StreamController.broadcast();
  StreamController _passwordController = new StreamController.broadcast();

  Stream get username => _usernameController.stream;
  Stream get password => _passwordController.stream;

  bool isValidUsername(String username) {
    if (ValidationUser.validateUsername(username)) {
      _usernameController.sink.add("OK");
      return true;
    }
    _usernameController.sink.addError("Invalid username");
    return false;
  }

  bool isValidPassword(String password) {
    if (ValidationUser.validatePassword(password)) {
      _passwordController.sink.add("OK");
      return true;
    }
    _passwordController.sink.addError("Invalid password");
    return false;
  }

  Future<bool> loginUser({String username, String password}) async {
    if (isValidUsername(username) && isValidPassword(password)) {
      try {
        await _user_repository.signIn(
          username: username,
          password: password,
        );
        return true;
      } catch (e) {
        log(e.toString());
      }
    }
    return false;
  }

  void dispose() {
    _usernameController.close();
    _passwordController.close();
  }
}
