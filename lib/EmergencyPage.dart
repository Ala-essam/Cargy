import 'package:flutter/material.dart';

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency Page'),
      ),
      body: const Center(
        child: Text('This is the Emergency Page'),
      ),
    );
  }
}