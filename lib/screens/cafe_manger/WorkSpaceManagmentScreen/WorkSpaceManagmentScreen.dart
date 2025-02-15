import 'package:cafe/screens/cafe_manger/EventManagmentScreen/EventManagementScreen.dart';
import 'package:cafe/screens/cafe_manger/ProfileScreen/ProfileScreen.dart';
import 'package:cafe/screens/cafe_manger/RewardsScreen/RewardsScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../user/CreateWorkspaceScreen/CreateWorkspaceScreen.dart';
import '../../user/CustomerInfoScreen/CustomerInfoScreen.dart';
import '../../user/EditWorkspaceScreen/EditWorkspaceScreen.dart';

class WorkspaceManagementScreen extends StatefulWidget {
  const WorkspaceManagementScreen({super.key});

  @override
  State<WorkspaceManagementScreen> createState() => _WorkspaceManagementScreenState();
}

class _WorkspaceManagementScreenState extends State<WorkspaceManagementScreen> {
  int _selectedIndex = 2;

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
  BottomNavigationBarItem _buildNavItem(IconData icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: _selectedIndex == index ? Color(0xFF0a2332) : Colors.transparent,

        ),
        child: Icon(icon, color: _selectedIndex == index ? Colors.white : Color(0xFF0a2332)),
      ),
      label: label,
    );
  }


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold( bottomNavigationBar: BottomNavigationBar(
      currentIndex: _selectedIndex,

      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.white,
      onTap: _onItemTapped,
      items: [
        _buildNavItem(Icons.card_giftcard_rounded, '',0),
        _buildNavItem(Icons.grid_on_rounded,'', 1),
        _buildNavItem(Icons.calendar_month, "", 2),
        _buildNavItem(Icons.person, "", 3),
      ],
    ),
      appBar: AppBar(
        title: Text(
          '    مساحات العمل',
          style: TextStyle(
            fontFamily: 'Rubik',
            fontSize: screenWidth * 0.05, // Responsive font size
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.white70,
        elevation: 0,

        actions: [
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.01),
            child: ElevatedButton(
              onPressed: () {
                Get.to(CreateWorkspaceScreen());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF0a2332),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                'إنشاء مساحة عمل',
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  color: Colors.white,
                  fontFamily: 'Rubik',
                ),
              ),
            ),
          ),
        ],
        leading: Image.asset(
          'assets/image/logo.png',
          fit: BoxFit.cover,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'مساحات العمل المتاحة',
                  style: TextStyle(
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Rubik',
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                _buildAvailableWorkspaces(screenWidth, screenHeight),
                SizedBox(height: screenHeight * 0.03),
                Text(
                  'مساحات العمل المحجوزة',
                  style: TextStyle(
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Rubik',
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                _buildReservedWorkspace(screenWidth, screenHeight),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAvailableWorkspaces(double screenWidth, double screenHeight) {
    return Column(
      children: [
        _workspaceCard(
          'مكتب مشترك',
          'السعة: 5 مقاعد',
          ['09:00 AM', '10:00 AM', '11:00 AM'],
          screenWidth,
          screenHeight,
        ),
        _workspaceCard(
          'غرفة الاجتماعات',
          'السعة: 10 مقاعد',
          ['12:00 PM', '01:00 PM', '02:00 PM'],
          screenWidth,
          screenHeight,
        ),
      ],
    );
  }

  Widget _buildReservedWorkspace(double screenWidth, double screenHeight) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 7,
      color: Colors.white,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(screenWidth * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'مكتب خاص',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: screenWidth * 0.045,
                fontFamily: 'Rubik',
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              'الوقت: 5 م - 7 م',
              style: TextStyle(fontFamily: 'Rubik'),
            ),
            Text(
              'السعر: 150 ريال',
              style: TextStyle(fontFamily: 'Rubik'),
            ),
            SizedBox(height: screenHeight * 0.015),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.to(CustomerInfoScreen());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFd3d3d3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    'عرض معلومات العميل',
                    style: TextStyle(
                        fontFamily: 'Rubik',
                        color: Colors.black,
                        backgroundColor:  Color(0xFFd3d3d3),),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _workspaceCard(
    String title,
    String capacity,
    List<String> times,
    double screenWidth,
    double screenHeight,
  ) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 7,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.045,
                    fontFamily: 'Rubik',
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(EditWorkspaceScreen());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:  Color(0xFFd3d3d3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      'تعديل',
                      style:
                          TextStyle(fontFamily: 'Rubik', color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              capacity,
              style: TextStyle(fontFamily: 'Rubik'),
            ),
            SizedBox(height: screenHeight * 0.010),
            Wrap(
              spacing: screenWidth * 0.01,
              children:
                  times.map((time) => _timeButton(time, screenWidth)).toList(),
            ),
            SizedBox(height: screenHeight * 0.010),
          ],
        ),
      ),
    );
  }

  Widget _timeButton(String time, double screenWidth) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        side: BorderSide(color: Colors.black),
      ),
      child: Text(
        time,
        style: TextStyle(
          color: Colors.black,
          fontSize: screenWidth * 0.035,
          fontFamily: 'Rubik',
        ),
      ),
    );
  }
}
