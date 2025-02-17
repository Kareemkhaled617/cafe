import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SendNotificationScreen extends StatelessWidget {
  final TextEditingController _notificationController = TextEditingController();

  SendNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.airplane_ticket_sharp), label: ''),
        ],

        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: (index) {

        },
      ),
      appBar: AppBar(
        leading:  IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
        title: Text('إرسال إشعار',
            style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 22,
                fontWeight: FontWeight.w500)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(decoration: BoxDecoration(color: Colors.white),
        child: Padding(
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
            TextStyle(fontFamily: 'Rubik', fontSize: 16, color: Colors.grey),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  Widget _buildSendButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF0a2332),
        minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text('إرسال',
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontFamily: 'Rubik')),
    );
  }
}
