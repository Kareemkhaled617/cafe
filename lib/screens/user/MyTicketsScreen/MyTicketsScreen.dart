import 'package:cafe/screens/user/NotificationsScreen/NotificationsScreen.dart';
import 'package:cafe/screens/user/MyBookingsScreen/MyBookingsScreen.dart';
import 'package:cafe/screens/user/TicketCancellationScreen/TicketCancellationScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MyTicketsScreen extends StatelessWidget {
  const MyTicketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Image.asset(
            'assets/image/logo.png', // Replace with actual logo image path
            height: 50,
            fit: BoxFit.cover,
          ),
          centerTitle: true,
          title: Text(
            'تذاكري',
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
                TicketOption(
                  title: 'حجوزاتي',
                  description:
                      'اطلع على معلومات حجوزاتك الخاصة بالفعاليات ومساحات العمل',
                  icon: Icons.airplane_ticket,
                  constraints: constraints,
                  onTap: () {
                    Get.to(MyBookingsScreen());
                  },
                ),
                TicketOption(
                  title: 'إلغاء تذاكري',
                  description: 'إجراء الإلغاء لمحجوزاتك',
                  icon: Icons.cancel,
                  constraints: constraints,
                  onTap: () {
                    Get.to(TicketCancellationScreen());
                  },
                ),
                TicketOption(
                  title: 'إشعاراتي',
                  description:
                      'تابع آخر إعلانات الفعاليات ومساحات العمل أولًا بأول',
                  icon: Icons.notifications,
                  constraints: constraints,
                  onTap: () {
                    Get.to(NotificationsScreen());
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Ticket Option Widget
class TicketOption extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final BoxConstraints constraints;
  final VoidCallback onTap;

  TicketOption({
    required this.title,
    required this.description,
    required this.icon,
    required this.constraints,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color(0xFFf9f8ef),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Icon(icon, size: 30, color: Colors.black),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Tajawal',
                  ),
                  textAlign: TextAlign.right,
                ),
                SizedBox(height: 5),
                SizedBox(
                  width: 200,
                  child: Text(
                    description,
                    maxLines: 3,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Tajawal',
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
