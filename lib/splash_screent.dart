import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Simulate a delay to show the splash screen for a few seconds
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity, // Expands the container to full width
        height: double.infinity, // Expands the container to full height
        color: Colors.white, // Background color behind the image
        child: Image.asset(
          'assets/splash_screen.png', // Path to your splash image
          fit: BoxFit.cover, // Ensures the image covers the entire screen
        ),
      ),
    );
  }
}
