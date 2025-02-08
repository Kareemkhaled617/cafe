
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../edit_cafe_info/cafe_info.dart';

class CafeListScreen extends StatelessWidget {
  const CafeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'قائمة المقاهي',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          CafeItem(name: 'رو كافيه'),
          CafeItem(name: 'وكف'),
          CafeItem(name: 'نادي الكتاب'),
        ],
      ),
    );
  }
}

class CafeItem extends StatelessWidget {
  final String name;

  CafeItem({required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Text(
          name,
          textAlign: TextAlign.end,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: () {
                Get.to(() => CafeInfoScreen());
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.grey[300],
              ),
              child: Text(' عرض'),
            ),
            SizedBox(width: 8),
            TextButton(
              onPressed: () {
                showDeleteConfirmation(name);
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.red,
              ),
              child: Text('حظر'),
            ),
          ],
        ),
      ),
    );
  }

  void showDeleteConfirmation(String cafeName) {
    Get.defaultDialog(
      title: 'حظر الحساب',
      titleStyle: TextStyle(
          fontSize: 22, fontWeight: FontWeight.w900, fontFamily: 'Tajawal'),
      middleText: 'هل أنت متأكد من رغبتك في حظر الحساب؟\nللتأكيد انقر على حظر',
      middleTextStyle: TextStyle(fontSize: 18, fontFamily: 'Tajawal'),
      backgroundColor: Colors.white,
      radius: 10,
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          style: TextButton.styleFrom(
            backgroundColor: Colors.white,
            side: BorderSide(color: Colors.black),
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          ),
          child: Text(
            'إلغاء',
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontFamily: 'Tajawal'),
          ),
        ),
        ElevatedButton(
          onPressed: () {

            Get.back();
            Get.snackbar('تم الحظر', '$cafeName قد تم حظر بنجاح',
                backgroundColor: Colors.red, colorText: Colors.white);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,

            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          ),
          child: Text(
            'حظر',
            style: TextStyle(
                fontSize: 16, color: Colors.white, fontFamily: 'Tajawal'),
          ),
        ),
      ],
    );
  }
}
