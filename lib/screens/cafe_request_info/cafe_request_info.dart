import 'package:flutter/material.dart';

class RequestReviewScreen extends StatelessWidget {
  const RequestReviewScreen({super.key});

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
          'مراجعة الطلب',
          style: TextStyle(
            fontSize: width * 0.07,  // تعديل الحجم بناءً على عرض الشاشة
            fontWeight: FontWeight.w900,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(width * 0.04), // جعل padding ديناميكي
        child: SingleChildScrollView(
          child: Column(
            children: [
              RequestDetailItem(title: 'اسم الكافيه', value: 'عرب', width: width),
              RequestDetailItem(
                  title: 'الإيميل', value: 'abdullah.alkabi@gmail.com', width: width),
              RequestDetailItem(title: 'رقم الجوال', value: '+966 50 123 4567', width: width),
              RequestDetailItem(
                  title: 'الموقع', value: 'أيمن الحربي، السد، المدينة المنورة', width: width),
              LicenseImageSection(width: width),
              SizedBox(height: height * 0.02), // مساحة ديناميكية
              ActionButtons(width: width),
            ],
          ),
        ),
      ),
    );
  }
}

class RequestDetailItem extends StatelessWidget {
  final String title;
  final String value;
  final double width;

  const RequestDetailItem({required this.title, required this.value, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: width * 0.03), // المسافة بين العناصر ديناميكية
      padding: EdgeInsets.all(width * 0.04), // padding ديناميكي
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: width * 0.05,  // حجم النص ديناميكي
              fontWeight: FontWeight.w800,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: width * 0.01), // مسافة بين النصوص ديناميكية
          Text(
            value,
            style: TextStyle(
                fontSize: width * 0.045, // حجم النص ديناميكي
                color: Colors.black,
                fontWeight: FontWeight.w700),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }
}

class LicenseImageSection extends StatelessWidget {
  final double width;

  const LicenseImageSection({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(width * 0.04), // padding ديناميكي
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'صورة التصريح',
            style: TextStyle(
              fontSize: width * 0.06,  // حجم النص ديناميكي
              fontWeight: FontWeight.w900,
              fontFamily: 'Tajawal',
              color: Colors.black87,
            ),
          ),
          Spacer(),
          Image.asset(
            'assets/image/img.jpg', // استبدل المسار بالصورة الفعلية
            height: width * 0.2, // الحجم ديناميكي بالنسبة لعرض الشاشة
            width: width * 0.4, // الحجم ديناميكي بالنسبة لعرض الشاشة
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}

class ActionButtons extends StatelessWidget {
  final double width;

  const ActionButtons({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // "قبول" Button
        Container(
          width: width * 0.4,  // Make button width dynamic
          child: ElevatedButton(
            onPressed: () {
              // تنفيذ إجراء القبول
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[400],
              padding: EdgeInsets.symmetric(vertical: width * 0.04),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text(
              'قبول',
              style: TextStyle(
                fontSize: width * 0.04,  // حجم النص ديناميكي
                fontFamily: 'Tajawal',
                color: Colors.black,
              ),
            ),
          ),
        ),
        // "رفض" Button
        Container(
          width: width * 0.4,  // Make button width dynamic
          child: ElevatedButton(
            onPressed: () {
              // تنفيذ إجراء الرفض
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              padding: EdgeInsets.symmetric(vertical: width * 0.04),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text(
              'رفض',
              style: TextStyle(
                fontSize: width * 0.04,  // حجم النص ديناميكي
                fontFamily: 'Tajawal',
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
