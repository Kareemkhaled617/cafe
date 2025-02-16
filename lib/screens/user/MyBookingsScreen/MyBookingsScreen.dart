import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyBookingsScreen extends StatelessWidget {
  const MyBookingsScreen({super.key});

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
            'حجوزاتي',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Upcoming Bookings
                SectionTitle(title: 'حجوزاتي القادمة'),
                BookingItem(
                  title: 'بناء الجسور',
                  date: 'March 18, 2024',
                  imageUrl: 'assets/image/logo.png',
                  constraints: constraints,
                ),
                BookingItem(
                  title: 'حوارات ثقافية',
                  date: 'May 15, 2024',
                  imageUrl: 'assets/image/logo.png',
                  constraints: constraints,
                ),

                SizedBox(height: 20),

                // Past Bookings
                SectionTitle(title: 'حجوزاتي السابقة'),
                BookingItem(
                  title: 'ملتقى العقول',
                  date: 'March 15, 2024',
                  imageUrl: 'assets/image/logo.png',
                  constraints: constraints,
                ),
                BookingItem(
                  title: 'تجارب ملهمة',
                  date: 'April 10, 2024',
                  imageUrl: 'assets/image/logo.png',
                  constraints: constraints,
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        ],
        selectedItemColor: Colors.black,
      ),
    );
  }
}

// Section Title Widget
class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w800,
          fontFamily: 'Tajawal',
        ),
        textAlign: TextAlign.right,
      ),
    );
  }
}

// Booking Item Widget
class BookingItem extends StatelessWidget {
  final String title;
  final String date;
  final String imageUrl;
  final BoxConstraints constraints;

  const BookingItem({super.key,
    required this.title,
    required this.date,
    required this.imageUrl,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    double cardWidth = constraints.maxWidth > 500 ? 500 : constraints.maxWidth;

    return Container(
      width: cardWidth,
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFFf9f8ef),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imageUrl,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.right,
              ),
              SizedBox(height: 4),
              Text(
                date,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Tajawal',
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.right,
              ),
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }
}
