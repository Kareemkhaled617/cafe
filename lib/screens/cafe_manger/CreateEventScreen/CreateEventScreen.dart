import 'package:cafe/screens/cafe_manger/ProfileScreen/ProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../EventManagmentScreen/EventManagementScreen.dart';
import '../RewardsScreen/RewardsScreen.dart';
import '../WorkSpaceManagmentScreen/WorkSpaceManagmentScreen.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({super.key});

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  int _selectedIndex = 1;

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

  BottomNavigationBarItem _buildNavItem(
      IconData icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color:
              _selectedIndex == index ? Color(0xFF0a2332) : Colors.transparent,
        ),
        child: Icon(icon,
            color: _selectedIndex == index ? Colors.white : Color(0xFF0a2332)),
      ),
      label: label,
    );
  }

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
          _buildNavItem(Icons.card_giftcard_rounded, '', 0),
          _buildNavItem(Icons.grid_on_rounded, '', 1),
          _buildNavItem(Icons.calendar_month, "", 2),
          _buildNavItem(Icons.person, "", 3),
        ],
      ),
      appBar: AppBar(
        title: Text('إنشاء فعالية جديدة',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildTextField('عنوان الفعالية'),
              _buildTextField('وصف الفعالية', maxLines: 3),
              _buildTextField('السعر'),
              _buildDropdown('فئة الفعالية'),
              SizedBox(height: 16.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 50),
                ),
                onPressed: () => _showCalendarDialog(context),
                child: Text(
                    'الوقت                                                                                                                            '),
              ),
              SizedBox(height: 16.0),
              _buildTextField('30.'),
              SizedBox(height: 16.0),
              _buildUploadButton(),
              SizedBox(height: 36.0),
              _buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, {int maxLines = 1}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(color: Colors.white)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(color: Colors.black12)),
          filled: true,
          fillColor: Colors.white,
        ),
        maxLines: maxLines,
      ),
    );
  }

  Widget _buildDropdown(String hint) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.0),
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
          filled: true,
          fillColor: Colors.white,
        ),
        items: ['فئة 1', 'فئة 2', 'فئة 3']
            .map((e) => DropdownMenuItem(child: Text(e), value: e))
            .toList(),
        onChanged: (value) {},
      ),
    );
  }

  Widget _buildUploadButton() {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(Icons.upload),
      label: Text('رفع صورة'),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.grey[300],
        minimumSize: Size(double.infinity, 50),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF0a2332),
        minimumSize: Size(double.infinity, 50),
      ),
      child: Text('إنشاء الفعالية',
          style: TextStyle(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.w800)),
    );
  }
}

void _showCalendarDialog(BuildContext context) {
  DateTime _selectedDate = DateTime.now();
  String? _startTime;
  String? _endTime;

  showDialog(
    context: context,
    builder: (context) {
      return Container(
        color: Colors.black12,
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 📅 Title
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Spacer(),
                    Text(
                      "",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Spacer(),
                  ],
                ),
                SizedBox(height: 10),

                // 📅 Calendar
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: TableCalendar(
                    focusedDay: _selectedDate,
                    firstDay: DateTime(2020),
                    lastDay: DateTime(2030),
                    selectedDayPredicate: (day) =>
                        isSameDay(day, _selectedDate),
                    onDaySelected: (selectedDay, focusedDay) {
                      _selectedDate = selectedDay;
                    },
                    calendarStyle: CalendarStyle(
                      selectedDecoration: BoxDecoration(
                        color: Color(0xFFe1e1e1),
                        shape: BoxShape.circle,
                      ),
                      todayDecoration: BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),
                    daysOfWeekVisible: true,
                    // ✅ إظهار أيام الأسبوع
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      // إخفاء زر تغيير الشكل
                      titleCentered: true,
                      // توسيط اسم الشهر والسنة
                      titleTextStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      leftChevronIcon:
                          Icon(Icons.chevron_left, color: Colors.black),
                      rightChevronIcon:
                          Icon(Icons.chevron_right, color: Colors.black),
                    ),
                  ),
                ),

                SizedBox(height: 16),

                // ⏳ اختيار وقت البداية
                Container(
                  color: Colors.white,
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: "وقت البداية",
                    ),
                    items: ["10:00 AM", "12:00 PM", "3:00 PM"]
                        .map((time) => DropdownMenuItem(
                              value: time,
                              child: Text(time),
                            ))
                        .toList(),
                    onChanged: (value) {
                      _startTime = value;
                    },
                  ),
                ),

                SizedBox(height: 16),

                // ⏳ اختيار وقت النهاية
                Container(
                  color: Colors.white,
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: "وقت النهاية",
                    ),
                    items: ["11:00 AM", "1:00 PM", "4:00 PM"]
                        .map((time) => DropdownMenuItem(
                              value: time,
                              child: Text(time),
                            ))
                        .toList(),
                    onChanged: (value) {
                      _endTime = value;
                    },
                  ),
                ),

                SizedBox(height: 20),

                // ✅ زر تأكيد
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0a2332),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    if (_startTime != null && _endTime != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:
                              Text("تم تأكيد الوقت: $_startTime - $_endTime"),
                        ),
                      );
                      Navigator.pop(context); // Close the dialog
                    }
                  },
                  child: Text("تأكيد التاريخ والوقت",
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
