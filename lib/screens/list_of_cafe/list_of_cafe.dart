
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../NotificationsScreen/NotificationsScreen.dart';
import '../dashboard_screen/dashboard_screen.dart';
import '../edit_cafe_info/cafe_info.dart';

class CafeListScreen extends StatefulWidget {
  const CafeListScreen({super.key});

  @override
  State<CafeListScreen> createState() => _CafeListScreenState();
}

class _CafeListScreenState extends State<CafeListScreen> {
  int _selectedIndex = 1;

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
    return Scaffold(backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
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
      appBar: AppBar(backgroundColor: Colors.white,
        leading: Text(''),
        title: Text(
          'قائمة المقاهي',
          style: TextStyle(fontFamily:'Rubik',fontSize: 28, fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          CafeItem(name: 'رو كافيه'),
          CafeItem(name: 'كفة'),
          CafeItem(name: 'نادي الكتاب'),
        ],
      ),
    );
  }
}

class CafeItem extends StatelessWidget {
  final String name;

  CafeItem({required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(color: Colors.white,
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Text(
          name,
          textAlign: TextAlign.end,
          style: TextStyle(fontFamily:'Rubik',color:Color(0xFF0a2332),fontSize: 18, fontWeight: FontWeight.w700),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: () {
                Get.to(() => CafeInfoScreen());
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Color(0xFFd3d3d3),
              ),
              child: Text(' عرض'),
            ),
            SizedBox(width: 8),
            TextButton(
              onPressed: () {
                showDeleteConfirmation(name);
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Color(0xFFef4444),
              ),
              child: Text(style: TextStyle(fontFamily: 'Rubik'),'حظر'),
            ),
          ],
        ),
      ),
    );
  }

  void showDeleteConfirmation(String cafeName) {
    Get.defaultDialog(
      title: 'حظر الحساب',
      titleStyle: TextStyle(
          fontSize: 22, fontWeight: FontWeight.w900, fontFamily: 'Tajawal'),
      middleText: 'هل أنت متأكد من رغبتك في حظر الحساب؟\nللتأكيد انقر على حظر',
      middleTextStyle: TextStyle(fontSize: 18, fontFamily: 'Rubik'),
      backgroundColor: Colors.white,
      radius: 10,
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          style: TextButton.styleFrom(
            backgroundColor: Colors.white,
            side: BorderSide(color: Color(0xFF0a2332)),
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          ),
          child: Text(
            'إلغاء',
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontFamily: 'Rubik'),
          ),
        ),
        ElevatedButton(
          onPressed: () {

            Get.back();
            Get.snackbar('تم الحظر', '$cafeName قد تم حظر بنجاح',
                backgroundColor: Colors.red, colorText: Colors.white);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,

            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          ),
          child: Text(
            'حظر',
            style: TextStyle(
                fontSize: 16, color: Colors.white, fontFamily: 'Rubik'),
          ),
        ),
      ],
    );
  }
}
