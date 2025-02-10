import 'package:cafe/screens/cafe_manger/EditProfileScreen/EditProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ChangePasswordDialog extends StatefulWidget {
  const ChangePasswordDialog({super.key});

  @override
  _ChangePasswordDialogState createState() => _ChangePasswordDialogState();
}

class _ChangePasswordDialogState extends State<ChangePasswordDialog> {
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Color(0xFFe1e1e1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(

              children: [
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
                Spacer(),
                Text(
                  "تغيير كلمة المرور",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Spacer(),

              ],
            ),
            SizedBox(height: 12),
            Text(
              " كلمة المرورالجديدة",
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Rubik',
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 5),
            _buildPasswordField(
                "", _passwordController, _isPasswordVisible,
                () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible;
              });
            }),
            SizedBox(height: 12),
            Text(
              " تأكيد كلمة المرور",
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Rubik',
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 5),
            _buildPasswordField("", _confirmPasswordController,
                _isConfirmPasswordVisible, () {
              setState(() {
                _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
              });
            }),
            SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff0a2332),
                padding: EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () {Get.back();},
              child: Center(
                child: Text(
                  "حفظ التغييرات",
                  style: TextStyle(fontSize: 16,       fontFamily: 'Rubik',color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordField(String label, TextEditingController controller,
      bool isVisible, VoidCallback toggleVisibility) {
    return Container(decoration: BoxDecoration(color: Colors.white),
      child: TextField(
        controller: controller,
        obscureText: !isVisible,

        decoration: InputDecoration(
          labelText: label,

          suffixIcon: IconButton(
            icon: Icon(isVisible ? Icons.visibility : Icons.visibility),
            onPressed: toggleVisibility,
          ),
        ),
      ),
    );
  }
}
