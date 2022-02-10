import 'package:flutter/material.dart';
import 'package:garage_apollo/src/pages/home/home_home_page.dart';
import 'package:garage_apollo/src/pages/home/setting_home_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedPageIndex = 0;
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedPageIndex = index;
          });
        },
        children: <Widget>[
          ListGateWayPage(),
          Container(
            color: Colors.green,
          ),
          SettingPage(),
        ],
      ),
      bottomNavigationBar: _bottomBar(),
    );
  }

  Widget _bottomBar() {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Trang chủ"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "GateWay"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Cài đặt"),
      ],
      selectedItemColor: Color(0xfffa6400),
      currentIndex: _selectedPageIndex,
      onTap: onTapped,
    );
  }

  void onTapped(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 200),
      curve: Curves.linear,
    );
  }
}
