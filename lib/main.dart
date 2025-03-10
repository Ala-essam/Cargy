// main.dart
import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'LandingPage.dart'; // Import the LandingPage from landingPage.dart

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WelcomePage(), // Set WelcomePage as the home
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Simulate a loading delay and navigate to the landing page
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                const LoginPage()), // Until we done everything else dont uncomment
        //MaterialPageRoute(builder: (context) => const LandingPage()), // delete when done
      );
    });

    return Scaffold(
      backgroundColor: const Color(0xFFDAD1D2), // Set background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Logo (replace 'assets/logo.png' with your logo path)
            Image.asset(
              'assets/logo.png', // Path to your logo image
              width: 150, // Adjust the width as needed
              height: 150, // Adjust the height as needed
            ),
            const SizedBox(height: 20), // Add spacing

            // "Welcome to" text
            const Text(
              'Welcome to',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10), // Add spacing

            // "cargy!" text
            const Text(
              'cargy!',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Color(0xFFBD112C), // Red color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
