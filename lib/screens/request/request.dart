import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../cafe_request_info/cafe_request_info.dart';

class RegistrationRequestsScreen extends StatelessWidget {
  const RegistrationRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // الحصول على حجم الشاشة
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'طلبات الانضمام',
          style: TextStyle(fontSize: width * 0.08, fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(width * 0.04),
        children: [
          RequestItem(name: 'عرب', date: '2024/9/12', width: width),
          RequestItem(name: 'حبر', date: '2024/9/12', width: width),
          RequestItem(name: 'كفة', date: '2024/10/2', width: width),
          RequestItem(name: 'هارينا', date: '2024/11/2', width: width),
        ],
      ),
    );
  }
}

class RequestItem extends StatelessWidget {
  final String name;
  final String date;
  final double width;

  const RequestItem({required this.name, required this.date, required this.width});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: width * 0.02),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.all(width * 0.04),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: width * 0.05,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: width * 0.01),
                Text(
                  'تاريخ الطلب $date',
                  style: TextStyle(
                    fontSize: width * 0.045,
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
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.06,
                  vertical: width * 0.02,
                ),
              ),
              child: Text(
                'مراجعة الطلب',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: width * 0.045,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
