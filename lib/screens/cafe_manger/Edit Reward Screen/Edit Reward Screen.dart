import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditRewardScreen extends StatelessWidget {
  const EditRewardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
        backgroundColor: Colors.white,
        title: Text('تعديل المكافأة', style: TextStyle(fontFamily:'Rubik',fontWeight: FontWeight.w700,color: Color(0xFF0a2332),),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
      ),
      body: Container(       decoration:BoxDecoration(color: Colors.white,),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildTextField('قهوة اليوم'),
              SizedBox(height: 12),
              _buildTextField('30', isNumber: true),
              SizedBox(height:12),
              _buildImageSection(),
              SizedBox(height: 20),
              _buildDeleteButton(),
              SizedBox(height: 12),
              _buildSaveButton(),
            ],
          ),
        ),
      ),

    );
  }

  Widget _buildTextField( String hint, {bool isNumber = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        SizedBox(height: 8),
        TextField(

          keyboardType: isNumber ? TextInputType.number : TextInputType.text,
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildImageSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        SizedBox(height: 8),
        Container(
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey),
          ),
          child: Center(
            child: CircleAvatar(child: Image.asset('assets/image/reward_img.png', height: 60,width: 60,)),
          ),
        ),
      ],
    );
  }

  Widget _buildDeleteButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        ),
        onPressed: () {},
        child: Text('إلغاء المكافأة', style: TextStyle(fontFamily:'Rubik',fontWeight: FontWeight.w500,color: Colors.white, fontSize: 16)),
      ),
    );
  }

  Widget _buildSaveButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFd3d3d3),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        onPressed: () {},
        child: Text('حفظ التغييرات', style: TextStyle(fontFamily:'Rubik',fontWeight: FontWeight.w500,color: Colors.black, fontSize: 16)),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: ''),
      ],
    );
  }
}
