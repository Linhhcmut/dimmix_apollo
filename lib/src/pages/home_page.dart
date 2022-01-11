import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "HomePage",
          style: TextStyle(
            fontSize: 17,
          ),
        ),
      ),
      body: Center(
        child: Text(
          "Hello",
          style: TextStyle(
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}
