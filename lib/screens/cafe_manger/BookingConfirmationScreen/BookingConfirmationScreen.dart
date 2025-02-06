import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingConfirmationScreen extends StatelessWidget {
  const BookingConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              // Background Image
              Positioned.fill(
                child: Image.asset(
                  'assets/image/logo.png', // Replace with actual image path
                  fit: BoxFit.cover,
                ),
              ),

              // Page Content
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 40),

                    // AppBar with Back & Share Buttons
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundColor: Color(0xFF1a2833),
                            child: IconButton(
                              icon: Icon(Icons.arrow_back_ios_new,
                                  color: Colors.white),
                              onPressed: () => Get.back(),
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: Color(0xFF1a2833),
                            child: IconButton(
                              icon: Icon(Icons.share, color: Colors.white),
                              onPressed: () {
                                // Implement share functionality
                                Get.snackbar("مشاركة", "تمت مشاركة التذكرة",
                                    backgroundColor: Colors.green,
                                    colorText: Colors.white);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 150),

                    // Booking Confirmation Card
                    Container(
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Color(0xFF1a2833),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'تم تأكيد الحجز',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Tajawal',
                              color: Colors.white,
                            ),
                          ),
                          Divider(color: Colors.white, thickness: 1),
                          SizedBox(height: 10),

                          // Booking Details
                          Text(
                            'المدينة المنورة | مقهى حبر',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Tajawal',
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 5),
                          Text(
                            'التاريخ: 15 - 5 - 2024\nالوقت: 4:30',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Tajawal',
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),

                          SizedBox(height: 20),

                          // QR Code Placeholder (Replace with actual QR Code generation)
                          Icon(Icons.qr_code, size: 120, color: Colors.white),
                        ],
                      ),
                    ),

                    SizedBox(height: 60),

                    // Cancel Booking Button
                    ElevatedButton(
                      onPressed: () {
                        Get.snackbar("إلغاء التذكرة", "تم إلغاء التذكرة بنجاح",
                            backgroundColor: Colors.red,
                            colorText: Colors.white);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFe8dfc2),
                        padding:
                            EdgeInsets.symmetric(vertical: 14, horizontal: 100),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        'إلغاء تذكرتك',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
