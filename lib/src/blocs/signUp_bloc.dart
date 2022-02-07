import 'dart:async';
import 'dart:developer';

import 'package:garage_apollo/src/repositories/user_repository.dart';
import 'package:garage_apollo/src/validations/user_validation.dart';

class SignUpBloc {

  User_Repository user_repository;

  StreamController _usernameController = new StreamController.broadcast();
  StreamController _emailController = new StreamController.broadcast();
  StreamController _passwordController = new StreamController.broadcast();
  StreamController _nameController = new StreamController.broadcast();
  StreamController _phoneController = new StreamController.broadcast();

  Stream get username => _usernameController.stream;
  Stream get email => _emailController.stream;
  Stream get password => _passwordController.stream;
  Stream get name => _nameController.stream;
  Stream get phone => _phoneController.stream;

  bool isValidUsername(String username) {
    if (ValidationUser.validateUsername(username)) {
      _usernameController.sink.add("OK");
      return true;
    }
    _usernameController.addError("Invalid username");
    return false;
  }

  bool isValidEmail(String email) {
    if (ValidationUser.validateEmail(email)) {
      _emailController.sink.add("OK");
      return true;
    }
    _emailController.sink.addError("Invalid email");
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

  bool isValidName(String name) {
    if (ValidationUser.validateName(name)) {
      _nameController.sink.add("OK");
      return true;
    }
    _nameController.sink.addError("Invalid name");
    return false;
  }

  bool isValidPhone(String phone) {
    if (ValidationUser.validatePhone(phone)) {
      _phoneController.sink.add("OK");
      return true;
    }
    _phoneController.sink.addError("Invalid phone");
    return false;
  }

  bool signUpUser({
    String username,
    String email,
    String password,
    String name,
    String phone,
  }) {
    log("username: " + isValidUsername(username).toString());
    log("email: " + isValidUsername(email).toString());
    log("password: " + isValidUsername(password).toString());
    log("name: " + isValidUsername(name).toString());
    log("phone: " + isValidUsername(phone).toString());
    if (isValidUsername(username) &&
        isValidEmail(email) &&
        isValidPassword(password) &&
        isValidName(name) &&
        isValidPhone(phone)) {
      try {
        user_repository.signUp(
          username: username,
          email: email,
          password: password,
          name: name,
          phone: phone,
        );
        return true;
      } catch (e) {
        log(e);
      }
    }
    return false;
  }

  void dispose() {
    _usernameController.close();
    _emailController.close();
    _passwordController.close();
    _phoneController.close();
    _nameController.close();
  }
}
