class Login {
  String username;
  String email;
  String password;
  String name;
  String phone;

  Login({this.username, this.email, this.password, this.name, this.phone});

  Login.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    password = json['password'];
    name = json['name'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    data['name'] = this.name;
    data['phone'] = this.phone;
    return data;
  }
}
