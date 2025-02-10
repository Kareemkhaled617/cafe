import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SendNotificationScreen extends StatelessWidget {
  final TextEditingController _notificationController = TextEditingController();

  SendNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('إرسال إشعار',
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
          mainAxisSize: MainAxisSize.max,
          children: [
            _buildTextField(),
            SizedBox(height: 20),
            _buildSendButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField() {
    return TextField(
      controller: _notificationController,
      maxLines: 5,
      decoration: InputDecoration(
        hintText: 'أدخل نص...',
        hintStyle:
            TextStyle(fontFamily: 'Tajawal', fontSize: 16, color: Colors.grey),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  Widget _buildSendButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF1a2833),
        minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text('إرسال',
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontFamily: 'Tajawal')),
    );
  }
}
