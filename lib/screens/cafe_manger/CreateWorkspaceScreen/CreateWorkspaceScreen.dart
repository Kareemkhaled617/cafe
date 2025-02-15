import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateWorkspaceScreen extends StatelessWidget {
  const CreateWorkspaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('إنشاء مساحة عمل',
            style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 22,
                fontWeight: FontWeight.w900)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextField('الاسم', 'أدخل اسم مساحة العمل'),
            SizedBox(height: 12),
            _buildTextField('الوصف', 'أدخل وصف'),
            SizedBox(height: 12),
            _buildTextField('السعة', '6'),
            SizedBox(height: 12),
            _buildTextField('السعر بالساعة', '30'),
            SizedBox(height: 12),
            _buildTextField('الساعات المتاحة', ''),
            SizedBox(height: 12),
            _buildImageUpload(),
            SizedBox(height: 20),
            _buildCreateButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$label  :",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                fontFamily: 'Rubik')),
        SizedBox(height: 6),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: Colors.black54,
                width: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildImageUpload() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('الصورة:', style: TextStyle(fontSize: 16, fontFamily: 'Rubik')),
        SizedBox(height: 6),
        Container(
          height: 60,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black54)),
          child: Center(
            child: Icon(Icons.upload_file, size: 30, color: Colors.black54),
          ),
        ),
      ],
    );
  }

  Widget _buildCreateButton() {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF1a2833),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        child: Text('إنشاء',
            style: TextStyle(
                fontSize: 20, fontFamily: 'Rubik', color: Colors.white)),
      ),
    );
  }
}
