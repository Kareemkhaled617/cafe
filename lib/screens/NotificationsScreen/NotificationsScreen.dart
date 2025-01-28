import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'التنبيهات',
          style: TextStyle(
            fontSize: 28,
            fontFamily: 'Tajawal', // Replace with your font family
            fontWeight: FontWeight.w900,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          NotificationItem(
            title: 'أضاف فعالية جديدة: رو كافيه',
            timeAgo: 'منذ يومين',
          ),
          NotificationItem(
            title: 'أضاف مساحة عمل: رو كافيه',
            timeAgo: 'منذ أسبوع',
          ),
          NotificationItem(
            title: 'قام بتغيير الملف الشخصي: رو كافيه',
            timeAgo: 'منذ 3 أسابيع',
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
        ],
        selectedItemColor: Colors.black,
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String title;
  final String timeAgo;

  const NotificationItem({required this.title, required this.timeAgo});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Tajawal', // Replace with your font family
                fontWeight: FontWeight.w800,
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(height: 8),
            Text(
              timeAgo,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                fontFamily: 'Tajawal', // Replace with your font family
                color: Colors.grey.shade800,
              ),
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ),
    );
  }
}
