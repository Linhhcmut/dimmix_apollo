import 'package:flutter/material.dart';

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
        onPageChanged: (index){
          setState(() {
            _selectedPageIndex = index;
          });
        },
        children: <Widget>[
          Container(color: Colors.blue,),
          Container(color: Colors.green,),
          Container(color: Colors.black,),
        ],
      ),
      bottomNavigationBar: _bottomBar(),
    );
  }

  Widget _bottomBar() {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "GateWay"),
        BottomNavigationBarItem(icon: Icon(Icons.light), label: "Light"),
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
