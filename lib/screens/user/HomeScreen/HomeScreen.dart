import 'package:cafe/screens/user/UpcomingEventsScreen/UpcomingEventsScreen.dart';
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
                      image: AssetImage('assets/image/logo.png'),
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
                        image: AssetImage('assets/image/img.jpg'),
                        fit: BoxFit.cover)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: 'ابحث عن فعالية',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
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
                      title: Text('السماح بالوصول لموقعك'),
                      value: switchValue,
                      onChanged: (value) {
                        setState(() {
                          switchValue = value;
                        });
                      },
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('الفعاليات القريبة',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w800)),
                        InkWell(
                          onTap: (){
                            Get.to(UpcomingEventsScreen());
                          },
                          child: Text('أعرض الكل',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w900)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child:
                            Image(image: AssetImage('assets/image/img.jpg'))),
                    SizedBox(height: 16),
                    Text('الفعاليات القادمة',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
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
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0),
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.asset(
                                          'assets/image/img.jpg',
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
                                                fontSize: 18,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w700),
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
                                                fontSize: 18,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0),
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.asset(
                                          'assets/image/img.jpg',
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
                                                fontSize: 18,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w700),
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
                                                fontSize: 18,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                      )
                                    ],
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
                    Text('مساحات العمل',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
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
                                          'assets/image/img.jpg',
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
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0),
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.asset(
                                          'assets/image/img.jpg',
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
