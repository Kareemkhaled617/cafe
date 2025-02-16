import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkSpace extends StatelessWidget {
  const WorkSpace({super.key});

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
            'مساحات العمل',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
              fontFamily: 'Rubik',
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
                EventItem(
                  title: 'بناء الجسور',
                  imageUrl: 'assets/image/img.jpg',
                  constraints: constraints,
                ),
                EventItem(
                  title: 'حوارات ثقافية',

                  imageUrl: 'assets/image/img.jpg',
                  constraints: constraints,
                ),
                EventItem(
                  title: 'الأبل في أدب الصحراء',

                  imageUrl: 'assets/image/img.jpg',
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

// Event Item Widget
class EventItem extends StatelessWidget {
  final String title;

  final String imageUrl;
  final BoxConstraints constraints;

  EventItem({
    required this.title,

    required this.imageUrl,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFffffff),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(

        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              imageUrl,
              height: 100,
              width: 120,
              fit: BoxFit.cover,
            ),
          ),
          Spacer(),
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              fontFamily: 'Tajawal',
            ),
            textAlign: TextAlign.right,
          ),
          Spacer(),
        ],
      ),
    );
  }
}
