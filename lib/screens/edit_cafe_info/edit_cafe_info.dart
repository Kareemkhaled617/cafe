import 'package:flutter/material.dart';

class EditReviewScreen extends StatelessWidget {
  const EditReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'تعديل المعلومات',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w900,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              RequestDetailItem(title: 'اسم الكافيه', value: 'عرب'),
              RequestDetailItem(
                  title: 'الإيميل', value: 'abdullah.alkabi@gmail.com'),
              RequestDetailItem(title: 'رقم الجوال', value: '+966 50 123 4567'),
              RequestDetailItem(
                  title: 'الموقع', value: 'أيمن الحربي، السد، المدينة المنورة'),
              LicenseImageSection(),
              SizedBox(height: 20),

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

  const RequestDetailItem({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 4),
              Text(
                value,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
                textAlign: TextAlign.right,
              ),
            ],
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.edit))
        ],
      ),
    );
  }
}

class LicenseImageSection extends StatelessWidget {
  const LicenseImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
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
              fontSize: 22,
              fontWeight: FontWeight.w900,
              fontFamily: 'Tajawal',
              color: Colors.black87,
            ),
          ),
          Spacer(),
          Image.asset(
            'assets/image/img.jpg', // Replace with actual image path
            height: 150,
            width: 200,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            // Handle accept action
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[400],
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Text(
            'قبول',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Tajawal',
              color: Colors.black,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            // Handle reject action
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Text(
            'رفض',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Tajawal',
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
