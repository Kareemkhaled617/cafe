import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../EventManagmentScreen/EventManagementScreen.dart';
import '../ProfileScreen/ProfileScreen.dart';
import '../RewardsScreen/RewardsScreen.dart';
import '../WorkSpaceManagmentScreen/WorkSpaceManagmentScreen.dart';

class WorkspacesScreen extends StatefulWidget {
  const WorkspacesScreen({super.key});

  @override
  State<WorkspacesScreen> createState() => _WorkspacesScreenState();
}

class _WorkspacesScreenState extends State<WorkspacesScreen> {
  final int _selectedIndex = 3;

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
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Get.back(),
          ),

          title: Text(
            'مساحات العمل',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
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
                WorkspaceCard(
                  title: 'مكتب خاص',
                  description:
                      'مساحة عمل فردية مع خصوصية تامة. مثالية للتركيز والعمل المستقل',
                  price: '150 ريال',
                  imageUrl: 'assets/image/img.jpg',
                  constraints: constraints,
                ),
                WorkspaceCard(
                  title: 'مكتب مشترك',
                  description:
                      'مساحة مفتوحة مع مقاعد مشتركة. مناسبة للتعاون والتفاعل مع الزملاء',
                  price: '250 ريال',
                  imageUrl: 'assets/image/img.jpg',
                  constraints: constraints,
                ),
                WorkspaceCard(
                  title: 'غرفة اجتماعات',
                  description:
                      'مساحة مخصصة للاجتماعات مع تجهيزات حديثة مثل شاشات عرض، وأماكن للجلوس بشكل مريح',
                  price: '500 ريال',
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

// Workspace Card Widget
class WorkspaceCard extends StatelessWidget {
  final String title;
  final String description;
  final String price;
  final String imageUrl;
  final BoxConstraints constraints;

  const WorkspaceCard({
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16, left: 12, right: 12),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imageUrl,
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Rubik'),
            textAlign: TextAlign.right,
          ),
          SizedBox(height: 5),
          Text(
            description,
            style: TextStyle(
                fontSize: 14, fontFamily: 'Rubik', color: Colors.black87),
            textAlign: TextAlign.right,
          ),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.amber[100],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                price,
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
