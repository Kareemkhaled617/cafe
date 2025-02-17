import 'package:cafe/screens/user/BookingDetailsScreen/BookingDetailsScreen.dart';
import 'package:cafe/screens/user/UpcomingEventsScreen/UpcomingEventsScreen.dart';
import 'package:cafe/screens/user/UserProfileScreen/UserProfileScreen.dart';
import 'package:cafe/screens/user/workSpace/workSpace.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cafe/screens/user/NotificationsScreen/NotificationsScreen.dart';


class NewScreen extends StatefulWidget {
  const NewScreen({super.key});

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  bool switchValue = true;
  PageController pageController = PageController();
  PageController pageController1 = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image(
                      image: AssetImage('assets/image/logo1.png'),
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                    InkWell(
                        onTap: () {
                          Get.to(NotificationsScreen());
                        },
                        child: Icon(Icons.notifications)),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 200,
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/image/userhome1.png'),
                        fit: BoxFit.cover)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: 'ابحث عن فعالية',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                            filled: true,
                            fillColor: Colors.white),
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 42,
                          width: 175,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(2)),
                          child: DropdownButton<String>(
                            value: 'جميع اللغات',
                            items: [
                              DropdownMenuItem(
                                  value: 'جميع اللغات',
                                  child: Text('جميع اللغات')),
                            ],
                            onChanged: (value) {},
                          ),
                        ),
                        Container(
                          height: 42,
                          width: 175,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(2)),
                          child: DropdownButton<String>(
                            value: 'كل الأماكن',
                            items: [
                              DropdownMenuItem(
                                  value: 'كل الأماكن',
                                  child: Text('كل الأماكن')),
                            ],
                            onChanged: (value) {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SwitchListTile(
                      title: Text(
                        'السماح بالوصول لموقعك',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: 'Rubik'),
                      ),
                      value: switchValue,
                      onChanged: (value) {
                        setState(() {
                          switchValue = value;
                        });
                      },
                      activeColor: Colors.white,
                      // لون المفتاح عند التفعيل
                      activeTrackColor: Color(0xFF0a2332),
                      // لون المسار عند التفعيل
                      inactiveThumbColor: Color(0xFF0a2332),
                      // لون المفتاح عند إلغاء التفعيل
                      inactiveTrackColor:
                          Colors.grey[300], // لون المسار عند إلغاء التفعيل
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('الفعاليات القريبة',
                            style: TextStyle(
                                color: Color(0xFF0a2332),
                                fontSize: 20,
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Image(
                            image: AssetImage('assets/image/userhome2.png'))),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('الفعاليات القادمة',
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(0xFF0a2332),
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.w500)),
                        InkWell(
                          onTap: () {
                            Get.to(UpcomingEventsScreen());
                          },
                          child: Text('أعرض الكل',
                              style: TextStyle(
                                  color: Color(0xFF7f7f7f),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Previous Page Button
                          IconButton(
                            onPressed: () {
                              if (pageController.hasClients) {
                                pageController.previousPage(
                                  duration: Duration(milliseconds: 300),
                                  // Fixed duration
                                  curve: Curves.easeInOut, // Smoother animation
                                );
                              }
                            },
                            icon: Icon(Icons.arrow_back_ios_new),
                          ),

                          // PageView for Images
                          SizedBox(
                            height: 300,
                            width: Get.width - 130,
                            child: PageView(
                              controller: pageController,
                              children: [
                                InkWell(
                                  onTap: (){
                                    Get.to(BookingDetailsScreen());
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 9.0, vertical: 12),
                                    child: Stack(
                                      fit: StackFit.expand,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(24),
                                          child: Image.asset(
                                            'assets/image/Image(13).png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Positioned(
                                          top: 20,
                                          right: 0,
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 12, vertical: 6),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(16)),
                                            child: Text(
                                              'مناقشه كتاب عبق الحروف',
                                              style: TextStyle(
                                                  color: Color(0xFF0a2332),
                                                  fontSize: 12,
                                                  fontFamily: 'Rubik',
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 10,
                                          left: 8,
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 12, vertical: 6),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(16)),
                                            child: Text(
                                              ' 11 / 12',
                                              style: TextStyle(
                                                  color: Color(0xFF0a2332),
                                                  fontSize: 12,
                                                  fontFamily: 'Rubik',
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Next Page Button
                          IconButton(
                            onPressed: () {
                              if (pageController.hasClients) {
                                pageController.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  // Fixed duration
                                  curve: Curves.easeInOut, // Smoother animation
                                );
                              }
                            },
                            icon: Icon(Icons.arrow_forward_ios_rounded),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('مساحات العمل',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        InkWell(
                          onTap: () {
                            Get.to(WorkSpace());
                          },
                          child: Text('أعرض الكل',
                              style: TextStyle(
                                  color: Color(0xFF7f7f7f),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800)),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Previous Page Button
                          IconButton(
                            onPressed: () {
                              if (pageController1.hasClients) {
                                pageController1.previousPage(
                                  duration: Duration(milliseconds: 300),
                                  // Fixed duration
                                  curve: Curves.easeInOut, // Smoother animation
                                );
                              }
                            },
                            icon: Icon(Icons.arrow_back_ios_new),
                          ),

                          // PageView for Images
                          SizedBox(
                            height: 300,
                            width: Get.width - 130,
                            child: PageView(
                              controller: pageController1,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0),
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.asset(
                                          'assets/image/userhome4.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Positioned(
                                        top: 20,
                                        right: 0,
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 6),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(16)),
                                          child: Text(
                                            'افانجارديا',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Next Page Button
                          IconButton(
                            onPressed: () {
                              if (pageController1.hasClients) {
                                pageController1.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  // Fixed duration
                                  curve: Curves.easeInOut, // Smoother animation
                                );
                              }
                            },
                            icon: Icon(Icons.arrow_forward_ios_rounded),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
