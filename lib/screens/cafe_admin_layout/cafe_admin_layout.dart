import 'package:flutter/material.dart';

import '../NotificationsScreen/NotificationsScreen.dart';
import '../dashboard_screen/dashboard_screen.dart';
import '../list_of_cafe/list_of_cafe.dart';

class CafeAdminLayout extends StatefulWidget {
  const CafeAdminLayout({super.key});

  @override
  State<CafeAdminLayout> createState() => _CafeAdminLayoutState();
}

class _CafeAdminLayoutState extends State<CafeAdminLayout> {
  List page = [DashboardScreen(), CafeListScreen(), NotificationsScreen()];
  int selectPage = 0;

  @override
  Widget build(BuildContext context) {
    // Get screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Use LayoutBuilder to dynamically adapt layout based on available width
    return Scaffold(
      backgroundColor: Colors.white,
      body: page[selectPage],
      bottomNavigationBar: screenWidth > 600
          ? BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Cafe List'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifications'),
        ],
        currentIndex: selectPage,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            selectPage = index;
          });
        },
      )
          : BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
        ],
        currentIndex: selectPage,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            selectPage = index;
          });
        },
      ),
    );
  }
}
