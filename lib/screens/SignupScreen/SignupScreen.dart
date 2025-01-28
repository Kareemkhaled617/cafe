import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _acceptTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Header with image and title
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                child: Image.asset(
                  'assets/image/logo.png',
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 70,
                left: 20,
                right: 20,
                child: Column(
                  children: [
                    Text(
                      'اكتشف الفعاليات',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Tajawal',
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 5),
                    Text(
                      'كتب، شعر و أكثر',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontFamily: 'Tajawal',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 20),


          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'إنشاء حساب',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,

                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 10),

                CustomTextField(label: 'الاسم'),
                CustomTextField(label: 'رقم الجوال', keyboardType: TextInputType.phone),
                CustomTextField(label: 'الإيميل', keyboardType: TextInputType.emailAddress),
                CustomTextField(label: 'كلمة السر', obscureText: true),
                CustomTextField(label: 'تأكيد كلمة السر', obscureText: true),

                SizedBox(height: 10),


                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: _acceptTerms,
                      onChanged: (value) {
                        setState(() {
                          _acceptTerms = value!;
                        });
                      },
                      activeColor: Colors.black,
                    ),
                    Text(
                      'الشروط والأحكام',
                      style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800, fontFamily: 'Tajawal'),
                    ),

                  ],
                ),

                SizedBox(height: 10),


                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle signup action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF0a2332),
                      padding: EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'انضمام',
                      style: TextStyle(
                        fontSize: 18,
                       fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Custom text field widget
class CustomTextField extends StatelessWidget {
  final String label;
  final TextInputType keyboardType;
  final bool obscureText;

  const CustomTextField({super.key,
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

          hintStyle: TextStyle(fontWeight: FontWeight.w800,fontSize: 18),
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
