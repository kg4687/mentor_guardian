import 'package:flutter/material.dart';
import '../views/home_page.dart';
import '../views/learning_page.dart';
import '../views/explore_page.dart';
import '../views/profile_page.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // List of pages for each tab
  final List<Widget> _pages = [
    HomePage(),
    LearningPage(),
    ExplorePage(),
    ProfilePage(),
  ];

  // Method to change the selected index
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.pinkAccent,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _onItemTapped, // Handle tab selection
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('images/home_icon.png', width: 24),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Image.asset('images/learning_icon.png', width: 24),
            label: "Learning",
          ),
          BottomNavigationBarItem(
            icon: Image.asset('images/explore_icon.png', width: 24),
            label: "Explore",
          ),
          BottomNavigationBarItem(
            icon: Image.asset('images/profile_icon.png', width: 24),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
