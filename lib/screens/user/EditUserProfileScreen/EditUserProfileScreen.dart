import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../user_layout/user_layout.dart';

class EditUserProfileScreen extends StatelessWidget {
  EditUserProfileScreen({super.key});

  int _selectedIndex = 1; // العنصر المحدد حاليًا

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Get.off(UserLayout(
          selectPage: 0,
        ));
        break;
      case 1:
        Get.off(UserLayout(
          selectPage: 1,
        ));
        break;
      case 2:
        Get.off(UserLayout(
          selectPage: 2,
        ));

        break;
      case 3:
        Get.off(UserLayout(
          selectPage: 3,
        ));

        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.airplane_ticket_sharp), label: ''),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          _onItemTapped(index);
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('الملف الشخصي',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField(label: 'الاسم', hint: 'أحمد ناصر'),
              _buildTextField(label: 'الإيميل', hint: 'ahmed22@gmail.com'),
              _buildTextField(label: 'رقم الهاتف', hint: '05732217633'),
              _buildTextField(
                  label: 'كلمة السر', hint: '**********', obscureText: true),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildButton(
                      text: 'حذف الحساب',
                      color: Colors.red,
                      onPressed: () {},
                      txtColor: Colors.white),
                  _buildButton(
                      text: 'تحديث',
                      color: Color(0xFFe8dfc2),
                      onPressed: () {},
                      txtColor: Colors.black),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      {required String label, required String hint, bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
          TextField(
            obscureText: obscureText,
            decoration: InputDecoration(
              hintText: hint,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              filled: true,
              fillColor: Colors.grey.shade50,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(
      {required String text,
      required Color color,
      required Color txtColor,
      required VoidCallback onPressed}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      onPressed: onPressed,
      child: Text(text,
          style: TextStyle(color: txtColor, fontWeight: FontWeight.bold)),
    );
  }
}
