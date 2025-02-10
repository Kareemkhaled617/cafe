import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../cafe_manger/FeedbackScreen/FeedbackScreen.dart';
import '../../cafe_manger/ReviewScreen/ReviewScreen.dart';

class EventFeedbackScreen extends StatelessWidget {
  const EventFeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'آراء الحضور',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  _feedbackCard(
                    'مناقشة كتاب عبق الحرف',
                    '1 ديسمبر 2024',
                    'جلسة حوارية تقديم أ. حامد الطاهري',
                  ),
                  _feedbackCard(
                    'القبطان وبر الأمان',
                    '12 ديسمبر 2024',
                    'أمسية أدبية تقديم أ. أمينة أبو بكر',
                  ),
                  _feedbackCard(
                    'من الفكرة إلى الدهشة',
                    '15 ديسمبر 2024',
                    'ورشة عمل من تقديم أ. شهد المطرفي',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _feedbackCard(String title, String date, String description) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'التاريخ: $date',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: 4),
            Text(
              description,
              style: TextStyle(fontSize: 16, color: Colors.grey[800]),
            ),
            SizedBox(height: 8),
            Align(
              alignment: Alignment.centerLeft,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[800],
                ),
                onPressed: () {
                  Get.to(FeedbackScreen());
                },
                child: Text(
                  'عرض الآراء',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
