import 'package:flutter/material.dart';
import 'package:garage_apollo/src/blocs/login_bloc.dart';
import 'package:garage_apollo/src/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'src/pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: Provider<LoginBloc>.value(
      //   value: LoginBloc(),
      //   child: LoginPage(),
      // ),
      home: HomePage(),
    );
  }
}
