import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../CafeRegister/cafe_register.dart';
import '../ResetPasswordScreen/ResetPasswordScreen.dart';
import '../SignupScreen/SignupScreen.dart';
import '../cafe_admin_layout/cafe_admin_layout.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo
                  Image.asset(
                    'assets/image/logo.png',
                    height: constraints.maxWidth > 600 ? 300 : 200,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'أهلا بك',
                      style: TextStyle(
                        fontSize: constraints.maxWidth > 600 ? 26 : 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
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
                        Get.to(ResetpasswordScreen());
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
                    height: constraints.maxWidth > 600 ? 60 : 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(CafeAdminLayout());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF0a2332),
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
                      Get.to(SignupScreen());
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
                    height: constraints.maxWidth > 600 ? 60 : 50,
                    child: OutlinedButton(
                      onPressed: () {
                        Get.to(RegisterLiteraryPartnerScreen());
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.grey,
                        side: BorderSide(color: Colors.grey),
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
          ),
        );
      },
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
          hintStyle: TextStyle(fontFamily: 'Rubik'),
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
