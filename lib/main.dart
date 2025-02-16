import 'package:cafe/screens/CafeRegister/cafe_register.dart';
import 'package:cafe/screens/cafe_manger/CreateEventScreen/CreateEventScreen.dart';
import 'package:cafe/screens/cafe_manger/Edit%20Reward%20Screen/Edit%20Reward%20Screen.dart';
import 'package:cafe/screens/cafe_manger/EventManagmentScreen/EventManagementScreen.dart';
import 'package:cafe/screens/cafe_manger/ProfileScreen/ProfileScreen.dart';
import 'package:cafe/screens/cafe_manger/WorkSpaceManagmentScreen/WorkSpaceManagmentScreen.dart';
import 'package:cafe/screens/cafe_manger/cafe_manger_layout/cafe_manger_layout.dart';
import 'package:cafe/screens/user/BookingConfirmationScreen/BookingConfirmationScreen.dart';
import 'package:cafe/screens/user/BookingDetailsScreen/BookingDetailsScreen.dart';
import 'package:cafe/screens/user/EditUserProfileScreen/EditUserProfileScreen.dart';
import 'package:cafe/screens/user/HomeScreen/HomeScreen.dart';
import 'package:cafe/screens/user/MyBookingsScreen/MyBookingsScreen.dart';
import 'package:cafe/screens/user/MyTicketsScreen/MyTicketsScreen.dart';
import 'package:cafe/screens/user/NotificationsScreen/NotificationsScreen.dart';
import 'package:cafe/screens/user/PaymentScreen/PaymentScreen.dart';
import 'package:cafe/screens/user/ReviewScreen/ReviewScreen.dart';
import 'package:cafe/screens/user/RewardsScreen/RewardsScreen.dart';
import 'package:cafe/screens/user/TicketCancellationScreen/TicketCancellationScreen.dart';
import 'package:cafe/screens/user/UpcomingEventsScreen/UpcomingEventsScreen.dart';
import 'package:cafe/screens/user/UserProfileScreen/UserProfileScreen.dart';
import 'package:cafe/screens/user/WalletScreen/WalletPaymentScreen.dart';
import 'package:cafe/screens/user/WalletScreen/WalletScreen.dart';
import 'package:cafe/screens/user/WorkspacesScreen/WorkspacesScreen.dart';
import 'package:cafe/screens/user/postScreen/postScreen.dart';
import 'package:cafe/screens/user/user_layout/user_layout.dart';
import 'package:cafe/screens/user/workSpace/workSpace.dart';
import 'package:cafe/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Jisur',
      debugShowCheckedModeBanner: false,
      locale: Locale('ar', 'EG'),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: UserLayout(),
    );
  }
}
