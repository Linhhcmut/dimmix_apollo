import 'dart:async';

import 'package:garage_apollo/src/repositories/user_repository.dart';
import 'package:garage_apollo/src/validations/user_validation.dart';

class LoginBloc {
  User_Repository user_repository;

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

  void dispose(){
    _usernameController.close();
    _passwordController.close();
  }
}
