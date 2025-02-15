import 'package:cafe/screens/cafe_manger/ProfileScreen/ProfileScreen.dart';
import 'package:flutter/material.dart';

import '../../NotificationsScreen/NotificationsScreen.dart';
import '../../dashboard_screen/dashboard_screen.dart';
import '../../list_of_cafe/list_of_cafe.dart';
import '../../user/AttendanceListScreen/AttendanceListScreen.dart';
import '../EventManagmentScreen/EventManagementScreen.dart';
import '../RewardsScreen/RewardsScreen.dart';
import '../WorkSpaceManagmentScreen/WorkSpaceManagmentScreen.dart';

class CafeMangerLayout extends StatefulWidget {
  const CafeMangerLayout({super.key});

  @override
  State<CafeMangerLayout> createState() => _CafeMangerLayoutState();
}

class _CafeMangerLayoutState extends State<CafeMangerLayout> {
  List page = [
    RewardsScreen(),
    AttendanceListScreen(),
    EventManagementScreen(),
    ProfileScreen()
  ];
  int selectPage = 0;

  @override
  Widget build(BuildContext context) {
    // Get screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Use LayoutBuilder to dynamically adapt layout based on available width
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: page[selectPage],
        bottomNavigationBar: screenWidth > 600
            ? BottomNavigationBar(
                items: [
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.list), label: 'Cafe List'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.notifications), label: 'Notifications'),
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
                  BottomNavigationBarItem(
                      icon: Icon(Icons.card_giftcard_rounded), label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.grid_on_rounded), label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.calendar_month), label: ''),
                  BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
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
      ),
    );
  }
}
