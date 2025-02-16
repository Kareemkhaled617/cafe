import 'package:cafe/screens/cafe_manger/AdminDashboardScreen/AdminDashboardScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../CreateEventScreen/CreateEventScreen.dart';
import '../ProfileScreen/ProfileScreen.dart';
import '../RewardsScreen/RewardsScreen.dart';
import '../WorkSpaceManagmentScreen/WorkSpaceManagmentScreen.dart';

class EventManagementScreen extends StatefulWidget {
  const EventManagementScreen({super.key});

  @override
  State<EventManagementScreen> createState() => _EventManagementScreenState();
}

class _EventManagementScreenState extends State<EventManagementScreen> {
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
        leading: Image.asset(
          'assets/image/logo.png',
          fit: BoxFit.cover,
        ),
        title: Text('  قائمة الفعاليات',
            style: TextStyle(color:  Color(0xFF0a2332),
                fontFamily: 'Rubik',
                fontSize: 22,
                fontWeight: FontWeight.w900)),
        backgroundColor: Colors.white,
        elevation: 0,

        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Get.to(CreateEventScreen());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:  Color(0xFF0a2332),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              child: Text('إنشاء فعالية',
                  style: TextStyle(
                      color: Colors.white, fontSize: 14, fontFamily: 'Rubik')),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            _eventCard('مناقشة كتاب عميق الحرف', '1 ديسمبر 2024',
                'جلسة حوارية تقديم أ. حامد الطاهري'),
            _eventCard('القبطان وبر الأمان', '12 ديسمبر 2024',
                'أمسية أدبية تقديم أ. أمينة أبو بكر'),
            _eventCard('من الفكرة إلى الدهشة', '15 ديسمبر 2024',
                'ورشة عمل من تقديم أ. شهد المطرفي'),
          ],
        ),
      ),
    );
  }

  Widget _eventCard(String title, String date, String description) {
    return Card(color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(title,
                      style: TextStyle(color: Color(0xFF0a2332),
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Rubik')),
                ),
                IconButton(
                    onPressed: () {Get.to(AdminDashboardScreen());},
                    icon: Icon(
                      Icons.settings,color:  Color(0xFF0a2332),
                      size: 30,
                    ))
              ],
            ),
            SizedBox(height: 6),
            Text('التاريخ: $date', style: TextStyle(fontSize:14,color: Color(0xFF0a2332),fontFamily: 'Rubik')),
            SizedBox(height: 4),
            Text(description, style: TextStyle(fontSize:14,color: Color(0xFF0a2332), fontFamily: 'Rubik')),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFd3d3d3),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  child: Text('تعديل',
                      style:
                          TextStyle(fontFamily: 'Rubik', color: Colors.black)),
                ),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor:  Color(0xFFd3d3d3),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  child: Text('حذف',
                      style:
                          TextStyle(color: Colors.black, fontFamily: 'Rubik')),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
