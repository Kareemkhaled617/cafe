import 'package:cafe/screens/cafe_manger/CreateWorkspaceScreen/CreateTime.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../EventManagmentScreen/EventManagementScreen.dart';
import '../ProfileScreen/ProfileScreen.dart';
import '../RewardsScreen/RewardsScreen.dart';
import '../WorkSpaceManagmentScreen/WorkSpaceManagmentScreen.dart';

class EditWorkspaceScreen extends StatefulWidget {
  const EditWorkspaceScreen({super.key});

  @override
  _EditWorkspaceScreenState createState() => _EditWorkspaceScreenState();
}

class _EditWorkspaceScreenState extends State<EditWorkspaceScreen> {
  int _selectedIndex = 2;

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

  TextEditingController nameController =
      TextEditingController(text: 'مكتب مشترك');
  TextEditingController descriptionController = TextEditingController();
  TextEditingController capacityController = TextEditingController(text: '5');
  TextEditingController priceController = TextEditingController(text: '30');
  List<String> availableTimes = [
    '10:00 am - 11:00 am',
    '11:00 am - 12:00 pm',
    '3:00 pm - 4:00 pm',
    '4:00 pm - 5:00 pm'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      appBar: AppBar(
        title: Text('تعديل مساحة عمل',
            style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 22,
                fontWeight: FontWeight.w900)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextField('الاسم', nameController),
            SizedBox(height: 12),
            _buildTextField('الوصف', descriptionController),
            SizedBox(height: 12),
            _buildTextField('السعة', capacityController),
            SizedBox(height: 12),
            _buildTextField('السعر بالساعة', priceController),
            SizedBox(height: 12),
            CreateTime(),
            SizedBox(height: 12),
            _buildImageUpload(),
            SizedBox(height: 20),
            _buildDeleteButton(),
            SizedBox(height: 10),
            _buildSaveButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label : ',
            style: TextStyle(fontSize: 18, fontFamily: 'Rubik')),
        SizedBox(height: 6),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAvailableTimes() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('الساعات المتاحة:',
            style: TextStyle(fontSize: 16, fontFamily: 'Tajawal')),
        Wrap(
          spacing: 8,
          children: availableTimes.map((time) => _buildTimeChip(time)).toList(),
        ),
      ],
    );
  }

  Widget _buildTimeChip(String time) {
    return Chip(
      label: Text(time, style: TextStyle(fontSize: 14, fontFamily: 'Tajawal')),
      backgroundColor: Colors.grey[200],
      deleteIcon: Icon(Icons.close, size: 18),
      onDeleted: () {
        setState(() => availableTimes.remove(time));
      },
    );
  }

  Widget _buildImageUpload() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('الصورة:', style: TextStyle(fontSize: 16, fontFamily: 'Tajawal')),
        SizedBox(height: 6),
        Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Icon(Icons.upload_file, size: 30, color: Colors.black54),
          ),
        ),
      ],
    );
  }

  Widget _buildDeleteButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        child: Text('حذف مساحة العمل',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Colors.white,
                fontFamily: 'Tajawal')),
      ),
    );
  }

  Widget _buildSaveButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey.shade400,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        child: Text('حفظ التغييرات',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontFamily: 'Tajawal')),
      ),
    );
  }
}
