import 'package:douban/module/home/home_page.dart';
import 'package:douban/module/personal/personal_page.dart';
import 'package:flutter/material.dart';

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  PageController _pageController = PageController();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease
    );
  }

  void _onPageChanged(int index) {
    _selectedIndex = index;
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem> [
          BottomNavigationBarItem(icon: Icon(Icons.home),title: Text('首页')),
          BottomNavigationBarItem(icon: Icon(Icons.person),title: Text('我的'))
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: PageView(
        children: <Widget>[
          HomePage(),
          PersonalPage()
        ],
        controller: _pageController,
        onPageChanged: _onPageChanged,
      ),
    );
  }
}