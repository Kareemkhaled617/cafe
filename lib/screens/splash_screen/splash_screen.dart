import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../SignInScreen/SignInScreen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Image.asset(
              'assets/image/logo.png',
              fit: BoxFit.cover,
              height: 600,
            ),

            Text(
              'اكتشف فعاليات الشريك الأدبي',
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Rubik',
                  color:  Color(0xFF0a2332),
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 30),
            // Navigation Button
            ElevatedButton(
              onPressed: () {
                Get.to(SignInScreen());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:  Color(0xFF0a2332),
                shape: CircleBorder(),
                padding: EdgeInsets.all(16),
              ),
              child: Icon(Icons.arrow_back_rounded, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
