import 'package:cafe/screens/user/RewardsScreen/RewardsScreen.dart';
import 'package:cafe/screens/user/WalletScreen/WalletScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../NotificationsScreen/NotificationsScreen.dart';
import '../EditUserProfileScreen/EditUserProfileScreen.dart';
import '../HomeScreen/HomeScreen.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Image.asset(
          'assets/image/logo1.png',
          height: 60,
        ),
        centerTitle: true,
        title: Text('أهلا أحمد!',
            style: TextStyle(
                fontSize: 20,
                color: Color(0xFF0a2332),
                fontFamily: 'Rubik',
                fontWeight: FontWeight.w700)),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                ListTile(
                  title: Text('الملف الشخصي',
                      style: TextStyle(fontWeight: FontWeight.w900)),
                  leading: CircleAvatar(
                      backgroundColor: Color(0xFFf0f6fe),
                      child: Icon(
                        Icons.person,
                        color: Colors.blue,
                      )),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Get.to(EditUserProfileScreen());
                  },
                ),
                ListTile(
                  title: Text('المحفظة',
                      style: TextStyle(fontWeight: FontWeight.w900)),
                  leading: CircleAvatar(
                      backgroundColor: Color(0xFFf0f6fe),
                      child: Icon(
                        Icons.account_balance_wallet,
                        color: Colors.blue,
                      )),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Get.to(WalletScreen(
                      val: true,
                    ));
                  },
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('وسامك: برونزي',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w900)),
                      SizedBox(height: 10),
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('assets/image/img.jpg'),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'رحلتك الأدبية بدأت للتو',
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 40),
                Text('نقاطك',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildPointsCard('assets/image/img.jpg', 'حق كاف', '10'),
                    buildPointsCard('assets/image/img.jpg', 'فاصلة', '10'),
                    buildPointsCard('assets/image/img.jpg', 'رو كافيه', '20'),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPointsCard(String image, String title, String points) {
    return InkWell(
      onTap: () {
        Get.to(RewardsScreen());
      },
      child: Column(
        children: [
          Image.asset(image, height: 80),
          SizedBox(height: 5),
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          Text('$points نقطة', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
