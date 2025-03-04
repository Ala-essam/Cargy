import 'package:flutter/material.dart';
import 'landingpage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controllers for text fields
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Correct credentials (for demonstration purposes)
  final String _correctEmail = 'aly';
  final String _correctPassword = '123';

  // Error message state
  String _errorMessage = '';

  // Handle login button press
  void _login() {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email == _correctEmail && password == _correctPassword) {
      // Navigate to the next page (e.g., LandingPage)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LandingPage()),
      );
    } else {
      // Show error message
      setState(() {
        _errorMessage = 'Invalid email or password. Please try again.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Login',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Email Field
            const Text(
              'Email',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Enter your email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Password Field
            const Text(
              'Password',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _passwordController,
              obscureText: true, // Hide password
              decoration: InputDecoration(
                hintText: 'Enter your password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Error Message
            if (_errorMessage.isNotEmpty)
              Text(
                _errorMessage,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.red,
                ),
              ),

            // Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFBD112C), // Red color
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Forgot Password Link
            Center(
              child: TextButton(
                onPressed: () {
                  // Handle forgot password action
                },
                child: const Text(
                  'Forgot password?',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFFBD112C), // Red color
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}