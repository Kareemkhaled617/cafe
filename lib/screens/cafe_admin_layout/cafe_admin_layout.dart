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
    return Scaffold(
      backgroundColor: Colors.white,
      body: page[selectPage],
      bottomNavigationBar: BottomNavigationBar(
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
