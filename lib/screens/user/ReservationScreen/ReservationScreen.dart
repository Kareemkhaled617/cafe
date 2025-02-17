import 'package:cafe/screens/user/UserProfileScreen/UserProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../cafe_manger/WorkspacesScreen/WorkspacesScreen.dart';
import '../HomeScreen/HomeScreen.dart';
import '../user_layout/user_layout.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({super.key});

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  int _selectedIndex = 1; // العنصر المحدد حاليًا

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Get.off(UserLayout(
          selectPage: 0,
        ));
        break;
      case 1:
        Get.off(UserLayout(
          selectPage: 1,
        ));
        break;
      case 2:
        Get.off(UserLayout(
          selectPage: 2,
        ));

        break;
      case 3:
        Get.off(UserLayout(
          selectPage: 3,
        ));

        break;
    }
  }

  Future<void> _selectTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        _timeController.text = pickedTime.format(context);
      });
    }
  }

  DateTime _selectedDay = DateTime.now();
  TextEditingController _timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.airplane_ticket_sharp), label: ''),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          _onItemTapped(index);
        },
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Color(0xFF0a2332)),
          onPressed: () => Get.back(),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "احجز مساحة عملك",
          style: TextStyle(
              color: Color(0xFF0a2332),
              fontSize: 20,
              fontFamily: 'Rubik',
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Color(0xFF0a2332),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "تفاصيل الحجز",
              style: TextStyle(
                  color: Color(0xFF0a2332),
                  fontSize: 20,
                  fontFamily: 'Rubik',
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ExpansionTile(
              title: Text("اختر اليوم",
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF0a2332),
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.bold)),
              children: [
                TableCalendar(
                  focusedDay: _selectedDay,
                  firstDay: DateTime(2022),
                  lastDay: DateTime(2030),
                  calendarFormat: CalendarFormat.month,
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                    });
                  },
                  headerStyle: HeaderStyle(
                      formatButtonVisible: false, titleCentered: true),
                  calendarStyle: CalendarStyle(
                    selectedDecoration: BoxDecoration(
                      color: Colors.blueGrey,
                      shape: BoxShape.circle,
                    ),
                    todayDecoration: BoxDecoration(
                      color: Colors.blueGrey.shade200,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            TextField(
              controller: _timeController,
              readOnly: true,
              onTap: _selectTime,
              decoration: InputDecoration(
                labelText: "اختر الوقت",
                suffixIcon: Icon(Icons.access_time),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // تنفيذ الدفع هنا
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey.shade900,
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text(
                "استمر للدفع",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
