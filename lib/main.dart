import 'package:cafe/screens/SignInScreen/SignInScreen.dart';
import 'package:cafe/screens/SignupScreen/SignupScreen.dart';
import 'package:cafe/screens/cafe_request/cafe_request.dart';
import 'package:cafe/screens/list_of_cafe/list_of_cafe.dart';
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
      home: SplashScreen(),
    );
  }
}
