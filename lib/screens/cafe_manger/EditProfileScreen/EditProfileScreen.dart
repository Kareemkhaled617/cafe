import 'package:cafe/screens/cafe_manger/ProfileScreen/ProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../EventManagmentScreen/EventManagementScreen.dart';
import '../RewardsScreen/RewardsScreen.dart';
import '../WorkSpaceManagmentScreen/WorkSpaceManagmentScreen.dart';
import 'ChangePasswordDialog.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  int _selectedIndex = 3;

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Get.to(RewardsScreen());
        break;
      case 1:
        Get.to(EventManagementScreen());
        break;
      case 2:
        Get.to(WorkspaceManagementScreen());
      case 3:
        Get.to(ProfileScreen());
        break;
    }
  }
  BottomNavigationBarItem _buildNavItem(IconData icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: _selectedIndex == index ? Color(0xFF0a2332) : Colors.transparent,

        ),
        child: Icon(icon, color: _selectedIndex == index ? Colors.white : Color(0xFF0a2332)),
      ),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        onTap: _onItemTapped,
        items: [
          _buildNavItem(Icons.card_giftcard_rounded, '',0),
          _buildNavItem(Icons.grid_on_rounded,'', 1),
          _buildNavItem(Icons.calendar_month, "", 2),
          _buildNavItem(Icons.person, "", 3),
        ],
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'تعديل الملف الشخصي',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: SingleChildScrollView(

          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'الصورة',
                style: TextStyle(
                    fontSize: 16,

                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF0a2332)),
              ),
              Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/image/profile_img.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              buildTextField( 'الاسم','مساحة رو | ROW Space',),
              buildTextField('الوصف',
                  'مقهى ومحمصة رو | تعزز الثقافة والأدب عبر فعاليات إبداعية ضمن مبادرة #الشريك_الأدبي'),
              buildTextField('الإيميل',"RowCafe@gmail.com" ),
              buildTextField('رقم الجوال', '96654378954'),
              SizedBox(height: 10),
              GestureDetector(

                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => ChangePasswordDialog(),
                  );
                },
                child: Row(
                  children: [

                    SizedBox(width: 5),
                    Text(
                      'تغيير كلمة المرور',
                      style: TextStyle(
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade700),
                    ),
                    Icon(Icons.edit, size: 20, color: Colors.grey.shade700),
                  ],
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade400,
                  minimumSize: Size(double.infinity, 50),
                ),
                onPressed: () {
                 Get.to(ProfileScreen());
                },
                child: Text(

                  'حفظ التغييرات',
                  style: TextStyle(
                      fontSize: 18,

                      color: Colors.black,    fontFamily: 'Rubik',
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, String hint) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 18,      fontFamily: 'Rubik',fontWeight: FontWeight.w500,color:  Color(0xFF0a2332)),
          ),
          SizedBox(
            height: 2,
          ),
          TextField(
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              labelText: label,
              hintText: hint,

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey.withOpacity(.3)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey.withOpacity(.3)),
              ),
              filled: false,
              fillColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
