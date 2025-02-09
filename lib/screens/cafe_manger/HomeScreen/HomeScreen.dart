import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Icon(Icons.notifications, color: Colors.black),
          centerTitle: true,
          title: Image.asset(
            'assets/image/logo.png', // Replace with actual logo path
            height: 40,
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Column(
              children: [
                // Background Image with Overlay
                Stack(
                  children: [
                    Image.asset(
                      'assets/image/logo.png', // Replace with actual image
                      width: double.infinity,
                      height: 180,
                      fit: BoxFit.cover,
                    ),
                    Positioned.fill(
                      child: Container(
                        color: Colors.black.withOpacity(0.3),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 16),

                // Search Bar & Filters
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      // Search Field
                      TextField(
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          hintText: 'ابحث عن فعالية',
                          hintStyle: TextStyle(fontFamily: 'Tajawal'),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: Icon(Icons.search, color: Colors.black),
                        ),
                      ),

                      SizedBox(height: 10),

                      // Filters
                      Row(
                        children: [
                          Expanded(
                            child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              value: 'كل الأماكن',
                              items: ['كل الأماكن', 'الرياض', 'جدة', 'المدينة المنورة']
                                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                                  .toList(),
                              onChanged: (value) {},
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: DropdownButtonFormField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              value: 'جميع اللغات',
                              items: ['جميع اللغات', 'العربية', 'الإنجليزية']
                                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                                  .toList(),
                              onChanged: (value) {},
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10),

                // Location Permission Toggle
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'السماح بالوصول لموقعك',
                        style: TextStyle(fontSize: 16, fontFamily: 'Tajawal'),
                      ),
                      Switch(
                        value: true,
                        onChanged: (bool value) {},
                        activeColor: Colors.black,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10),

                // Nearby Events
                SectionHeader(title: 'الفعاليات القريبة'),
                EventCard(
                  title: 'الأبل في أدب الصحراء',
                  description: 'محاور الجلسة: الأدب والبيئة، المعركة عند العربي...',
                  imageUrl: 'assets/image/img.jpg',
                ),

                SizedBox(height: 10),

                // Upcoming Events Carousel
                SectionHeader(title: 'الفعاليات القادمة', showMore: true),
                EventCarousel(),

                SizedBox(height: 10),

                // Workspaces Carousel
                SectionHeader(title: 'مساحات العمل'),
                WorkspaceCarousel(),

                SizedBox(height: 20),
              ],
            ),
          );
        },
      ),

    );
  }
}

// Section Header Widget
class SectionHeader extends StatelessWidget {
  final String title;
  final bool showMore;

  SectionHeader({required this.title, this.showMore = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (showMore)
            Text(
              'اعرض الكل',
              style: TextStyle(fontSize: 14, fontFamily: 'Tajawal', color: Colors.blue),
            ),
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Tajawal'),
          ),
        ],
      ),
    );
  }
}

// Event Card Widget
class EventCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  EventCard({required this.title, required this.description, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.amber[50],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'Tajawal'),
          ),
          SizedBox(height: 5),
          Text(
            description,
            style: TextStyle(fontSize: 14, fontFamily: 'Tajawal'),
          ),
          SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(imageUrl, height: 100, width: double.infinity, fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}

// Event Carousel Widget
class EventCarousel extends StatelessWidget {
  const EventCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          EventCard(title: 'مناقشة كتاب عبق الحرف', description: '', imageUrl: 'assets/image/img.jpg'),
          EventCard(title: 'ورشة الخط العربي', description: '', imageUrl: 'assets/image/img.jpg'),
        ],
      ),
    );
  }
}

// Workspace Carousel Widget
class WorkspaceCarousel extends StatelessWidget {
  const WorkspaceCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          EventCard(title: 'أفينجارديا', description: '', imageUrl: 'assets/image/img.jpg'),
          EventCard(title: 'مكان للإبداع', description: '', imageUrl: 'assets/image/img.jpg'),
        ],
      ),
    );
  }
}
