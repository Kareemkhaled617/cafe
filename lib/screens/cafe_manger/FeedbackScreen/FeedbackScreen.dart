import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('آراء الحضور',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1a2833),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                icon: const Icon(LucideIcons.settings2,
                    color: Colors.white, size: 20),
                label: const Text('التقييم',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 18)),
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  _buildFeedbackCard('ليلى محمد', 'مناقشة كتاب عميق الحرف',
                      'تجربة رائعة كانت النقاشات ثرية وجذابة', 5),
                  _buildFeedbackCard('عبدالرحمن أحمد', 'مناقشة كتاب عميق الحرف',
                      'أمسية جميلة', 4),
                  _buildFeedbackCard('عائشة الحربي', 'مناقشة كتاب عميق الحرف',
                      'استمتعت جدًا والمكان منظم', 3),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeedbackCard(
      String name, String event, String comment, int rating) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name,
                style:
                    const TextStyle(fontWeight: FontWeight.w800, fontSize: 20)),
            const SizedBox(height: 4),
            Text(event,
                style: const TextStyle(color: Colors.grey, fontSize: 19)),
            const SizedBox(height: 8),
            Text('"$comment"',
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Colors.black)),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('5',style: TextStyle(fontSize: 20),),
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 22,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
