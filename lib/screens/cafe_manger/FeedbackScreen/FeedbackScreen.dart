import 'package:cafe/screens/cafe_manger/ProfileScreen/ProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';


import '../EventManagmentScreen/EventManagementScreen.dart';
import '../RewardsScreen/RewardsScreen.dart';
import '../WorkSpaceManagmentScreen/WorkSpaceManagmentScreen.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
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
      appBar: AppBar(
        centerTitle: true,
        title: const Text('آراء الحضور',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900,fontFamily: 'Rubik')),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1a2833),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                icon: const Icon(LucideIcons.settings2,
                    color: Colors.white, size: 20),
                label: const Text('التقييم',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 18)),
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  _buildFeedbackCard('ليلى محمد', 'مناقشة كتاب عميق الحرف',
                      'تجربة رائعة كانت النقاشات ثرية وجذابة', 5),
                  _buildFeedbackCard('عبدالرحمن أحمد', 'مناقشة كتاب عميق الحرف',
                      'أمسية جميلة', 4),
                  _buildFeedbackCard('عائشة الحربي', 'مناقشة كتاب عميق الحرف',
                      'استمتعت جدًا والمكان منظم', 3),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeedbackCard(
      String name, String event, String comment, int rating) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name,
                style:
                    const TextStyle(fontWeight: FontWeight.w800, fontSize: 20)),
            const SizedBox(height: 4),
            Text(event,
                style: const TextStyle(color: Colors.grey, fontSize: 19)),
            const SizedBox(height: 8),
            Text('"$comment"',
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Colors.black)),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('5',style: TextStyle(fontSize: 20),),
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 22,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
