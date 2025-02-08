import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkspaceManagementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'مساحات العمل',
          style: TextStyle(
            fontFamily: 'Rubik',
            fontSize: screenWidth * 0.05, // Responsive font size
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white70,
        elevation: 0,
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.01),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'إنشاء مساحة عمل',
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  color: Colors.white,
                  fontFamily: 'Rubik',
                ),
              ),
            ),
          ),
        ],
        leading: Padding(
          padding: EdgeInsets.all(screenWidth * 0.02),
          child: Image.asset('assets/image/logo.png'),
        ),
      ),
      body:
      Container(
        decoration: BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(

          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.04),
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  'مساحات العمل المتاحة',
                  style: TextStyle(
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Rubik',
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                _buildAvailableWorkspaces(screenWidth, screenHeight),
                SizedBox(height: screenHeight * 0.03),
                Text(
                  'مساحات العمل المحجوزة',
                  style: TextStyle(
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Rubik',
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                _buildReservedWorkspace(screenWidth, screenHeight),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAvailableWorkspaces(double screenWidth, double screenHeight) {
    return Column(
      children: [
        _workspaceCard(
          'مكتب مشترك',
          'السعة: 5 مقاعد',
          ['09:00 AM', '10:00 AM', '11:00 AM'],
          screenWidth,
          screenHeight,
        ),
        _workspaceCard(
          'غرفة الاجتماعات',
          'السعة: 10 مقاعد',
          ['12:00 PM', '01:00 PM', '02:00 PM'],
          screenWidth,
          screenHeight,
        ),
      ],
    );
  }

  Widget _buildReservedWorkspace(double screenWidth, double screenHeight) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 7,

      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'مكتب خاص',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: screenWidth * 0.045,
                fontFamily: 'Rubik',
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              'الوقت: 5 م - 7 م',
              style: TextStyle(fontFamily: 'Rubik'),
            ),
            Text(
              'السعر: 150 ريال',
              style: TextStyle(fontFamily: 'Rubik'),
            ),
            SizedBox(height: screenHeight * 0.015),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                'عرض معلومات العميل',
                style: TextStyle(fontFamily: 'Rubik',color: Colors.black,backgroundColor: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _workspaceCard(
      String title,
      String capacity,
      List<String> times,
      double screenWidth,
      double screenHeight,
      ) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 7,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [

                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.045,
                    fontFamily: 'Rubik',
                  ),
                ),
                SizedBox(width: 90,),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),

                      ),
                    ),
                    child: Text(
                      'تعديل',
                      style: TextStyle(fontFamily: 'Rubik',color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              capacity,
              style: TextStyle(fontFamily: 'Rubik'),
            ),
            SizedBox(height: screenHeight * 0.010),
            Wrap(
              spacing: screenWidth * 0.01,
              children: times.map((time) => _timeButton(time, screenWidth)).toList(),
            ),
            SizedBox(height: screenHeight * 0.010),

          ],
        ),
      ),
    );
  }

  Widget _timeButton(String time, double screenWidth) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        side: BorderSide(color: Colors.black),
      ),
      child: Text(
        time,
        style: TextStyle(
          color: Colors.black,
          fontSize: screenWidth * 0.035,
          fontFamily: 'Rubik',
        ),
      ),
    );
  }
}
