import 'package:cafe/screens/SignupScreen/SignupScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Image.asset(
              'assets/image/logo.png', // Replace with your actual image path
              height: 250,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'أهلا بك',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(height: 20),

            // Email Input
            CustomTextField(
                label: 'الإيميل', keyboardType: TextInputType.emailAddress),

            // Password Input
            CustomTextField(label: 'كلمة السر', obscureText: true),

            // Forgot Password
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {
                  // Handle forgot password action
                },
                child: Text(
                  'نسيت كلمة السر',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),

            SizedBox(height: 10),

            // Sign-in Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle login action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0a2332),
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'تسجيل الدخول',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            SizedBox(height: 10),

            // Register Prompt
            TextButton(
              onPressed: () {
                // Navigate to Signup screen
              },
              child: Text(
                'ليس لديك حساب؟ سجل الآن',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Tajawal',
                  color: Colors.black,
                ),
              ),
            ),

            SizedBox(height: 10),

            // Literary Partner Registration Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Get.to(SignupScreen());
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.grey,
                  side: BorderSide(color: Colors.grey),
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                child: Text(
                  'التسجيل كشريك أدبي',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom text field widget
class CustomTextField extends StatelessWidget {
  final String label;
  final TextInputType keyboardType;
  final bool obscureText;

  const CustomTextField({
    required this.label,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: TextField(
        keyboardType: keyboardType,
        obscureText: obscureText,
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          hintText: label,
          hintStyle: TextStyle(fontFamily: 'Tajawal'),
          contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
