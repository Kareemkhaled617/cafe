import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Image.asset(
            'assets/image/logo.png', // Replace with actual logo image path
            height: 80,
            fit: BoxFit.cover,
          ),
          centerTitle: true,
          title: Text(
            'المنشورات',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
              fontFamily: 'Rubik',
            ),
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                PostItem(
                  title: 'رو كافيه',
                  time: 'منذ 3 ساعات',
                  tag: 'ROW',
                  description:
                      'سعدنا بمناقشة كتاب "عبق الحروف" الذي يفتح أمامنا آفاقا جديدة في عالم الأدب والفكر. تطرقنا خلال النقاش إلى جماليات اللغة وتأثيرها في التعبير عن المشاعر والأفكار. كان من الرائع تبادل الآراء حول كيفية استخدام الحرف لنقل التجارب الإنسانية.',
                  imageUrl: 'assets/image/userhome1.png',
                  constraints: constraints,
                ),
                PostItem(
                  title: 'مقهى فاصلة',
                  time: 'منذ 3 ساعات',
                  tag: 'ROW',
                  description:
                      'أمسية شعرية رائعة احتضنتها الأجواء الساحرة، حيث تجمع عشاق الكلمة والجمال في مكان واحد. تميزت الفعالية بحضور مجموعة من الشعراء المبدعين الذين ألقوا قصائدهم بإحساس عميق، مما أسهم في خلق تجربة فنية فريدة.',
                  imageUrl: 'assets/image/userhome1.png',
                  constraints: constraints,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Post Item Widget
class PostItem extends StatelessWidget {
  final String title;
  final String time;
  final String tag;
  final String description;
  final String imageUrl;
  final BoxConstraints constraints;

  const PostItem({
    required this.title,
    required this.time,
    required this.tag,
    required this.description,
    required this.imageUrl,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    double cardWidth = constraints.maxWidth > 500 ? 500 : constraints.maxWidth;

    return Container(
      width: cardWidth,
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Title & Tag
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (tag.isNotEmpty)
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/image/Image (5).png'),
                ),
              SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Rubik'),
                  ),
                  Text(
                    time,
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Rubik',
                        color: Colors.grey[600]),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: 10),

          // Description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              description,
              style: TextStyle(fontSize: 16, fontFamily: 'Rubik'),
              textAlign: TextAlign.right,
            ),
          ),

          SizedBox(height: 10),

          // Post Image
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                imageUrl,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
