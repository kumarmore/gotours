import 'package:flutter/material.dart';
// import 'package:gotour/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'onboarding_screen.dart';
// import 'onboarding_screens.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }

  // Wait for 5 seconds, then decide where to go
  void _moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));

    // Check if user has seen onboarding
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool hasSeenOnboarding = prefs.getBool('seenOnboarding') ?? false;

    if (hasSeenOnboarding) {
      // If user has seen onboarding, go to Login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    } else {
      // If first time, go to Onboarding
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset('assets/images/plane_image.png', fit: BoxFit.cover),

          // Logo and text in the center
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Stack(
                      children: [
                        Image.asset(
                          'assets/logos/logo.png',
                          width: 300,
                          height: 150,
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 110, left: 50),
                          child: Text(
                            "Enjoy your travelling",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),

                      ],
                    ),
                  ],
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
