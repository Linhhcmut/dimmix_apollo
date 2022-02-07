import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:garage_apollo/src/blocs/signUp_bloc.dart';
import 'package:garage_apollo/src/constants/signUp_constant.dart';
import 'package:garage_apollo/src/pages/home_page.dart';
import 'package:garage_apollo/src/pages/login_page.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  SignUpBloc _signUpBloc = SignUpBloc();

  TextEditingController _txtusernameController = TextEditingController();
  TextEditingController _txtemailController = TextEditingController();
  TextEditingController _txtpasswordController = TextEditingController();
  TextEditingController _txtnameController = TextEditingController();
  TextEditingController _txtphoneController = TextEditingController();

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    var signupBloc = Provider.of<SignUpBloc>(context);
    _txtusernameController.addListener(() {
      signupBloc.isValidUsername(_txtusernameController.text);
    });
    _txtemailController.addListener(() {
      signupBloc.isValidEmail(_txtemailController.text);
    });
    _txtpasswordController.addListener(() {
      signupBloc.isValidPassword(_txtpasswordController.text);
    });
    _txtnameController.addListener(() {
      signupBloc.isValidName(_txtnameController.text);
    });
    _txtphoneController.addListener(() {
      signupBloc.isValidPhone(_txtphoneController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Consumer<SignUpBloc>(
          builder: (context, signupBloc, child) => Padding(
            padding: const EdgeInsets.fromLTRB(paddingVerticalListView, 0,
                paddingBottomListView, paddingVerticalListView),
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: paddingLogoAndTop,
                ),
                SizedBox(
                  height: heightLogo,
                  child: Image.asset(logoImage),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: paddingVerticalSignUpText),
                  child: Center(
                    child: Text(
                      signUpText,
                      style: TextStyle(
                        fontSize: sizeSignUpText,
                        color: colorSignUpText,
                      ),
                    ),
                  ),
                ),
                StreamBuilder(
                    stream: signupBloc.username,
                    builder: (context, snapshot) {
                      return TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(borderTFFAndButton),
                          ),
                          hintText: hintTextUserName,
                          hintStyle: TextStyle(color: colorHintText),
                          prefixIcon: userNameIcon,
                        ),
                        controller: _txtusernameController,
                      );
                    }),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: paddingVerticalTextFF),
                  child: StreamBuilder(
                      stream: signupBloc.email,
                      builder: (context, snapshot) {
                        return TextFormField(
                          controller: _txtemailController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(borderTFFAndButton),
                            ),
                            hintText: hintTextEmail,
                            hintStyle: TextStyle(color: colorHintText),
                            prefixIcon: emailIcon,
                          ),
                        );
                      }),
                ),
                StreamBuilder(
                    stream: signupBloc.password,
                    builder: (context, snapshot) {
                      return TextFormField(
                        controller: _txtpasswordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(borderTFFAndButton),
                          ),
                          hintText: hintTextPassword,
                          hintStyle: TextStyle(color: colorHintText),
                          prefixIcon: passwordIcon,
                        ),
                      );
                    }),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: paddingVerticalTextFF),
                  child: StreamBuilder(
                      stream: signupBloc.password,
                      builder: (context, snapshot) {
                        return TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(borderTFFAndButton),
                            ),
                            hintText: hintTextPasswordAgain,
                            hintStyle: TextStyle(color: colorHintText),
                            prefixIcon: passwordIcon,
                          ),
                        );
                      }),
                ),
                StreamBuilder(
                    stream: signupBloc.name,
                    builder: (context, snapshot) {
                      return TextFormField(
                        controller: _txtnameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(borderTFFAndButton),
                          ),
                          hintText: hintTextFullName,
                          hintStyle: TextStyle(color: colorHintText),
                          prefixIcon: fulnameIcon,
                        ),
                      );
                    }),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: paddingVerticalTextFF),
                  child: StreamBuilder(
                      stream: signupBloc.phone,
                      builder: (context, snapshot) {
                        return TextFormField(
                          controller: _txtphoneController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(borderTFFAndButton),
                            ),
                            hintText: hintTextphoneNumber,
                            hintStyle: TextStyle(color: colorHintText),
                            prefixIcon: phoneIcon,
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: paddingVerticalTextFF),
                  child: SizedBox(
                    height: heightButtonSignUp,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(borderTFFAndButton),
                        ),
                        primary: colorButtonSignUp,
                      ),
                      onPressed: _signUpButtonPress,
                      child: Text(
                        buttonTextSignUp,
                        style: TextStyle(
                          fontSize: fontSizeTextSizeUp,
                          fontWeight: fontWeightButtonText,
                          color: colorButtonSignUpText,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: paddingVerticalTextFF),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        textHaveAccount,
                        style: TextStyle(fontSize: fontSizeHaveAccount),
                      ),
                      GestureDetector(
                        onTap: _loginTextPress,
                        child: Text(
                          textHaveAccountLogin,
                          style: TextStyle(
                            color: colorHaveAccountLogin,
                            fontSize: fontSizeHaveAccount,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _loginTextPress() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }

  void _signUpButtonPress() async {
    try {
      bool signUp = await _signUpBloc.signUpUser(
        username: _txtusernameController.text,
        email: _txtemailController.text,
        password: _txtpasswordController.text,
        name: _txtnameController.text,
        phone: _txtphoneController.text,
      );
      if (signUp) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    } catch (_) {}
  }
}
