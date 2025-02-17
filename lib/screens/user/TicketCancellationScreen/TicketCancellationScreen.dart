import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../user_layout/user_layout.dart';

class TicketCancellationScreen extends StatelessWidget {
   TicketCancellationScreen({super.key});
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
            'إلغاء تذكرتي',
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
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                TicketCard(
                  title: 'بناء الجسور',
                  date: '2024\\5\\15',
                  location: 'مقهى حبر',
                  imageUrl: 'assets/image/logo.png',
                ),
                TicketCard(
                  title: 'حوارات ثقافية',
                  date: '2024\\3\\18',
                  location: 'مقهى رو',
                  imageUrl: 'assets/image/logo.png',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// **Ticket Card Widget**
class TicketCard extends StatelessWidget {
  final String title;
  final String date;
  final String location;
  final String imageUrl;

  TicketCard({
    required this.title,
    required this.date,
    required this.location,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Event Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imageUrl,
              width: 100,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Tajawal',
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.right,
                ),
                SizedBox(height: 4),
                Text(
                  '📅 التاريخ: $date',
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Tajawal',
                      color: Colors.black87),
                  textAlign: TextAlign.right,
                ),
                SizedBox(height: 4),
                Text(
                  '📍 المكان: $location',
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Tajawal',
                      color: Colors.black87),
                  textAlign: TextAlign.right,
                ),
                SizedBox(height: 10),
                // Cancel Button
                Align(
                  alignment: Alignment.centerLeft,
                  child: ElevatedButton(
                    onPressed: () {
                      showCancelTicketDialog(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF1a2833),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      'إلغاء التذكرة',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Tajawal',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// **Cancellation Confirmation Dialog**
void showCancelTicketDialog(BuildContext context) {
  Get.defaultDialog(
    backgroundColor: Color(0xFFf8f5ec),
    title: 'هل أنت متأكد من رغبتك في إلغاء التذكرة؟',
    titleStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      fontFamily: 'Tajawal',
      color: Colors.black,
    ),
    content: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'يرجى ملاحظة أن قيمة التذكرة سيتم إضافتها إلى محفظتك لاستخدامها في الحجوزات المستقبلية',
            style: TextStyle(
                fontSize: 14, fontFamily: 'Tajawal', color: Colors.black87),
            textAlign: TextAlign.right,
          ),
          SizedBox(height: 10),
        ],
      ),
    ),
    confirm: ElevatedButton(
      onPressed: () {
        Get.back(); // Close Dialog
        Get.snackbar(
            "تم الإلغاء", "تم إلغاء تذكرتك بنجاح، وتمت إضافة القيمة إلى محفظتك",
            backgroundColor: Colors.green, colorText: Colors.white);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF1a2833),
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
      ),
      child: Text(
        'تأكيد الإلغاء',
        style:
            TextStyle(fontSize: 16, fontFamily: 'Tajawal', color: Colors.white),
      ),
    ),
    cancel: OutlinedButton(
      onPressed: () {
        Get.back(); // Close Dialog
      },
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        side: BorderSide(color: Colors.black),
      ),
      child: Text(
        'إلغاء الطلب',
        style:
            TextStyle(fontSize: 16, fontFamily: 'Tajawal', color: Colors.black),
      ),
    ),
    radius: 12,
  );
}
