import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRAttendanceScreen extends StatelessWidget {
  const QRAttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('مسح الحضور',
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
          children: [
            _buildQRScanner(),
            SizedBox(height: 20),
            _buildConfirmationCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildQRScanner() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 36, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFF1a2833)),
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
      ),
      child: Column(
        children: [
          Text('وجه الكاميرا نحو رمز QR لمسحه',
              style: TextStyle(
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.w800,
                  fontSize: 16)),
          SizedBox(height: 10),
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
            ),
            child: MobileScanner(
              onDetect: (barcode) {
                print("Scanned QR: ${barcode.barcodes}");
              },
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF1a2833),
              minimumSize: Size(150, 40),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
            child: Text('بدء المسح',
                style: TextStyle(
                    fontSize: 18, color: Colors.white, fontFamily: 'Tajawal')),
          ),
        ],
      ),
    );
  }

  Widget _buildConfirmationCard() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('تأكيد الحضور',
              style: TextStyle(
                  fontFamily: 'Tajawal',
                  fontSize: 20,
                  fontWeight: FontWeight.w900)),
          SizedBox(height: 10),
          Text('الاسم: نورا أحمد',
              style: TextStyle(fontFamily: 'Tajawal', fontSize: 18)),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1a2833),
                  minimumSize: Size(100, 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: Text('تأكيد',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontFamily: 'Tajawal')),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFe8dfc2),
                  minimumSize: Size(100, 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: Text('إلغاء',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontFamily: 'Tajawal')),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
