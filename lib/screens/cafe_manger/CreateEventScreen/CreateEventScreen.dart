import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateEventScreen extends StatelessWidget {
  const CreateEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('إنشاء فعالية جديدة',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildTextField('عنوان الفعالية'),
              _buildTextField('وصف الفعالية', maxLines: 3),
              _buildTextField('السعر'),
              _buildDropdown('فئة الفعالية'),
              _buildTextField('الوقت'),
              _buildTextField('30.'),
              SizedBox(height: 16.0),
              _buildUploadButton(),
              SizedBox(height: 36.0),
              _buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, {int maxLines = 1}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(color: Colors.grey.withOpacity(.2))),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(color: Colors.grey.withOpacity(.2))),
          filled: true,
          fillColor: Colors.grey[200],
        ),
        maxLines: maxLines,
      ),
    );
  }

  Widget _buildDropdown(String hint) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.0),
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
          filled: true,
          fillColor: Colors.grey[200],
        ),
        items: ['فئة 1', 'فئة 2', 'فئة 3']
            .map((e) => DropdownMenuItem(child: Text(e), value: e))
            .toList(),
        onChanged: (value) {},
      ),
    );
  }

  Widget _buildUploadButton() {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(Icons.upload),
      label: Text('رفع صورة'),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.grey[300],
        minimumSize: Size(double.infinity, 50),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF1a2833),
        minimumSize: Size(double.infinity, 50),
      ),
      child: Text('إنشاء الفعالية',
          style: TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.w800)),
    );
  }
}
