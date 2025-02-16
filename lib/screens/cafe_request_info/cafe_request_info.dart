import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../cafe_manger/NotificationsScreen/NotificationsScreen.dart';
import '../dashboard_screen/dashboard_screen.dart';
import '../list_of_cafe/list_of_cafe.dart';

class RequestReviewScreen extends StatefulWidget {
  const RequestReviewScreen({super.key});

  @override
  State<RequestReviewScreen> createState() => _RequestReviewScreenState();
}

class _RequestReviewScreenState extends State<RequestReviewScreen> {
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
    // الحصول على حجم الشاشة
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Text(''),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'مراجعة الطلب',
          style: TextStyle(
            color: Color(0xFF0a2332),
            fontSize: width * 0.07,  // تعديل الحجم بناءً على عرض الشاشة
            fontWeight: FontWeight.w900,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(width * 0.04), // جعل padding ديناميكي
        child: SingleChildScrollView(
          child: Column(
            children: [
              RequestDetailItem(title: 'اسم الكافيه', value: 'عرب', width: width),
              RequestDetailItem(
                  title: 'الإيميل', value: 'abdullah.alkabi@gmail.com', width: width),
              RequestDetailItem(title: 'رقم الجوال', value: '+966 50 123 4567', width: width),
              RequestDetailItem(
                  title: 'الموقع', value: 'أيمن الحربي، السد، المدينة المنورة', width: width),
              LicenseImageSection(width: width),
              SizedBox(height: height * 0.02), // مساحة ديناميكية
              ActionButtons(width: width),
            ],
          ),
        ),
      ),
    );
  }
}

class RequestDetailItem extends StatelessWidget {
  final String title;
  final String value;
  final double width;

  const RequestDetailItem({required this.title, required this.value, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: width * 0.03), // المسافة بين العناصر ديناميكية
      padding: EdgeInsets.all(width * 0.04), // padding ديناميكي
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(

              fontSize: width * 0.05,  // حجم النص ديناميكي
              fontWeight: FontWeight.w800,
              color:  Color(0xFF0a2332),
            ),
          ),
          SizedBox(height: width * 0.01), // مسافة بين النصوص ديناميكية
          Text(
            value,
            style: TextStyle(
                fontSize: width * 0.045, // حجم النص ديناميكي
                color: Color(0xFF0a2332),
                fontWeight: FontWeight.w700),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
}

class LicenseImageSection extends StatelessWidget {
  final double width;

  const LicenseImageSection({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(width * 0.04), // padding ديناميكي
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'صورة التصريح',
            style: TextStyle(
              fontSize: width * 0.06,  // حجم النص ديناميكي
              fontWeight: FontWeight.w700,
              fontFamily: 'Rubik',
              color: Color(0xFF0a2332),
            ),
          ),
          Spacer(),
          Image.asset(
            'assets/image/file.png', // استبدل المسار بالصورة الفعلية
            height: width * 0.2, // الحجم ديناميكي بالنسبة لعرض الشاشة
            width: width * 0.4, // الحجم ديناميكي بالنسبة لعرض الشاشة
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}

class ActionButtons extends StatelessWidget {
  final double width;

  const ActionButtons({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // "قبول" Button
        Container(
          width: width * 0.4,  // Make button width dynamic
          child: ElevatedButton(
            onPressed: () {
              // تنفيذ إجراء القبول
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFd3d3d3),
              padding: EdgeInsets.symmetric(vertical: width * 0.04),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text(
              'قبول',
              style: TextStyle(
                fontSize: width * 0.04,  // حجم النص ديناميكي
                fontFamily: 'Rubik',
                color:  Color(0xFF0a2332),
              ),
            ),
          ),
        ),
        // "رفض" Button
        Container(
          width: width * 0.4,  // Make button width dynamic
          child: ElevatedButton(
            onPressed: () {
              // تنفيذ إجراء الرفض
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              padding: EdgeInsets.symmetric(vertical: width * 0.04),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text(
              'رفض',
              style: TextStyle(
                fontSize: width * 0.04,  // حجم النص ديناميكي
                fontFamily: 'Rubik',
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
