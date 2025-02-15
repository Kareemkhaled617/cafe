import 'package:cafe/screens/cafe_manger/ProfileScreen/ProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:url_launcher/url_launcher.dart';

class RegisterLiteraryPartnerScreen extends StatefulWidget {
  @override
  _RegisterLiteraryPartnerScreenState createState() =>
      _RegisterLiteraryPartnerScreenState();
}

class _RegisterLiteraryPartnerScreenState
    extends State<RegisterLiteraryPartnerScreen> {
  String? selectedFilePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
        title: Image.asset(
          'assets/image/logo.png', // Replace with actual image path
          height: 70,
        ),
      ),
      body: SingleChildScrollView(

        padding: EdgeInsets.all(16),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10),

            // Title
            Text(
              'التسجيل كشريك أدبي',
              style: TextStyle(
                fontSize: 22,
                color:  Color(0xFF0a2332),
                fontWeight: FontWeight.bold,
                fontFamily: 'Rubik',
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 20),

            // Form Fields
            CustomTextField(label: 'اسم المقهى'),
            CustomTextField(label: 'الإيميل', keyboardType: TextInputType.emailAddress),
            CustomTextField(label: 'رقم الجوال', keyboardType: TextInputType.phone),
            CustomTextField(label: 'الموقع: المدينة، الحي، الشارع'),

            SizedBox(height: 10),

            // Upload File Section
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'الرجاء إرفاق صورة الترخيص للشريك الأدبي',
                style: TextStyle( color: Color(0xFF0a2332),fontSize: 14, fontFamily: 'Rubik'),
              ),
            ),
            SizedBox(height: 10),

            FileUploadSection(
              onFileSelected: (filePath) {
                setState(() {
                  selectedFilePath = filePath;
                });
              },
              selectedFilePath: selectedFilePath,
            ),

            SizedBox(height: 20),

            // Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
              Get.to(ProfileScreen(),);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFede1c3),
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'أرسل الطلب',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Rubik',
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            // Support Contact
            GestureDetector(
              onTap: () {},
              child: Text(
                'لأي استفسارات، يرجى الاتصال بنا على\nsupport@jisoor.com',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Rubik',
                  color: Color(0xFF0a2332),
                ),
              ),
            ),

            SizedBox(height: 10),

            // Copyright
            Directionality(
              textDirection: TextDirection.ltr,
              child: Text(
                '© 2024 Jisoor- All Rights Reserved',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Rubik',
                  color:  Color(0xFF0a2332),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  // void launchEmail() async {
  //   final Uri emailLaunchUri = Uri(
  //     scheme: 'mailto',
  //     path: 'support@jisoor.com',
  //   );
  //   if (await canLaunch(emailLaunchUri.toString())) {
  //     await launch(emailLaunchUri.toString());
  //   } else {
  //     Get.snackbar('خطأ', 'لا يمكن فتح البريد الإلكتروني',
  //         backgroundColor: Colors.red, colorText: Colors.white);
  //   }
  // }
}

// Custom TextField
class CustomTextField extends StatelessWidget {
  final String label;
  final TextInputType keyboardType;

  CustomTextField({required this.label, this.keyboardType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: TextField(
        keyboardType: keyboardType,
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

// File Upload Section
class FileUploadSection extends StatelessWidget {
  final Function(String?) onFileSelected;
  final String? selectedFilePath;

  FileUploadSection({required this.onFileSelected, this.selectedFilePath});

  // Future<void> pickFile() async {
  //   try {
  //     if (!GetPlatform.isWeb) { // Avoid issues on web
  //       await FilePicker.platform.clearTemporaryFiles();
  //     }
  //
  //     FilePickerResult? result = await FilePicker.platform.pickFiles();
  //     if (result != null) {
  //       String? filePath = result.files.single.path;
  //       onFileSelected(filePath);
  //     }
  //   } catch (e) {
  //     Get.snackbar("خطأ", "تعذر اختيار الملف: $e",
  //         backgroundColor: Colors.red, colorText: Colors.white);
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Column(
          children: [
            Icon(Icons.drive_folder_upload, size: 40, color:  Color(0xFF0a2332),),
            SizedBox(height: 8),
            Text(
              selectedFilePath != null
                  ? 'تم اختيار الملف'
                  : 'اختر ملفًا من جهازك',
              style: TextStyle(color:  Color(0xFF0a2332),fontSize: 14, fontFamily: 'Rubik'),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  backgroundColor:  Color(0xFF0a2332),
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'اختيار ملف',
                  style: TextStyle(fontSize: 16, fontFamily: 'Rubik', color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}