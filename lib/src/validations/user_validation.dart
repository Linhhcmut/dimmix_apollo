class ValidationUser {

  static bool validateUsername(String username) {
    if (username == null || username.length < 4) {
      return false;
    }
    return true;
  }

  static bool validateEmail(String email) {
    if (email == null) {
      return false;
    }
    var isValid = RegExp(r"^[a-z0-9](\.?[a-z0-9]){4,}@g(oogle)?mail\.com")
        .hasMatch(email);
    if (!isValid) {
      return false;
    }
    return true;
  }

  static bool validatePassword(String password) {
    if (password == null) {
      return false;
    }
    if (password.length < 8) {
      return false;
    }
    return true;
  }

  static bool validateName(String name){
    if(name == null || name.length < 2){
      return false;
    }
    return true;
  }

  static bool validatePhone(String phone){
    if(phone == null || phone.length < 9){
      return false;
    }
    return true;
  }
}
