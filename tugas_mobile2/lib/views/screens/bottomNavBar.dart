import 'package:flutter/material.dart';
import 'package:tugas_mobile2/utils/colors.dart';
import 'package:tugas_mobile2/views/screens/home_screen.dart';
import 'package:tugas_mobile2/views/screens/info_screen.dart';
import 'package:tugas_mobile2/views/screens/logout_screen.dart';
import 'package:tugas_mobile2/views/screens/stopwatch.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    StopwatchScreen(),
    InfoScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorsCalc.hexToColor(
            ColorsCalc.green), // Change the background color
        selectedItemColor: ColorsCalc.hexToColor(ColorsCalc.orange),
        unselectedItemColor: ColorsCalc.hexToColor(ColorsCalc.white),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            label: 'Stopwatch',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Info',
          ),
        ],
      ),
    );
  }
}
