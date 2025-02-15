import 'package:cafe/screens/cafe_manger/EditProfileScreen/EditProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class CreateTime extends StatefulWidget {
  const CreateTime({super.key});

  @override
  State<CreateTime> createState() => _CreateTimeState();
}

class _CreateTimeState extends State<CreateTime> {
  DateTime _selectedDate = DateTime.now();
  String? _startTime;
  String? _endTime;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Color(0xFFe1e1e1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child:  Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 📅 التقويم
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(10),
                child: TableCalendar(
                  focusedDay: _selectedDate,
                  firstDay: DateTime(2020),
                  lastDay: DateTime(2030),
                  selectedDayPredicate: (day) => isSameDay(day, _selectedDate),
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDate = selectedDay;
                    });
                  },
                  calendarStyle: CalendarStyle(
                    selectedDecoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    todayDecoration: BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 16),

              // ⏳ اختيار وقت البداية
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: "وقت البداية",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                items: ["10:00 AM", "12:00 PM", "3:00 PM"]
                    .map((time) => DropdownMenuItem(
                  value: time,
                  child: Text(time),
                ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _startTime = value;
                  });
                },
              ),

              SizedBox(height: 16),

              // ⏳ اختيار وقت النهاية
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: "وقت النهاية",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                items: ["11:00 AM", "1:00 PM", "4:00 PM"]
                    .map((time) => DropdownMenuItem(
                  value: time,
                  child: Text(time),
                ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _endTime = value;
                  });
                },
              ),

              SizedBox(height: 20),

              // ✅ زر تأكيد
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  if (_startTime != null && _endTime != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("تم تأكيد الوقت: $_startTime - $_endTime"),
                      ),
                    );
                  }
                },
                child: Text("تأكيد التاريخ والوقت", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),

    );
  }

}






