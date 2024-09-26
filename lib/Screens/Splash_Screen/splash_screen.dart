import 'package:flutter/material.dart';
import 'package:gemesh/Screens/Auth_Screens/auth_screen.dart';
import 'package:gemesh/Screens/OnBoard_Screens/onboard_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();

    _opacity = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    _checkOnboardingStatus(); // Check onboarding status after splash screen
  }

  Future<void> _checkOnboardingStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? hasSeenOnboarding = prefs.getBool('hasSeenOnboarding');

    Timer(const Duration(seconds: 3), () {
      if (hasSeenOnboarding == true) {
        // If the user has seen onboarding, go to the Login Screen
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const AuthScreen()),
        );
      } else {
        // If the user hasn't seen onboarding, go to the Onboarding Screen
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const OnboardingScreen()),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, // Replace with your app color
      body: FadeTransition(
        opacity: _opacity,
        child: const Center(
          child: Text(
            'Gemesh',
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
