import 'package:cafe/screens/user/MyTicketsScreen/MyTicketsScreen.dart';
import 'package:cafe/screens/user/WalletScreen/WalletScreen.dart';
import 'package:flutter/material.dart';

import '../../dashboard_screen/dashboard_screen.dart';
import '../../list_of_cafe/list_of_cafe.dart';
import '../HomeScreen/HomeScreen.dart';
import '../NotificationsScreen/NotificationsScreen.dart';
import '../UserProfileScreen/UserProfileScreen.dart';

class UserLayout extends StatefulWidget {
  const UserLayout({super.key});

  @override
  State<UserLayout> createState() => _UserLayoutState();
}

class _UserLayoutState extends State<UserLayout> {
  List page = [
    UserProfileScreen(),
    NewScreen(),
    WalletScreen(),
    MyTicketsScreen()
  ];
  int selectPage = 0;

  @override
  Widget build(BuildContext context) {
    // Get screen width and height
    double screenWidth = MediaQuery.of(context).size.width;

    // Use LayoutBuilder to dynamically adapt layout based on available width
    return Scaffold(
      backgroundColor: Colors.white,
      body: page[selectPage],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.airplane_ticket_sharp), label: ''),
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
