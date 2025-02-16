import 'package:cafe/screens/request/request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../NotificationsScreen/NotificationsScreen.dart';
import '../SignInScreen/SignInScreen.dart';
import '../cafe_request_info/cafe_request_info.dart';
import '../list_of_cafe/list_of_cafe.dart';


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Get.to(DashboardScreen());
        break;
      case 1:
        Get.to(CafeListScreen());
        break;
      case 2:
        Get.to(NotificationsScreen());

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



    return Scaffold(backgroundColor: Colors.white,

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        onTap: _onItemTapped,
        items: [
          _buildNavItem(Icons.home, '',0),
          _buildNavItem(Icons.list,"", 1),
          _buildNavItem(Icons.notifications, "", 2),

        ],
      ),
      appBar: AppBar(
        leading: Text(''),
        title: Text(
          'لوحة التحكم',

          style: TextStyle(color:Color(0xFF0a2332),fontSize: 22,fontFamily: 'Rubik', fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
        actions: [
          IconButton(color: Color(0xFF0a2332),
            icon: Icon(Icons.logout),
            onPressed: () => Get.to(SignInScreen()),
          ),
        ],
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              DashboardCard(
                title: 'طلبات الانضمام',
                buttonText: 'عرض القائمة',
                children: [
                  JoinRequestItem(name: 'عريب', time: 'الطلب منذ يومين'),
                  JoinRequestItem(name: 'كفة', time: 'الطلب منذ ٣ أيام'),
                ],
              ),
              DashboardCard(
                title: 'المقاهي المسجلة',
                buttonText: 'عرض القائمة',
                children: [
                  CafeItem(name: 'رو كافيه', imageUrl: 'assets/image/dash.png'),
                  SizedBox(height: 10),
                  CafeItem(name: 'أفينجارديا', imageUrl: 'assets/image/dash1.png'),
                ],
              ),
              DashboardCard(
                title: 'النشاط الأخير',
                buttonText: 'عرض القائمة',
                children: [
                  ActivityItem(
                      description: 'قام رو بإضافة فعالية', time: 'منذ ٥ دقائق'),
                  ActivityItem(
                      description: 'قام رو بإضافة مساحة عمل',
                      time: 'منذ ١٠ دقائق'),
                ],
              ),
            ],
          ),
        ),

    ), );
  }
}

class DashboardCard extends StatelessWidget {
  final String title;
  final String buttonText;
  final List<Widget> children;

  const DashboardCard({
    super.key,
    required this.title,
    required this.buttonText,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Card(color: Colors.white,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,

                  style: TextStyle(fontFamily:'Rubik',color: Color(0xFF0a2332),
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                LayoutBuilder(
                  builder: (context, constraints) {
                    bool isSmallScreen = constraints.maxWidth < 600;
                    return ElevatedButton(
                      onPressed: () {
                        print(title);
                        if (title == 'المقاهي المسجلة') {
                          Get.to(() => CafeListScreen());
                        } else if (title == 'طلبات الانضمام') {
                          Get.to(() => RequestsScreen());
                        }
                        else if (title == 'النشاط الأخير') {
                          Get.to(() => NotificationsScreen());
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFe1e1e1),
                        padding: EdgeInsets.symmetric(
                          horizontal: isSmallScreen ? 12 : 16,
                          vertical: isSmallScreen ? 4 : 6,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        buttonText,
                        style: TextStyle(
                          color: Color(0xFF0a2332),
                          fontSize: isSmallScreen ? 16 : 19,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
            Column(children: children),
          ],
        ),
      ),
    );
  }
}

class JoinRequestItem extends StatelessWidget {
  final String name;
  final String time;

  const JoinRequestItem({super.key, required this.name, required this.time});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 30,
        backgroundColor: Color(0xFF0a2332),
        child: Icon(
          Icons.person,
          color: Colors.white,
          size: 30,
        ),
      ),
      title: Text(
        name,
        textAlign: TextAlign.start,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        time,
        textAlign: TextAlign.start,
        style: TextStyle(
            fontSize: 12, fontWeight: FontWeight.w700, color: Colors.grey[600]),
      ),
      trailing: ElevatedButton(
        onPressed: () {
          Get.to(() => RequestReviewScreen());
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFebe1c6),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        child: Text('مراجعة الطلب',
            style: TextStyle(
                color: Color(0xFF0a2332),
                fontSize: 18,
                fontWeight: FontWeight.w700)),
      ),
    );
  }
}

class CafeItem extends StatelessWidget {
  final String name;
  final String imageUrl;

  const CafeItem({super.key, required this.name, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 40,
        backgroundImage: AssetImage(imageUrl),
        backgroundColor: Colors.transparent,
      ),
      title: Text(
        name,
        textAlign: TextAlign.start,
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w700, fontFamily: 'Rubik'),
      ),
    );
  }
}

class ActivityItem extends StatelessWidget {
  final String description;
  final String time;

  const ActivityItem({required this.description, required this.time});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.notifications, color: Color(0xFF0a2332)),
      title: Text(
        description,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 18,color: Color(0xFF0a2332),
          fontWeight: FontWeight.w700,
        ),
      ),
      subtitle: Text(
        time,
        textAlign: TextAlign.start,
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w700, color: Color(0xFF7f7f7f)),
      ),
    );
  }
}
