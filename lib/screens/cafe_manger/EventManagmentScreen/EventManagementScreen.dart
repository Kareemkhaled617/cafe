import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../CreateEventScreen/CreateEventScreen.dart';

class EventManagementScreen extends StatelessWidget {
  const EventManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          'assets/image/logo.png',
          fit: BoxFit.cover,
        ),
        title: Text('قائمة الفعاليات',
            style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 22,
                fontWeight: FontWeight.w900)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Get.to(CreateEventScreen());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF1a2833),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              child: Text('إنشاء فعالية',
                  style: TextStyle(
                      color: Colors.white, fontSize: 14, fontFamily: 'Rubik')),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            _eventCard('مناقشة كتاب عميق الحرف', '1 ديسمبر 2024',
                'جلسة حوارية تقديم أ. حامد الطاهري'),
            _eventCard('القبطان وبر الأمان', '12 ديسمبر 2024',
                'أمسية أدبية تقديم أ. أمينة أبو بكر'),
            _eventCard('من الفكرة إلى الدهشة', '15 ديسمبر 2024',
                'ورشة عمل من تقديم أ. شهد المطرفي'),
          ],
        ),
      ),
    );
  }

  Widget _eventCard(String title, String date, String description) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(title,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Tajawal')),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.settings,
                      size: 30,
                    ))
              ],
            ),
            SizedBox(height: 6),
            Text('التاريخ: $date', style: TextStyle(fontFamily: 'Rubik')),
            SizedBox(height: 4),
            Text(description, style: TextStyle(fontFamily: 'Rubik')),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.withOpacity(.4),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  child: Text('تعديل',
                      style:
                          TextStyle(fontFamily: 'Rubik', color: Colors.black)),
                ),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.withOpacity(.4),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  child: Text('حذف',
                      style:
                          TextStyle(color: Colors.black, fontFamily: 'Rubik')),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
