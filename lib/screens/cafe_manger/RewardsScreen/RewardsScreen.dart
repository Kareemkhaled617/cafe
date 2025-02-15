import 'dart:ui';

import 'package:cafe/screens/cafe_manger/Edit%20Reward%20Screen/Edit%20Reward%20Screen.dart';
import 'package:cafe/screens/cafe_manger/QrRewards/QrRewards.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../AddRewardScreen/AddRewardScreen.dart';
import '../EventManagmentScreen/EventManagementScreen.dart';
import '../ProfileScreen/ProfileScreen.dart';
import '../WorkSpaceManagmentScreen/WorkSpaceManagmentScreen.dart';

class RewardsScreen extends StatefulWidget {

  RewardsScreen({super.key});

  @override
  State<RewardsScreen> createState() => _RewardsScreenState();
}

class _RewardsScreenState extends State<RewardsScreen> {
  final List<Map<String, String>> rewards = [
    {'name': 'كوكيز', 'points': '70 نقطة', 'image': 'assets/image/wards1.png'},
    {'name': 'قهوة اليوم', 'points': '30 نقطة', 'image': 'assets/image/wards2.png'},
    {'name': 'فلات وايت', 'points': '100 نقطة', 'image': 'assets/image/wards3.png'},
  ];

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
    return SafeArea(
      child: Scaffold(backgroundColor: Colors.white,
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
        appBar: AppBar(
          title: Text('المكافآت',
              style: TextStyle(color: Color(0xFF030303),
                  fontFamily: 'Rubik',
                  fontSize: 20,
                  fontWeight: FontWeight.w700)),
          leading: Image.asset(
            'assets/image/logo.png',
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {Get.to(AddRewardScreen(),);},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0a2332),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                ),
                child: Text('أضف مكافأة',
                    style: TextStyle(
                        fontSize: 14, fontFamily: 'Rubik', color: Colors.white)),
              ),
            )
          ],
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              _buildActionButtons(),
              SizedBox(height: 16),
              Expanded(child: _buildRewardsList()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildActionButton(
            'مسح المكافآت', Icons.qr_code_scanner, Color(0xFF0a2332)),
      ],
    );
  }

  Widget _buildActionButton(String title, IconData icon, Color color) {
    return ElevatedButton.icon(
      onPressed: () {Get.to(QrRewards(),);},
      label: Icon(
        icon,
        size: 18,
        color: Colors.white,
      ),
      icon: Text(title,
          style: TextStyle(
              fontSize: 14, fontFamily: 'Rubik', color: Colors.white)),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),
    );
  }

  Widget _buildRewardsList() {
    return ListView.builder(
      itemCount: rewards.length,
      itemBuilder: (context, index) {
        final reward = rewards[index];
        return _buildRewardCard(reward);
      },
    );
  }

  Widget _buildRewardCard(Map<String, String> reward) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: EdgeInsets.all(12),
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(reward['image']!),
          backgroundColor: Colors.grey.shade200,
        ),
        title: Text(reward['name']!,
            style: TextStyle(
                fontSize: 18,
                fontFamily: 'Rubik',
                fontWeight: FontWeight.bold)),
        subtitle: Text('النقاط المطلوبة: ${reward['points']}',
            style: TextStyle(
                fontSize: 14, fontFamily: 'Rubik', color: Colors.orange)),
        trailing: ElevatedButton(
          onPressed: () {Get.to(EditRewardScreen(),);},
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFd3d3d3),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          ),
          child: Text('تعديل',
              style: TextStyle(
                  fontSize: 14, color: Colors.black, fontFamily: 'Rubik')),
        ),
      ),
    );
  }
}