import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('لوحة التحكم',
            style: TextStyle(
                fontFamily: 'Tajawal',
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
          children: [
            Text(
              'مناقشة كتاب عبق الحرف',
              style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.w900),
            ),
            SizedBox(height: 20),
            _buildActionButton('عرض قائمة الحضور', Icons.list_alt, () {}),
            SizedBox(
              height: 40,
            ),
            _buildActionButton('تسجيل الحضور عبر رمز QR', Icons.qr_code, () {}),
            SizedBox(height: 40),
            _buildActionButton('إرسال إشعار', Icons.notifications, () {}),
          ],
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
              fontFamily: 'Tajawal')),
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF1a2833),
        padding: EdgeInsets.symmetric(vertical: 12),
        minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
