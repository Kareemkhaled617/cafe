import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../user_layout/user_layout.dart';

class WalletPaymentScreen extends StatefulWidget {
  const WalletPaymentScreen({super.key});

  @override
  State<WalletPaymentScreen> createState() => _WalletPaymentScreenState();
}

class _WalletPaymentScreenState extends State<WalletPaymentScreen> {
  final TextEditingController cardNumberController = TextEditingController();

  final TextEditingController cardHolderController = TextEditingController();

  final TextEditingController expiryDateController = TextEditingController();

  final TextEditingController cvvController = TextEditingController();
  final TextEditingController total = TextEditingController();

  int ticketCount = 1;

  double ticketPrice = 100.0;
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Get.back(),
          ),
          centerTitle: true,
          title: Text(
            'عملية الدفع',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
              fontFamily: 'Tajawal',
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: total,
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    hintText: 'المبلغ',
                    hintStyle: TextStyle(
                        fontFamily: 'Tajawal', color: Colors.grey[500]),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                PaymentForm(),
              ],
            ),
          );
        },
      ),
    );
  }
}

// **Payment Form Widget**
class PaymentForm extends StatelessWidget {
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController cardHolderController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();

  PaymentForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'معلومات الدفع',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
              fontFamily: 'Tajawal',
              color: Colors.black,
            ),
            textAlign: TextAlign.right,
          ),
          SizedBox(height: 12),

          // Card Number Field
          PaymentTextField(
            controller: cardNumberController,
            hintText: 'رقم البطاقة',
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 8),

          // Card Holder Name Field
          PaymentTextField(
            controller: cardHolderController,
            hintText: 'اسم حامل البطاقة',
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: 8),

          // Expiry Date & CVV Row
          Row(
            children: [
              Expanded(
                child: PaymentTextField(
                  controller: expiryDateController,
                  hintText: 'تاريخ الانتهاء',
                  keyboardType: TextInputType.datetime,
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: PaymentTextField(
                  controller: cvvController,
                  hintText: 'CVV',
                  keyboardType: TextInputType.number,
                  obscureText: true,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),

          // Payment Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Get.snackbar(
                  "تم الدفع بنجاح",
                  "تمت معالجة عملية الدفع بنجاح!",
                  backgroundColor: Colors.green,
                  colorText: Colors.white,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF1a2833),
                padding: EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                'أتمم عملية الدفع',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Tajawal',
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// **Payment TextField Widget**
class PaymentTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;

  PaymentTextField({
    required this.controller,
    required this.hintText,
    required this.keyboardType,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textAlign: TextAlign.right,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(fontFamily: 'Tajawal', color: Colors.grey[500]),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class TicketQuantitySelector extends StatelessWidget {
  final int ticketCount;
  final double ticketPrice;
  final Function(int) onChanged;

  const TicketQuantitySelector({
    required this.ticketCount,
    required this.ticketPrice,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'حدد عدد التذاكر',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
          ),
          SizedBox(height: 8),

          // Ticket Quantity Stepper
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  if (ticketCount < 10) {
                    onChanged(ticketCount + 1);
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black),
                  ),
                  child: Icon(Icons.add, size: 18),
                ),
              ),
              SizedBox(width: 12),
              Text(
                ticketCount.toString(),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 12),
              GestureDetector(
                onTap: () {
                  if (ticketCount > 1) {
                    onChanged(ticketCount - 1);
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black),
                  ),
                  child: Icon(Icons.remove, size: 18),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),

          // Total Price
          Row(
            children: [
              Text(
                'سعر التذاكر',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '${ticketCount * ticketPrice} ريال',
                  style: TextStyle(fontSize: 16, fontFamily: 'Tajawal'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
