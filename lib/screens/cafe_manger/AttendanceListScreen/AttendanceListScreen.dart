import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AttendanceListScreen extends StatelessWidget {
  final List<Map<String, String>> attendees = [
    {
      'name': 'نورة أحمد',
      'phone': '0547289602',
      'booking': 'مؤكد',
      'attendance': 'تم الحضور'
    },
    {
      'name': 'أيمن إبراهيم',
      'phone': '0587283867',
      'booking': 'ملغي',
      'attendance': '-'
    },
    {
      'name': 'أليئ الجبني',
      'phone': '0557282760',
      'booking': 'مؤكد',
      'attendance': 'لم يحضر'
    },
    {
      'name': 'سالم سالم',
      'phone': '0557238672',
      'booking': 'مؤكد',
      'attendance': 'تم الحضور'
    },
    {
      'name': 'سيف خالد',
      'phone': '0563869093',
      'booking': 'مؤكد',
      'attendance': 'تم الحضور'
    },
  ];

  AttendanceListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('قائمة الحضور',
            style: TextStyle(
                fontFamily: 'Tajawal',
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
            _buildSearchField(),
            SizedBox(height: 16),
            _buildFilterButtons(),
            SizedBox(height: 16),
            _buildAttendanceTable(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'البحث بالاسم أو رقم الجوال',
        filled: true,
        fillColor: Colors.grey[200],
        prefixIcon: Icon(Icons.search, color: Colors.black54),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildFilterButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildFilterButton('حالة الحضور'),
        _buildFilterButton('حالة الحجز'),
      ],
    );
  }

  Widget _buildFilterButton(String title) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(
        Icons.filter_list,
        size: 18,
        color: Colors.white,
      ),
      label: Text(title,
          style: TextStyle(
              fontSize: 16, fontFamily: 'Tajawal', color: Colors.white)),
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF1a2833),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  Widget _buildAttendanceTable() {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(
                label: Text('الاسم',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                        fontFamily: 'Tajawal',
                        color: Colors.grey))),
            DataColumn(
                label: Text('رقم الجوال',
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Tajawal',
                        color: Colors.grey))),
            DataColumn(
                label: Text('حالة الحجز',
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Tajawal',
                        color: Colors.grey))),
            DataColumn(
                label: Text('حالة الحضور',
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Tajawal',
                        color: Colors.grey))),
          ],
          rows: attendees.map((attendee) => _buildDataRow(attendee)).toList(),
        ),
      ),
    );
  }

  DataRow _buildDataRow(Map<String, String> attendee) {
    return DataRow(
      cells: [
        DataCell(Text(attendee['name']!)),
        DataCell(Text(attendee['phone']!)),
        DataCell(Text(attendee['booking']!)),
        DataCell(Text(attendee['attendance']!)),
      ],
    );
  }
}
