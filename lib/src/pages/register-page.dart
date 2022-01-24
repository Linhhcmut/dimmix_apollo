import 'package:flutter/material.dart';
import 'package:garage_apollo/src/constants/signUp_constant.dart';
import 'package:garage_apollo/src/pages/login_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
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
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderTFFAndButton),
                  ),
                  hintText: hintTextUserName,
                  hintStyle: TextStyle(color: colorHintText),
                  prefixIcon: userNameIcon,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: paddingVerticalTextFF),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(borderTFFAndButton),
                    ),
                    hintText: hintTextEmail,
                    hintStyle: TextStyle(color: colorHintText),
                    prefixIcon: emailIcon,
                  ),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderTFFAndButton),
                  ),
                  hintText: hintTextPassword,
                  hintStyle: TextStyle(color: colorHintText),
                  prefixIcon: passwordIcon,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: paddingVerticalTextFF),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(borderTFFAndButton),
                    ),
                    hintText: hintTextPasswordAgain,
                    hintStyle: TextStyle(color: colorHintText),
                    prefixIcon: passwordIcon,
                  ),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderTFFAndButton),
                  ),
                  hintText: hintTextFullName,
                  hintStyle: TextStyle(color: colorHintText),
                  prefixIcon: fulnameIcon,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: paddingVerticalTextFF),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(borderTFFAndButton),
                    ),
                    hintText: hintTextphoneNumber,
                    hintStyle: TextStyle(color: colorHintText),
                    prefixIcon: phoneIcon,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: paddingVerticalTextFF),
                child: SizedBox(
                  height: heightButtonSignUp,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(borderTFFAndButton),
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
                padding:
                    const EdgeInsets.symmetric(vertical: paddingVerticalTextFF),
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

  void _signUpButtonPress(){
    //continue...
  }
}
