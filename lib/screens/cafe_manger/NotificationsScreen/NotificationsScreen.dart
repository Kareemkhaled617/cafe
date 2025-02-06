import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Get.back(),
          ),
          centerTitle: true,
          title: Text(
            'إشعاراتي',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
              fontFamily: 'Tajawal',
            ),
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                NotificationCard(
                  title: 'حوارات ثقافية',
                  description:
                      'تذكير: فعاليتك للحوار الثقافي قادمة، تابع التحديثات وآخر الإشعارات المتعلقة بالفعالية',
                  date: '2024-3-13 | 6:00 مساءً',
                  imageUrl: 'assets/image/logo.png',
                  constraints: constraints,
                ),
                NotificationCard(
                  title: 'بناء الجسور',
                  description:
                      'تنبيه: تم تعديل موعد فعالية "بناء الجسور". يرجى متابعة التحديثات لمعرفة التفاصيل الجديدة',
                  date: '2924-5-20 | 4:30 مساءً',
                  imageUrl: 'assets/image/logo.png',
                  constraints: constraints,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Notification Card Widget
class NotificationCard extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final String imageUrl;
  final BoxConstraints constraints;

  NotificationCard({
    required this.title,
    required this.description,
    required this.date,
    required this.imageUrl,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    double cardWidth = constraints.maxWidth > 500 ? 500 : constraints.maxWidth;

    return Container(
      width: cardWidth,
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imageUrl,
              width: double.infinity,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Tajawal'),
            textAlign: TextAlign.right,
          ),
          SizedBox(height: 5),
          Text(
            description,
            style: TextStyle(
                fontSize: 14, fontFamily: 'Tajawal', color: Colors.black87),
            textAlign: TextAlign.right,
          ),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'التاريخ: $date',
              style: TextStyle(
                  fontSize: 14, fontFamily: 'Tajawal', color: Colors.grey[600]),
            ),
          ),
        ],
      ),
    );
  }
}
