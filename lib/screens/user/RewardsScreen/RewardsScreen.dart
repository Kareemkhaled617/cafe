import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../user_layout/user_layout.dart';

class RewardsScreen extends StatelessWidget {
  RewardsScreen({super.key});

  int _selectedIndex = 1; // العنصر المحدد حاليًا

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Get.off(UserLayout(
          selectPage: 0,
        ));
        break;
      case 1:
        Get.off(UserLayout(
          selectPage: 1,
        ));
        break;
      case 2:
        Get.off(UserLayout(
          selectPage: 2,
        ));

        break;
      case 3:
        Get.off(UserLayout(
          selectPage: 3,
        ));

        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.airplane_ticket_sharp), label: ''),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          _onItemTapped(index);
        },
      ),
      appBar: AppBar(
        title: Text(
          'نقاطك',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 5,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/image/img.jpg',
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'رو كافيه',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _rewardItem(
                      'قهوة اليوم', '30', 'assets/image/img.jpg', context),
                  _rewardItem('كوكيز', '70', 'assets/image/img.jpg', context),
                  _rewardItem(
                      'فلات وايت', '100', 'assets/image/img.jpg', context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showQRCodeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xFFece4cb),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          contentPadding: EdgeInsets.all(20),
          content: Container(
            width: Get.width * 0.8, // Responsive width
            decoration: BoxDecoration(
              color: Color(0xFFece4cb), // Background color of the dialog
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 10),
                Text(
                  "مكافأة",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "استعرض الكود للكاشير",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white, // QR code background
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(Icons.qr_code, size: 120, color: Colors.black),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0A1F2D),
                    // Dark blue button color
                    minimumSize: Size(Get.width * 0.6, 45),
                    // Button size
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(); // Close dialog
                  },
                  child: Text(
                    "تم",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _rewardItem(
      String title, String points, String imagePath, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text(points,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w900)),
              Text('نقطة',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w900)),
            ],
          ),
          Image.asset(
            imagePath,
            height: 70,
            width: 70,
            fit: BoxFit.cover,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontSize: 16)),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  showQRCodeDialog(context);
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  backgroundColor: Color(0xFFece4cb),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'استبدال',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
