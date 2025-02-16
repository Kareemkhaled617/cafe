import 'package:cafe/screens/user/WorkspacesScreen/WorkspacesScreen.dart';
import 'package:cafe/screens/user/workSpace/workSpace.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpcomingEventsScreen extends StatelessWidget {
  const UpcomingEventsScreen({super.key});

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
            'الفعاليات القادمة',
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
                EventItem(
                  title: 'بناء الجسور',
                  description:
                      'انضم إلينا في حدث "بناء الجسور" الذي يهدف إلى تعزيز التفاهم، التواصل، والتعاون بين الأفراد والمجتمعات.',
                  imageUrl: 'assets/image/img.jpg',
                  constraints: constraints,
                ),
                EventItem(
                  title: 'حوارات ثقافية',
                  description:
                      'انضم إلينا في إحدى الحوارات حول الكتب الثقافية التي تقام في مقهى عرب.',
                  imageUrl: 'assets/image/img.jpg',
                  constraints: constraints,
                ),
                EventItem(
                  title: 'الأبل في أدب الصحراء',
                  description:
                      'انضم إلينا في إحدى الحوارات التي تقام في مقهى عرب.',
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
  final String description;
  final String imageUrl;
  final BoxConstraints constraints;

  EventItem({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(WorkspacesScreen());
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color(0xFFffffff),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Tajawal',
                    ),
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(height: 4),
                  SizedBox(
                    width: 200,
                    child: Text(
                      description,
                      maxLines: 4,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.w700,
                        color: Colors.grey.shade600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
