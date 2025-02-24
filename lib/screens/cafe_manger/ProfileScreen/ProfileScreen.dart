import 'package:cafe/screens/SignInScreen/SignInScreen.dart';
import 'package:cafe/screens/cafe_manger/RewardsScreen/RewardsScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../user/ReviewScreen/ReviewScreen.dart';
import '../EditProfileScreen/EditProfileScreen.dart';
import '../EventFeedbackScreen/EventFeedbackScreen.dart';
import '../EventManagmentScreen/EventManagementScreen.dart';
import '../UploadPostScreen/UploadPostScreen.dart';
import '../WorkSpaceManagmentScreen/WorkSpaceManagmentScreen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 3;

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

  BottomNavigationBarItem _buildNavItem(
      IconData icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color:
              _selectedIndex == index ? Color(0xFF0a2332) : Colors.transparent,
        ),
        child: Icon(icon,
            color: _selectedIndex == index ? Colors.white : Color(0xFF0a2332)),
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
          _buildNavItem(Icons.card_giftcard_rounded, '', 0),
          _buildNavItem(Icons.grid_on_rounded, '', 1),
          _buildNavItem(Icons.calendar_month, "", 2),
          _buildNavItem(Icons.person, "", 3),
        ],
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'الملف الشخصي',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            fontFamily: 'Rubik',
          ),
        ),
        centerTitle: true,
        leading: Image.asset(
          'assets/image/logo.png', // Replace with the actual logo asset path
          height: 100,
          fit: BoxFit.cover,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => Get.to(SignInScreen()),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "assets/image/profile_img.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'مساحة رو | ROW Space',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Rubik',
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'مقهى و محمصة رو | نعزز الثقافة والأدب عبر فعاليات إبداعية ضمن مبادرة #الشريك_الأدبي',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontFamily: 'Rubik',
              ),
            ),
            SizedBox(height: 20),
            _buildButton(
                'تعديل الملف الشخصي', () => Get.to(EditProfileScreen())),
            _buildButton('رفع منشور', () => Get.to(UploadPostScreen())),
            _buildButton(
                'عرض آراء الحضور', () => Get.to(EventFeedbackScreen())),
            SizedBox(height: 30),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'المنشورات',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Rubik',
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildPostItem('assets/image/_img1.png'),
                _buildPostItem('assets/image/profile_img2.png'),
                _buildPostItem('assets/image/profile_img3.png'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String text, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromRGBO(10, 35, 50, 1.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          minimumSize: Size(double.infinity, 50),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 8),
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'Rubik',
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPostItem(String imagePath) {
    return Card(
      shape: RoundedRectangleBorder(),
      elevation: 4,
      child: Container(
        width: 115,
        height: 140,
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
