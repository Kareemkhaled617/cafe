import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../dashboard_screen/dashboard_screen.dart';
import '../list_of_cafe/list_of_cafe.dart';

class NotificationsScreen extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {
      'title': 'إضافة فعالية جديدة :رو كافيه',
      'time': 'منذ يومين',
    },
    {
      'title': 'إضافة ساعة عمل :رو كافيه',
      'time': 'منذ أسبوع',
    },
    {
      'title': 'تم تغيير الغلاف الشخصي :رو كافيه',
      'time': 'منذ 3 أسابيع',
    },
  ];
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Get.to(DashboardScreen());
        break;
      case 1:
        Get.to(CafeListScreen());
        break;
      case 2:
        Get.to(NotificationsScreen());

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
    return Scaffold( bottomNavigationBar: BottomNavigationBar(
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.white,
      onTap: _onItemTapped,
      items: [
        _buildNavItem(Icons.home, '',0),
        _buildNavItem(Icons.list,"", 1),
        _buildNavItem(Icons.notifications, "", 2),

      ],
    ),
      backgroundColor: Colors.white,
      appBar: AppBar(leading: Text(''),
        title: Text('التنبيهات',
            style: TextStyle(
                color: Color(0xFF0a2332),
                fontFamily: 'Rubik',
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            return _buildNotificationCard(notifications[index]);
          },
        ),
      ),

    );
  }

  Widget _buildNotificationCard(Map<String, String> notification) {
    return Card(color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(notification['title']!,
                style: TextStyle(
                    fontSize: 16, fontFamily: 'Rubik',color:  Color(0xFF0a2332), fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text(notification['time']!,
                style: TextStyle(
                    fontSize: 14, fontFamily: 'Rubik', color: Color(0xFF0a2332),)),
          ],
        ),
      ),
    );
  }


  }

