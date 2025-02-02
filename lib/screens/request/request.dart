import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../cafe_request_info/cafe_request_info.dart';

class RegistrationRequestsScreen extends StatelessWidget {
  const RegistrationRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'طلبات الانضمام',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          RequestItem(name: 'عرب', date: '2024/9/12'),
          RequestItem(name: 'حبر', date: '2024/9/12'),
          RequestItem(name: 'كفة', date: '2024/10/2'),
          RequestItem(name: 'هارينا', date: '2024/11/2'),
        ],
      ),

    );
  }
}

class RequestItem extends StatelessWidget {
  final String name;
  final String date;

  const RequestItem({required this.name, required this.date});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'تاريخ الطلب $date',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => RequestReviewScreen());
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.amber[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
              ),
              child: Text(
                'مراجعة الطلب',
                style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
