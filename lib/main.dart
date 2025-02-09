
import 'package:cafe/screens/user/%20UploadPostScreen/UploadPostScreen.dart';
import 'package:cafe/screens/user/AdminDashboardScreen/AdminDashboardScreen.dart';
import 'package:cafe/screens/user/AttendanceListScreen/AttendanceListScreen.dart';
import 'package:cafe/screens/user/CreateWorkspaceScreen/CreateWorkspaceScreen.dart';
import 'package:cafe/screens/user/CustomerInfoScreen/CustomerInfoScreen.dart';
import 'package:cafe/screens/user/EditProfileScreen/EditProfileScreen.dart';
import 'package:cafe/screens/user/EditWorkspaceScreen/EditWorkspaceScreen.dart';
import 'package:cafe/screens/user/QRAttendanceScreen/QRAttendanceScreen.dart';
import 'package:cafe/screens/user/RewardsScreen/RewardsScreen.dart';
import 'package:cafe/screens/user/SendNotificationScreen/SendNotificationScreen.dart';

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
      home: EditProfileScreen(),
    );
  }
}
