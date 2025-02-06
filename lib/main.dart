
import 'package:cafe/screens/CafeRegister/cafe_register.dart';
import 'package:cafe/screens/NotificationsScreen/NotificationsScreen.dart';
import 'package:cafe/screens/cafe_manger/BookingConfirmationScreen/BookingConfirmationScreen.dart';
import 'package:cafe/screens/cafe_manger/HomeScreen/HomeScreen.dart';
import 'package:cafe/screens/cafe_manger/MyBookingsScreen/MyBookingsScreen.dart';
import 'package:cafe/screens/cafe_manger/MyTicketsScreen/MyTicketsScreen.dart';
import 'package:cafe/screens/cafe_manger/ReviewScreen/ReviewScreen.dart';
import 'package:cafe/screens/cafe_manger/UpcomingEventsScreen/UpcomingEventsScreen.dart';
import 'package:cafe/screens/cafe_manger/WorkspacesScreen/WorkspacesScreen.dart';
import 'package:cafe/screens/cafe_manger/postScreen/postScreen.dart';
import 'package:cafe/screens/cafe_manger/workSpace/workSpace.dart';
import 'package:cafe/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Cafe',
      debugShowCheckedModeBanner: false,
      locale: Locale('ar','EG'),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: NotificationsScreen(),
    );
  }
}
