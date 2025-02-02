import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../cafe_request_info/cafe_request_info.dart';
import '../list_of_cafe/list_of_cafe.dart';
import '../request/request.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'لوحة التحكم',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
              onPressed: () {
                // Handle logout action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Logout',
                style: TextStyle(
                    fontSize: 14, color: Colors.white, fontFamily: 'Tajawal'),
              ),
            ),
          ),
        ],
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              DashboardCard(
                title: 'طلبات الانضمام',
                buttonText: 'عرض القائمة',
                children: [
                  JoinRequestItem(name: 'عرب', time: 'الطلب منذ يومين'),
                  JoinRequestItem(name: 'كفة', time: 'الطلب منذ ٣ أيام'),
                ],
              ),
              DashboardCard(
                title: 'المقاهي المسجلة',
                buttonText: 'عرض القائمة',
                children: [
                  CafeItem(name: 'رو كافيه', imageUrl: 'assets/image/img.jpg'),
                  SizedBox(
                    height: 10,
                  ),
                  CafeItem(
                      name: 'أفينجارديا', imageUrl: 'assets/image/img.jpg'),
                ],
              ),
              DashboardCard(
                title: 'النشاط الأخير',
                buttonText: 'عرض القائمة',
                children: [
                  ActivityItem(
                      description: 'قام رو بإضافة فعالية', time: 'منذ ٥ دقائق'),
                  ActivityItem(
                      description: 'قام رو بإضافة مساحة عمل',
                      time: 'منذ ١٠ دقائق'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String title;
  final String buttonText;
  final List<Widget> children;

  const DashboardCard(
      {super.key,
      required this.title,
      required this.buttonText,
      required this.children});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (title == 'المقاهي المسجلة') {
                      Get.to(() => CafeListScreen());
                    }else if (title == 'طلبات الانضمام') {
                      Get.to(() => RegistrationRequestsScreen());
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    buttonText,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 19,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Column(children: children),
          ],
        ),
      ),
    );
  }
}

class JoinRequestItem extends StatelessWidget {
  final String name;
  final String time;

  const JoinRequestItem({super.key, required this.name, required this.time});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 30,
        backgroundColor: Color(0XFF102331),
        child: Icon(
          Icons.person,
          color: Colors.white,
          size: 30,
        ),
      ),
      title: Text(
        name,
        textAlign: TextAlign.start,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        time,
        textAlign: TextAlign.start,
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w700, color: Colors.grey[600]),
      ),
      trailing: ElevatedButton(
        onPressed: () {
          Get.to(() => RequestReviewScreen());
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0XFFebe1c6),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text('مراجعة الطلب',
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w700)),
      ),
    );
  }
}

class CafeItem extends StatelessWidget {
  final String name;
  final String imageUrl;

  const CafeItem({super.key, required this.name, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 40,
        backgroundImage: AssetImage(imageUrl),
        backgroundColor: Colors.transparent,
      ),
      title: Text(
        name,
        textAlign: TextAlign.start,
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w700, fontFamily: 'Tajawal'),
      ),
    );
  }
}

class ActivityItem extends StatelessWidget {
  final String description;
  final String time;

  const ActivityItem({required this.description, required this.time});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.notifications, color: Colors.black),
      title: Text(
        description,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
      subtitle: Text(
        time,
        textAlign: TextAlign.start,
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w700, color: Colors.grey[600]),
      ),
    );
  }
}
