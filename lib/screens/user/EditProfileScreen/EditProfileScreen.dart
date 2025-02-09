import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ChangePasswordDialog.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'تعديل الملف الشخصي',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/image/logo.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              buildTextField('الاسم', 'مساحة رو'),
              buildTextField('الوصف',
                  'مقهى ومخصصة رو | تعزز الثقافة والأدب عبر فعاليات إبداعية ضمن مبادرة #الشريك_الأدبي'),
              buildTextField('الإيميل', 'RowCafe@gmail.com'),
              buildTextField('رقم الجوال', '96654378954'),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => ChangePasswordDialog(),
                  );
                },
                child: Row(
                  children: [
                    Icon(Icons.edit, size: 20, color: Colors.grey.shade700),
                    SizedBox(width: 5),
                    Text(
                      'تغيير كلمة المرور',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade700),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade400,
                  minimumSize: Size(double.infinity, 50),
                ),
                onPressed: () {
                  // Handle save changes
                },
                child: Text(
                  'حفظ التغييرات',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, String hint) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 2,
          ),
          TextField(
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              labelText: label,
              hintText: hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey.withOpacity(.3)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey.withOpacity(.3)),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
