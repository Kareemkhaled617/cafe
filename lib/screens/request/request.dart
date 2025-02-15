import 'package:cafe/screens/cafe_admin_layout/cafe_admin_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../cafe_request_info/cafe_request_info.dart';

class RequestsScreen extends StatelessWidget {
  const RequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // الحصول على حجم الشاشة
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(leading: Text(''),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'طلبات الانضمام',
          style: TextStyle(color:Color(0xFF0a2332),fontFamily:'Rubik',fontSize: width * 0.08, fontWeight: FontWeight.w900),
    
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(width * 0.04),
        children: [
          RequestItem(name: 'عريب', date: '2024/9/12', width: width),
          RequestItem(name: 'حبر', date: '2024/9/12', width: width),
          RequestItem(name: 'كفة', date: '2024/10/2', width: width),
          RequestItem(name: 'هارينا', date: '2024/11/2', width: width),
        ],
      ),

    );
  }
}

class RequestItem extends StatefulWidget {
  final String name;
  final String date;
  final double width;

  const RequestItem({required this.name, required this.date, required this.width});

  @override
  State<RequestItem> createState() => _RequestItemState();
}

class _RequestItemState extends State<RequestItem> {
  @override
  Widget build(BuildContext context) {
    return Card(color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: widget.width * 0.02),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.all(widget.width * 0.04),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: TextStyle(
                    fontSize: widget.width * 0.05,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: widget.width * 0.01),
                Text(
                  'تاريخ الطلب ${widget.date}',
                  style: TextStyle(
                    fontSize: widget.width * 0.045,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => RequestReviewScreen());
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Color(0xFFede1c3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: widget.width * 0.06,
                  vertical: widget.width * 0.02,
                ),
              ),
              child: Text(
                'مراجعة الطلب',
                style: TextStyle(fontFamily: 'Rubik',
                  fontWeight: FontWeight.w800,
color: Color(0xFF0a2332),
                  fontSize: widget.width * 0.045,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
