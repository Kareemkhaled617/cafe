import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../EventManagmentScreen/EventManagementScreen.dart';
import '../ProfileScreen/ProfileScreen.dart';
import '../RewardsScreen/RewardsScreen.dart';
import '../WorkSpaceManagmentScreen/WorkSpaceManagmentScreen.dart';

class SendNotificationScreen extends StatefulWidget {

  SendNotificationScreen({super.key});

  @override
  State<SendNotificationScreen> createState() => _SendNotificationScreenState();
}

class _SendNotificationScreenState extends State<SendNotificationScreen> {
  final TextEditingController _notificationController = TextEditingController();
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Get.to(RewardsScreen());
        break;
      case 1:
        Get.to(EventManagementScreen());
        break;
      case 2:
        Get.to(WorkspaceManagementScreen());
      case 3:
        Get.to(ProfileScreen());
        break;
    }
  }
  BottomNavigationBarItem _buildNavItem(IconData icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: _selectedIndex == index ? Color(0xFF0a2332) : Colors.transparent,

        ),
        child: Icon(icon, color: _selectedIndex == index ? Colors.white : Color(0xFF0a2332)),
      ),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(bottomNavigationBar: BottomNavigationBar(
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.white,
      onTap: _onItemTapped,
      items: [
        _buildNavItem(Icons.card_giftcard_rounded, '',0),
        _buildNavItem(Icons.grid_on_rounded,'', 1),
        _buildNavItem(Icons.calendar_month, "", 2),
        _buildNavItem(Icons.person, "", 3),
      ],
    ),
      appBar: AppBar(leading:  IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () => Get.back(),
      ),
        title: Text('إرسال إشعار',
            style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 22,
                fontWeight: FontWeight.w900)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            _buildTextField(),
            SizedBox(height: 20),
            _buildSendButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField() {
    return TextField(
      controller: _notificationController,
      maxLines: 5,
      decoration: InputDecoration(
        hintText: 'أدخل نص...',
        hintStyle:
            TextStyle(fontFamily: 'Rubik', fontSize: 16, color: Colors.grey),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  Widget _buildSendButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor:  Color.fromRGBO(10, 35, 50, 1.0),
        minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text('إرسال',
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontFamily: 'Rubik',)),
    );
  }
}
