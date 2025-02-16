import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditUserProfileScreen extends StatelessWidget {
  const EditUserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الملف الشخصي',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
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
