import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/payment_method_screen.dart';
import 'screens/payment_screen.dart';
import 'screens/chat_screen.dart';
import 'screens/main_screen.dart';
import 'screens/sign_up_screen.dart';
import 'screens/discover_page.dart';
import 'screens/choice_date_screen.dart';
import 'screens/select_date_screen.dart';
import 'screens/upcoming_tour_screen.dart';
import 'screens/explore_page.dart';
import 'screens/map_page.dart';
import 'screens/explore_page_1.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gotour App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white54),
      ),
      home: const SplashScreen(),
    );
  }
}