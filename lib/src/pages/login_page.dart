import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:garage_apollo/src/constants/login_constant.dart';
import 'package:garage_apollo/src/pages/home_page.dart';
import 'package:garage_apollo/src/pages/register-page.dart';
import 'package:garage_apollo/src/repositories/user_repository.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    // var user_repository = User_Repository();
    // user_repository.signUp(
    //   username: "linh1996",
    //   email: "linh123@gmail.com",
    //   password: "12345678",
    //   name: "linh nguyen",
    //   phone: "086915273",
    // );

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
                Image.asset(logoDQSmart),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: paddingVerticalLoginText,
                  ),
                  child: Center(
                    child: Text(
                      titleLogin,
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
                    hintText: hintTextUserName,
                    hintStyle: TextStyle(
                      color: colorHintTextFormField,
                    ),
                    prefixIcon: iconUserName,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: paddingPasswordTop),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(borderTFFAndButton)),
                      hintText: hintTextPassword,
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
                        textForgotPassword,
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
                    vertical: paddingVericalButtonLogin,
                  ),
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
                        textButtonLogin,
                        style: TextStyle(
                          fontSize: sizeTextLoginButton,
                          fontWeight: fontWeightTextButton,
                          color: colorTextButton,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Center(
                    child: Text(
                      textLoginWith,
                      style: TextStyle(
                        fontSize: sizeForgotPassText,
                        color: colorHintTextFormField,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: paddingVericalButtonLogin,
                  ),
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
                            logoGoogle,
                            width: widthLogoGoogle,
                            height: heightLogoGoogle,
                            color: colorTextButton,
                          ),
                          SizedBox(
                            width: paddingLogoAndGoogleButton,
                          ),
                          Text(
                            textGoogleButton,
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
                      textHaveAccount,
                      style: TextStyle(fontSize: sizeForgotPassText),
                    ),
                    GestureDetector(
                      onTap: _signUpPress,
                      child: Text(
                        textHaveAccountSignUp,
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
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RegisterPage(),
      ),
    );
  }

  void _loginButtonPress() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  void _googleButtonPress() {
    //continue...
  }
}
