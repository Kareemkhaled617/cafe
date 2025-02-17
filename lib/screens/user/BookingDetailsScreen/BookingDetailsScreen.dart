import 'package:cafe/screens/user/BookingConfirmationScreen/BookingConfirmationScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../user_layout/user_layout.dart';

class BookingDetailsScreen extends StatelessWidget {
  BookingDetailsScreen({super.key});

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
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Get.back(),
          ),
          centerTitle: true,
          title: Text(
            'احجز',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
              fontFamily: 'Tajawal',
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Event Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    'assets/image/img.jpg',
                    width: double.infinity,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 12),

                // Event Title & Description
                Text(
                  'بناء الجسور',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Tajawal',
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.right,
                ),
                SizedBox(height: 5),
                Text(
                  'انضم إلينا في حدث "بناء الجسور" الذي يهدف إلى تعزيز التفاهم، التواصل، والتعاون بين الأفراد والمجتمعات.',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Tajawal',
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.right,
                ),
                SizedBox(height: 10),

                // Share Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.snackbar("تمت المشاركة", "تم مشاركة الفعالية بنجاح",
                            backgroundColor: Colors.blue,
                            colorText: Colors.white);
                      },
                      icon: Icon(Icons.ios_share_rounded, color: Colors.black),
                    ),
                    SizedBox(width: 5),
                    Text(
                      'شارك',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Tajawal',
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
                SizedBox(height: 12),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'تفاصيل الحدث',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Tajawal',
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.amber[50],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: 6),
                              Text(
                                'التاريخ :',
                                style: TextStyle(
                                    fontSize: 16, fontFamily: 'Tajawal'),
                              ),
                              SizedBox(width: 6),
                              Text(
                                '15 - 5 - 2024',
                                style: TextStyle(
                                    fontSize: 14, fontFamily: 'Tajawal'),
                              ),
                            ],
                          ),
                          SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: 6),
                              Text(
                                'الوقت :',
                                style: TextStyle(
                                    fontSize: 14, fontFamily: 'Tajawal'),
                              ),
                              SizedBox(width: 6),
                              Text(
                                '4:30 مساءً',
                                style: TextStyle(
                                    fontSize: 14, fontFamily: 'Tajawal'),
                              ),
                            ],
                          ),
                          SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: 6),
                              Text(
                                'المكان :',
                                style: TextStyle(
                                    fontSize: 16, fontFamily: 'Tajawal'),
                              ),
                              SizedBox(width: 6),
                              Text(
                                'مقهى حبر',
                                style: TextStyle(
                                    fontSize: 14, fontFamily: 'Tajawal'),
                              ),
                            ],
                          ),
                          SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: 6),
                              Text(
                                'الدخول :',
                                style: TextStyle(
                                    fontSize: 16, fontFamily: 'Tajawal'),
                              ),
                              SizedBox(width: 6),
                              Text(
                                'مجاني',
                                style: TextStyle(
                                    fontSize: 14, fontFamily: 'Tajawal'),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Icon(
                        Icons.location_on,
                        size: 50,
                      )
                    ],
                  ),
                ),

                SizedBox(height: 16),

                // Booking Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      showBookingConfirmationDialog(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF1a2833),
                      padding: EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      'احجز تذكرتك',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Tajawal',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void showBookingConfirmationDialog(BuildContext context) {
    int ticketCount = 1;

    Get.defaultDialog(
      title: 'تأكيد حجزك',
      titleStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        fontFamily: 'Tajawal',
      ),
      content: StatefulBuilder(
          builder: (context, setState) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'حدد عدد التذاكر',
                    style: TextStyle(fontSize: 20, fontFamily: 'Tajawal'),
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(height: 8),

                  // Number Picker (Quantity Selection)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (ticketCount < 10) {
                            setState(() {
                              ticketCount++;
                            });

                            Get.forceAppUpdate();
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black),
                          ),
                          child: Icon(Icons.add, size: 18),
                        ),
                      ),
                      SizedBox(width: 12),
                      Text(
                        ticketCount.toString(),
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 12),
                      GestureDetector(
                        onTap: () {
                          if (ticketCount > 1) {
                            ticketCount--;
                            Get.forceAppUpdate();
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black),
                          ),
                          child: Icon(Icons.remove, size: 18),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),

                  // Instruction Text
                  Text(
                    'انقر على حجز لتحصل على تذكرتك',
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Tajawal',
                        color: Colors.grey[600]),
                    textAlign: TextAlign.right,
                  ),
                ],
              )),
      cancel: ElevatedButton(
        onPressed: () {
          Get.to(BookingConfirmationScreen());
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF1a2833),
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        ),
        child: Text(
          'حجز',
          style: TextStyle(
              fontSize: 16, fontFamily: 'Tajawal', color: Colors.white),
        ),
      ),
      confirm: OutlinedButton(
        onPressed: () {
          Get.back(); // Close Dialog
        },
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          side: BorderSide(color: Colors.black),
        ),
        child: Text(
          'إلغاء',
          style: TextStyle(
              fontSize: 16, fontFamily: 'Tajawal', color: Colors.black),
        ),
      ),
      radius: 12,
    );
  }
}
