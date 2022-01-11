import 'package:flutter/material.dart';
import 'package:garage_apollo/src/constants/login_constant.dart';
import 'package:garage_apollo/src/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(paddingListView),
          child: Center(
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: paddingDQSmartAndTop,
                ),
                Image.asset("assets/images/dqsmart.png"),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: paddingVerticalLoginText),
                  child: Center(
                    child: Text(
                      "Đăng nhập",
                      style: TextStyle(
                        fontSize: sizeLoginText,
                        color: colorLoginText,
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(borderTFFAndButton),
                    ),
                    hintText: "Email",
                    hintStyle: TextStyle(
                      color: colorHintTextFormField,
                    ),
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: paddingPasswordTop),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(borderTFFAndButton)),
                      hintText: "Mật khẩu",
                      hintStyle: TextStyle(
                        color: colorHintTextFormField,
                      ),
                      prefixIcon: Icon(Icons.lock),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: paddingVerticalForgotPassText),
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: _forgotPassPress,
                      child: Text(
                        "Quên mật khẩu?",
                        style: TextStyle(
                          fontSize: sizeForgotPassText,
                          color: colorLinkText,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: paddingVericalButtonLogin),
                  child: SizedBox(
                    height: heightButtonLogin,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(borderTFFAndButton),
                        ),
                        primary: colorButtonLogin,
                      ),
                      onPressed: _loginButtonPress,
                      child: Text(
                        "ĐĂNG NHẬP",
                        style: TextStyle(
                          fontSize: sizeTextLoginButton,
                          fontWeight: FontWeight.bold,
                          color: colorTextButton,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Center(
                    child: Text(
                      "Hoặc đăng nhập với",
                      style: TextStyle(
                        fontSize: sizeForgotPassText,
                        color: colorHintTextFormField,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: paddingVericalButtonLogin),
                  child: SizedBox(
                    width: double.infinity,
                    height: heightButtonLogin,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(borderTFFAndButton),
                        ),
                        primary: colorButtonGoogle,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            "assets/images/google4.png",
                            width: 30,
                            height: 30,
                            color: colorTextButton,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Google",
                            style: TextStyle(
                              fontSize: sizeTextLoginButton,
                              color: colorTextButton,
                            ),
                          ),
                        ],
                      ),
                      onPressed: _googleButtonPress,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Chưa có tài khoản?",
                      style: TextStyle(fontSize: sizeForgotPassText),
                    ),
                    GestureDetector(
                      onTap: _signUpPress,
                      child: Text(
                        " Đăng ký",
                        style: TextStyle(
                          color: colorLinkText,
                          fontSize: sizeForgotPassText,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _forgotPassPress() {
    //continue...
  }
  void _signUpPress() {
    //continue...
  }

  void _loginButtonPress() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  void _googleButtonPress() {
    //continue...
  }
}
