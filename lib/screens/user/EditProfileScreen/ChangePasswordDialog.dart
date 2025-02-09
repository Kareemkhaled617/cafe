import 'package:flutter/material.dart';

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
      backgroundColor: Color(0xFF919190),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
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
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Spacer(),

              ],
            ),
            SizedBox(height: 12),
            _buildPasswordField(
                "كلمة المرور الجديدة", _passwordController, _isPasswordVisible,
                () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible;
              });
            }),
            SizedBox(height: 12),
            _buildPasswordField("تأكيد كلمة المرور", _confirmPasswordController,
                _isConfirmPasswordVisible, () {
              setState(() {
                _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
              });
            }),
            SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[800],
                padding: EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () {},
              child: Center(
                child: Text(
                  "حفظ التغييرات",
                  style: TextStyle(fontSize: 16, color: Colors.white),
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
    return TextField(
      controller: controller,
      obscureText: !isVisible,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        suffixIcon: IconButton(
          icon: Icon(isVisible ? Icons.visibility : Icons.visibility_off),
          onPressed: toggleVisibility,
        ),
      ),
    );
  }
}
