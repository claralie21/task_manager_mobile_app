import 'package:flutter/material.dart';
import 'package:task_manager_mobile_app/pages/calendar_page.dart';
import 'package:task_manager_mobile_app/pages/home_page.dart';
import 'package:task_manager_mobile_app/pages/work_page.dart';
import 'package:task_manager_mobile_app/pages/settings_page.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    HomePage(),
    CalendarPage(),
    WorkPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Work',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'User Settings',
          ),
        ],
        selectedItemColor: Colors.orangeAccent.shade400,
      ),
      body: _pages[_selectedIndex]
    );
  }
}