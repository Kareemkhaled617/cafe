import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';


import '../EventManagmentScreen/EventManagementScreen.dart';
import '../ProfileScreen/ProfileScreen.dart';
import '../RewardsScreen/RewardsScreen.dart';
import '../WorkSpaceManagmentScreen/WorkSpaceManagmentScreen.dart';

class QrRewards extends StatefulWidget {
  const QrRewards({super.key});

  @override
  State<QrRewards> createState() => _QRAttendanceScreenState();
}

class _QRAttendanceScreenState extends State<QrRewards> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Get.to(RewardsScreen());
        break;
      case 1:
        Get.to(EventManagementScreen());
        break;
      case 2:
        Get.to(WorkspaceManagementScreen());
      case 3:
        Get.to(ProfileScreen());
        break;
    }
  }

  BottomNavigationBarItem _buildNavItem(IconData icon, String label,
      int index) {
    return BottomNavigationBarItem(
      icon: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: _selectedIndex == index ? Color(0xFF0a2332) : Colors
              .transparent,

        ),
        child: Icon(icon,
            color: _selectedIndex == index ? Colors.white : Color(0xFF0a2332)),
      ),
      label: label,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(bottomNavigationBar: BottomNavigationBar(
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.white,
      onTap: _onItemTapped,
      items: [
        _buildNavItem(Icons.card_giftcard_rounded, '', 0),
        _buildNavItem(Icons.grid_on_rounded, '', 1),
        _buildNavItem(Icons.calendar_month, "", 2),
        _buildNavItem(Icons.person, "", 3),
      ],
    ),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
        title: Text('مسح المكافأة',
            style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 22,
                fontWeight: FontWeight.w500)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              _buildQRScanner(),
              SizedBox(height: 20),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQRScanner() {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 36, vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Color(0xFF1a2833)),
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
        ),
        child: Column(
          children: [
            Text('وجه الكاميرا نحو رمز QR لمسحه',
                style: TextStyle(
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w800,
                    fontSize: 16)),
            SizedBox(height: 10),
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: MobileScanner(
                onDetect: (barcode) {
                  print("Scanned QR: ${barcode.barcodes}");
                },
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF0a2332),
                minimumSize: Size(150, 40),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)),
              ),
              child: Text('بدء المسح',
                  style: TextStyle(
                      fontSize: 18, color: Colors.white, fontFamily: 'Rubik')),
            ),
          ],
        ),
      ),
    );
  }
}
