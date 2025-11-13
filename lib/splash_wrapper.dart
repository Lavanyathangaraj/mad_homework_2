import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
// Note: We'll assume the next screen is named LoginScreen for now.

class SplashWrapper extends StatefulWidget {
  const SplashWrapper({super.key});

  @override
  State<SplashWrapper> createState() => _SplashWrapperState();
}

class _SplashWrapperState extends State<SplashWrapper> {
  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  // This method initializes Firebase and handles navigation
  void _initializeApp() async {
    try {
      // 1. Initialize Firebase (MANDATORY for Firebase API assignment)
      // This uses default settings defined during FlutterFire setup.
      await Firebase.initializeApp(); 
      
      // 2. Add a minimum delay for a pleasant user experience
      await Future.delayed(const Duration(seconds: 2));

      // 3. Navigate to the next screen (LoginScreen)
      if (mounted) {
        // Using pushReplacementNamed to prevent the user from navigating back to the splash screen
        Navigator.of(context).pushReplacementNamed('/login');
      }
    } catch (e) {
      // In a real app, you would show an error message. For now, we log it and proceed.
      print('Firebase initialization failed: $e'); 
      if (mounted) {
        // Still navigate away to avoid being stuck on the splash screen
        Navigator.of(context).pushReplacementNamed('/login');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF4A148C), 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // FIX: Replaced the incorrect text placeholder with a functional Image widget
            Image(
              image: AssetImage('assets/logo.png'), 
              height: 100, // Display your logo
            ),
            
            SizedBox(height: 16),
            Text(
              "Chatboards for the New Age",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(height: 30),
            CircularProgressIndicator(color: Colors.white),
          ],
        ),
      ),
    );
  }
}