import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../user_layout/user_layout.dart';
import 'WalletPaymentScreen.dart';

class WalletScreen extends StatelessWidget {
  WalletScreen({super.key, required this.val});

  final bool val;

  final int _selectedIndex = 1; // العنصر المحدد حاليًا

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
      bottomNavigationBar: val
          ? BottomNavigationBar(
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
            )
          : null,
      appBar: AppBar(
        title: Text(
          'المحفظة',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'الرصيد',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '0 SAR',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Get.to(WalletPaymentScreen());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF263b4c),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text(
                'شحن الرصيد',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
