import 'package:cafe/screens/cafe_manger/SendNotificationScreen/SendNotificationScreen.dart';
import 'package:cafe/screens/cafe_manger/WorkSpaceManagmentScreen/WorkSpaceManagmentScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../cafe_manger/EventManagmentScreen/EventManagementScreen.dart';
import '../../cafe_manger/ProfileScreen/ProfileScreen.dart';
import '../../cafe_manger/RewardsScreen/RewardsScreen.dart';


class CustomerInfoScreen extends StatefulWidget {
  const CustomerInfoScreen({super.key});

  @override
  State<CustomerInfoScreen> createState() => _CustomerInfoScreenState();
}

class _CustomerInfoScreenState extends State<CustomerInfoScreen> {
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'معلومات العميل',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'مساحة العمل المحجوزة: مكتب خاص',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'الوقت: 5م - 7م',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'اسم العميل: أحمد',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'رقم الجوال: 966575893278',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {Get.to(SendNotificationScreen());},
              label: Icon(Icons.notifications, color: Colors.white),
              icon: Text(
                'إرسال إشعار للعميل   ',
                style: TextStyle(fontSize: 18,fontFamily: 'Rubik',color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 44),
                backgroundColor: Color(0xFF0a2332),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

