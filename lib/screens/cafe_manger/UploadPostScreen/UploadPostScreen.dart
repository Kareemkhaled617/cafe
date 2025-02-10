import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadPostScreen extends StatelessWidget {
  const UploadPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'رفع منشور',
          style: TextStyle(
              color: Color(0xFF0a2332),
              fontSize: 22,
              fontFamily: 'Rubik',
              fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  // Implement image picker functionality
                },
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.3),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.upload, color: Colors.black),
                      SizedBox(width: 8),
                      Text(
                        'رفع صورة',
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Rubik',
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'كتابة نص...',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey)),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0a2332),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    // Implement share functionality
                  },
                  child: Text(
                    'شارك',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
