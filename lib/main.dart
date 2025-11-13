import 'package:flutter/material.dart';
import 'splash_wrapper.dart'; // Import your splash screen logic
// import 'login_screen.dart'; // Will be created in the next step

void main() {
  // MANDATORY: Ensure Flutter is initialized before any Firebase calls
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatboards',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      // Define all routes for the app
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashWrapper(), // Starts the app on the splash screen
        // Placeholder for the next assignment step (Login Screen)
        '/login': (context) => const Center(
          child: Text(
            'Login Screen Placeholder - Ready for Step 2!',
            textDirection: TextDirection.ltr,
            style: TextStyle(color: Colors.black),
          ),
        ), 
        // ... more routes like '/home' will go here
      },
    );
  }
}