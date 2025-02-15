import 'package:cafe/screens/cafe_manger/AttendanceListScreen/AttendanceListScreen.dart';
import 'package:cafe/screens/cafe_manger/SendNotificationScreen/SendNotificationScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../user/CustomerInfoScreen/CustomerInfoScreen.dart';
import '../../user/QRAttendanceScreen/QRAttendanceScreen.dart';
import '../EventManagmentScreen/EventManagementScreen.dart';
import '../ProfileScreen/ProfileScreen.dart';
import '../RewardsScreen/RewardsScreen.dart';
import '../WorkSpaceManagmentScreen/WorkSpaceManagmentScreen.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
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
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
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
      appBar: AppBar(

        title: Text('لوحة التحكم',
            style: TextStyle(  color: Color(0xFF0a2332),

                fontFamily: 'Rubik',
                fontSize: 22,
                fontWeight: FontWeight.w700)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,

        leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () => Get.back(),
      ),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'مناقشة كتاب عبق الحرف',
                style: TextStyle(
                    fontSize: 22,
                    color: Color(0xFF0a2332),
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 20),
              _buildActionButton('عرض قائمة الحضور', Icons.view_list_outlined, () {Get.to(AttendanceListScreen());}),
              SizedBox(
                height: 40,
              ),
              _buildActionButton('تسجيل الحضور عبر رمز QR', Icons.qr_code_scanner, () {Get.to(QRAttendanceScreen());}),
              SizedBox(height: 40),
              _buildActionButton('إرسال إشعار', Icons.notifications, () {Get.to(CustomerInfoScreen());}),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(
      String title, IconData icon, VoidCallback onPressed) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: 22,
        color: Colors.white,
      ),
      label: Text(title,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              fontFamily: 'Rubik')),
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF0a2332),
        padding: EdgeInsets.symmetric(vertical: 12),
        minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
