import 'package:flutter/material.dart';

class ReelsPage extends StatelessWidget {
  const ReelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reels Page'),
      ),
      body: const Center(
        child: Text('This is the Reels Page'),
      ),
    );
  }
}