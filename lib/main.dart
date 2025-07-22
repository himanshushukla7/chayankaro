import 'package:flutter/material.dart';
import 'SplashScreen.dart';
import 'OnboardingScreen.dart';
import 'LoginScreen.dart';
import 'OtpVerificationScreen.dart';
import 'home_screen.dart'; // 👈 Don't forget to import this!

void main() {
  runApp(ChayanKaroApp());
}

class ChayanKaroApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChayanKaro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'SFPro', // Ensure SF Pro fonts are configured in pubspec.yaml
        primaryColor: Color(0xFFFF6F00),
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/onboarding': (context) => OnboardingScreen(),
        '/login': (context) => LoginScreen(),
        '/otp': (context) => OtpVerificationScreen(),
        '/home': (context) => HomeScreen(), // 👈 Add this route
      },
    );
  }
}
