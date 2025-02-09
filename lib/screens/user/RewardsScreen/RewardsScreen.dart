import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RewardsScreen extends StatelessWidget {
  final List<Map<String, String>> rewards = [
    {'name': 'كوكيز', 'points': '70 نقطة', 'image': 'assets/image/logo.png'},
    {
      'name': 'قهوة اليوم',
      'points': '30 نقطة',
      'image': 'assets/image/logo.png'
    },
    {
      'name': 'فلات وايت',
      'points': '100 نقطة',
      'image': 'assets/image/logo.png'
    },
  ];

  RewardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('المكافآت',
            style: TextStyle(
                fontFamily: 'Tajawal',
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        leading: Image.asset(
          'assets/image/logo.png',
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF1a2833),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              child: Text('أضف مكافأة',
                  style: TextStyle(
                      fontSize: 16, fontFamily: 'Tajawal', color: Colors.white)),
            ),
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            _buildActionButtons(),
            SizedBox(height: 16),
            Expanded(child: _buildRewardsList()),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildActionButton(
            'مسح المكافآت', Icons.qr_code_scanner, Color(0xFF1a2833)),
      ],
    );
  }

  Widget _buildActionButton(String title, IconData icon, Color color) {
    return ElevatedButton.icon(
      onPressed: () {},
      label: Icon(
        icon,
        size: 18,
        color: Colors.white,
      ),
      icon: Text(title,
          style: TextStyle(
              fontSize: 16, fontFamily: 'Tajawal', color: Colors.white)),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Widget _buildRewardsList() {
    return ListView.builder(
      itemCount: rewards.length,
      itemBuilder: (context, index) {
        final reward = rewards[index];
        return _buildRewardCard(reward);
      },
    );
  }

  Widget _buildRewardCard(Map<String, String> reward) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: EdgeInsets.all(12),
        leading: Image.asset(
          reward['image']!,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
        title: Text(reward['name']!,
            style: TextStyle(
                fontSize: 18,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.bold)),
        subtitle: Text('النقاط المطلوبة: ${reward['points']}',
            style: TextStyle(
                fontSize: 14, fontFamily: 'Tajawal', color: Colors.orange)),
        trailing: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey.shade400,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: Text('تعديل',
              style: TextStyle(
                  fontSize: 16, color: Colors.black, fontFamily: 'Tajawal')),
        ),
      ),
    );
  }
}
