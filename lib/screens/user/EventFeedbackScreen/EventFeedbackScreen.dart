import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../cafe_manger/EventManagmentScreen/EventManagementScreen.dart';
import '../../cafe_manger/FeedbackScreen/FeedbackScreen.dart';
import '../../cafe_manger/ProfileScreen/ProfileScreen.dart';
import '../../cafe_manger/ReviewScreen/ReviewScreen.dart';
import '../../cafe_manger/RewardsScreen/RewardsScreen.dart';
import '../../cafe_manger/WorkSpaceManagmentScreen/WorkSpaceManagmentScreen.dart';

class EventFeedbackScreen extends StatefulWidget {
  const EventFeedbackScreen({super.key});

  @override
  State<EventFeedbackScreen> createState() => _EventFeedbackScreenState();
}

class _EventFeedbackScreenState extends State<EventFeedbackScreen> {

  BottomNavigationBarItem _buildNavItem(IconData icon, String label,
      int index) {
    return BottomNavigationBarItem(
      icon: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: _selectedIndex == index ? Color(0xFF0a2332) : Colors
              .transparent,

        ),
        child: Icon(icon,
            color: _selectedIndex == index ? Colors.white : Color(0xFF0a2332)),
      ),
      label: label,
    );
  }

  int _selectedIndex = 3;

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
          _buildNavItem(Icons.card_giftcard_rounded, '', 0),
          _buildNavItem(Icons.grid_on_rounded, '', 1),
          _buildNavItem(Icons.calendar_month, "", 2),
          _buildNavItem(Icons.person, "", 3),
        ],
      ),


      appBar: AppBar(
        title: Text(
          'آراء الحضور',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  _feedbackCard(
                    'مناقشة كتاب عبق الحرف',
                    '1 ديسمبر 2024',
                    'جلسة حوارية تقديم أ. حامد الطاهري',
                  ),
                  _feedbackCard(
                    'القبطان وبر الأمان',
                    '12 ديسمبر 2024',
                    'أمسية أدبية تقديم أ. أمينة أبو بكر',
                  ),
                  _feedbackCard(
                    'من الفكرة إلى الدهشة',
                    '15 ديسمبر 2024',
                    'ورشة عمل من تقديم أ. شهد المطرفي',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _feedbackCard(String title, String date, String description) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'التاريخ: $date',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: 4),
            Text(
              description,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            SizedBox(height: 8),
            Align(
              alignment: Alignment.centerLeft,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFd3d3d3),
                ),
                onPressed: () {
                  Get.to(FeedbackScreen());
                },
                child: Text(
                  'عرض الآراء',
                  style: TextStyle(color: Colors.black,
                      fontFamily: 'Rubik',
                      fontSize: 12,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
