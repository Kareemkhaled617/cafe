import 'package:cafe/screens/user/HomeScreen/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ReservationScreen/ReservationScreen.dart';
import '../UserProfileScreen/UserProfileScreen.dart';
import '../user_layout/user_layout.dart';

class WorkspacesScreen extends StatefulWidget {
  const WorkspacesScreen({super.key});

  @override
  State<WorkspacesScreen> createState() => _WorkspacesScreenState();
}

class _WorkspacesScreenState extends State<WorkspacesScreen> {
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
      backgroundColor: Colors.white,
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color(0xFF0a2332),
            ),
            onPressed: () => Get.back(),
          ),
          centerTitle: true,
          title: Text(
            'مساحات العمل',
            style: TextStyle(
              fontSize: 22,
              color: Color(0xFF0a2332),
              fontWeight: FontWeight.w700,
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
                  imageUrl: 'assets/image/workspace.png',
                  constraints: constraints,
                ),
                WorkspaceCard(
                  title: 'مكتب مشترك',
                  description:
                      'مساحة مفتوحة مع مقاعد مشتركة. مناسبة للتعاون والتفاعل مع الزملاء',
                  price: '250 ريال',
                  imageUrl: 'assets/image/workspace1.png',
                  constraints: constraints,
                ),
                WorkspaceCard(
                  title: 'غرفة اجتماعات',
                  description:
                      'مساحة مخصصة للاجتماعات مع تجهيزات حديثة مثل شاشات عرض، وأماكن للجلوس بشكل مريح',
                  price: '500 ريال',
                  imageUrl: 'assets/image/workspace2.png',
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
                color: Color(0xFF030303),
                fontWeight: FontWeight.w500,
                fontFamily: 'Rubik'),
            textAlign: TextAlign.right,
          ),
          SizedBox(height: 5),
          Text(
            description,
            style: TextStyle(
                fontSize: 14, fontFamily: 'Rubik', color: Color(0xFF292929)),
            textAlign: TextAlign.right,
          ),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.centerLeft,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all(Color(0xFFede1c3))),
              onPressed: () {
                Get.to(ReservationScreen());
              },
              child: Text(
                price,
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Rubik',
                    color: Color(0xFF0a2332),
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
