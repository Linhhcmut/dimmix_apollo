import 'package:flutter/material.dart';

class ListGateWayPage extends StatefulWidget {
  @override
  _ListGateWayPageState createState() => _ListGateWayPageState();
}

class _ListGateWayPageState extends State<ListGateWayPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: ListView(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Gateway 1",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "Detail gateway 1",
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Gateway 2",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "Detail gateway 2",
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
