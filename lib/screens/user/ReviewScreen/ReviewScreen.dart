import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  final TextEditingController _reviewController = TextEditingController();
  int _selectedStars = 0;

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

        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: (index) {

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
            'تقييماتي',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
              fontFamily: 'Tajawal',
            ),
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Review Input Section
                Container(
                  width: constraints.maxWidth > 500 ? 500 : constraints.maxWidth,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'عبّر عن رأيك',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Tajawal',
                        ),
                      ),
                      SizedBox(height: 10),

                      // Review TextField
                      TextField(
                        controller: _reviewController,
                        maxLines: 3,
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          hintText: 'شارك تجربتك...',
                          hintStyle: TextStyle(fontSize: 14, fontFamily: 'Tajawal'),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),

                      // Rating Title
                      Text(
                        'عبّر عن رضاك عن الفعالية',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Tajawal',
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.right,
                      ),

                      SizedBox(height: 10),

                      // Star Rating
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(5, (index) {
                          return IconButton(
                            onPressed: () {
                              setState(() {
                                _selectedStars = index + 1;
                              });
                            },
                            icon: Icon(
                              index < _selectedStars ? Icons.star : Icons.star_border,
                              size: 30,
                              color: Colors.black,
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 40),

                // Submit Button
                SizedBox(
                  width: constraints.maxWidth > 500 ? 500 : constraints.maxWidth,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_selectedStars == 0 || _reviewController.text.isEmpty) {
                        Get.snackbar("خطأ", "يرجى إدخال تقييمك وكتابة تعليق",
                            backgroundColor: Colors.red, colorText: Colors.white);
                      } else {
                        Get.snackbar("شكرًا لك!", "تمت مشاركة رأيك بنجاح",
                            backgroundColor: Colors.green, colorText: Colors.white);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF1a2833),
                      padding: EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      'شارك رأيك',
                      style: TextStyle(
                        fontSize: 18,
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
}
