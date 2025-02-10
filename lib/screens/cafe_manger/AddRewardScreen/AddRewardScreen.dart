import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddRewardScreen extends StatelessWidget {
  const AddRewardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('إضافة مكافأة',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'اسم المكافأة',
                filled: true,
                fillColor: Colors.grey.withOpacity(.1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              decoration: InputDecoration(
                hintText: 'عدد النقاط المطلوبة',
                filled: true,
                fillColor: Colors.grey.withOpacity(.1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 15),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.upload, color: Colors.black),
                    SizedBox(width: 5),
                    Text('رفع صورة', style: TextStyle(color: Colors.black)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: Color(0xFF1a2833),
                ),
                onPressed: () {},
                child: Text('إضافة',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
