import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:garage_apollo/src/blocs/login_bloc.dart';
import 'package:garage_apollo/src/blocs/signUp_bloc.dart';
import 'package:garage_apollo/src/constants/login_constant.dart';
import 'package:garage_apollo/src/pages/home_page.dart';
import 'package:garage_apollo/src/pages/register-page.dart';
// import 'package:garage_apollo/src/repositories/user_repository.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscurePass;

  LoginBloc _loginBloc = LoginBloc();

  TextEditingController _txtusernameController = TextEditingController();
  TextEditingController _txtpasswordController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var loginBloc = Provider.of<LoginBloc>(context);
    _txtusernameController.addListener(() {
      loginBloc.isValidUsername(_txtusernameController.text);
    });
    _txtpasswordController.addListener(() {
      loginBloc.isValidPassword(_txtpasswordController.text);
    });
  }

  @override
  void initState() {
    super.initState();
    _obscurePass = true;
  }

  @override
  Widget build(BuildContext context) {
    // var user_repository = User_Repository();
    // user_repository.signIn(
    //   username: "linh1996",
    //   password: "12345678",
    // );

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Consumer<LoginBloc>(
          builder: (context, loginBloc, child) => Padding(
            padding: const EdgeInsets.all(paddingListView),
            child: Center(
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: paddingDQSmartAndTop,
                  ),
                  //logo
                  Image.asset(logoDQSmart),
                  //title login page
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
                  //user name login textformfield
                  StreamBuilder(
                      stream: loginBloc.username,
                      builder: (context, snapshot) {
                        return TextFormField(
                          controller: _txtusernameController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(borderTFFAndButton),
                              ),
                              hintText: hintTextUserName,
                              hintStyle: TextStyle(
                                color: colorHintTextFormField,
                              ),
                              prefixIcon: iconUserName,
                              errorText:
                                  snapshot.hasError ? snapshot.error : null),
                        );
                      }),
                  //password login textformfield
                  Padding(
                    padding: const EdgeInsets.only(top: paddingPasswordTop),
                    child: StreamBuilder(
                        stream: loginBloc.password,
                        builder: (context, snapshot) {
                          return TextFormField(
                            obscureText: _obscurePass,
                            controller: _txtpasswordController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        borderTFFAndButton)),
                                hintText: hintTextPassword,
                                hintStyle: TextStyle(
                                  color: colorHintTextFormField,
                                ),
                                prefixIcon: Icon(Icons.lock),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _obscurePass = !_obscurePass;
                                    });
                                  },
                                  icon: Icon(
                                    _obscurePass
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                ),
                                errorText:
                                    snapshot.hasError ? snapshot.error : null),
                          );
                        }),
                  ),
                  //forgot password link text
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
                  //button login
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
                  //login with text
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
                  //button login with google
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
                  // text signup
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
        builder: (context) => Provider<SignUpBloc>.value(
          value: SignUpBloc(),
          child: RegisterPage(),
        ),
      ),
    );
  }

  void _loginButtonPress() async {
    try {
      bool login = await _loginBloc.loginUser(
        username: _txtusernameController.text,
        password: _txtpasswordController.text,
      );
      log(login.toString());
      if (login) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
    } catch (_) {}
  }

  void _googleButtonPress() {
    //continue...
  }
}
