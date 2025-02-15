import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_forward))
              ],
            ),
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
                    height: 250,
                    fit: BoxFit.cover,
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
                      color: Color(0xFF0a2332),
                    ),
                  ),
                  SizedBox(height: 10),
                  CustomTextField(label: 'الاسم'),
                  CustomTextField(
                      label: 'رقم الجوال', keyboardType: TextInputType.phone),
                  CustomTextField(
                      label: 'الإيميل',
                      keyboardType: TextInputType.emailAddress),
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
                      InkWell(
                        onTap: () {
                          showTermsDialog(context);
                        },
                        child: Text(
                          'الشروط والأحكام',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'Tajawal'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {

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
      ),
    );
  }

  void showTermsDialog(BuildContext context) {
    bool isChecked = false;
    bool showTermsText = false;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('الشروط والأحكام', style:TextStyle( color: Color(0xFF0a2332),),textAlign: TextAlign.center),
              content: SizedBox(
                height: 300, // تحديد ارتفاع ثابت للتمكن من التمرير
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "مرحبًا بك في تطبيقنا! باستخدامك لهذا التطبيق، فإنك توافق على الشروط والأحكام التالية: "
                            "\n\n1. القبول والاستخدام: يجب عليك استخدام التطبيق وفقًا للقوانين المعمول بها."
                            "\n\n2. الحسابات والأمان: أنت مسؤول عن معلومات تسجيل الدخول الخاصة بك."
                            "\n\n3. سياسة الخصوصية: نحن نحمي بياناتك ولن نشاركها دون موافقتك."
                            "\n\n4. حقوق الملكية الفكرية: جميع المحتويات محمية بحقوق النشر والعلامات التجارية."
                            "\n\n5. التعديلات على الشروط: يحق لنا تعديل هذه الشروط في أي وقت."
                            "\n\n6. تحديد المسؤولية: لا نتحمل أي مسؤولية عن الأضرار الناتجة عن استخدام التطبيق."
                            "\n\n7. الإنهاء: يحق لنا إنهاء حسابك في حال مخالفة الشروط.",
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('تم'),
                ),
              ],
            );
          },
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
    super.key,
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
          hintStyle: TextStyle(color: Color(0xFF0a2332),fontWeight: FontWeight.w800, fontSize: 18),
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
