import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../cafe_manger/SendNotificationScreen/SendNotificationScreen.dart';

class CustomerInfoScreen extends StatelessWidget {
  const CustomerInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'معلومات العميل',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'مساحة العمل المحجوزة: مكتب خاص',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'الوقت: 5م - 7م',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'اسم العميل: أحمد',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'رقم الجوال: 966575893278',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                Get.to(SendNotificationScreen());
              },
              label: Icon(Icons.notifications, color: Colors.white),
              icon: Text(
                'إرسال إشعار للعميل   ',
                style: TextStyle(fontSize: 18,color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 44),
                backgroundColor: Color(0xFF1a2833),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            Spacer(),

          ],
        ),
      ),
    );
  }

}
