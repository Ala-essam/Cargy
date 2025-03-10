import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDAD1D2), // Set background color
      appBar: AppBar(
        backgroundColor: const Color(0xFFDAD1D2), // Set background color
        elevation: 0,
        title: Row(
          children: [
            // Logo beside the user's name
            Image.asset(
              'assets/logo.png', // Path to your logo image
              width: 40, // Adjust the width as needed
              height: 40, // Adjust the height as needed
            ),
            const SizedBox(width: 10), // Add spacing
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Hello Mohammad',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Shafa Badran, Amman',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Section
            const Text(
              'Profile',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            // Name
            _buildProfileItem('Name', 'Mohammad Suhail'),
            const SizedBox(height: 16),
            // Email
            _buildProfileItem('Email', 'Repair@for.you'),
            const SizedBox(height: 16),
            // Mobile
            _buildProfileItem('Mobile', '+9627777777777'),
            const SizedBox(height: 20),
            // Notifications
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Notifications',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Switch(
                  value: true, // Set the initial value of the switch
                  onChanged: (value) {
                    // Handle switch toggle
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Edit Profile Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle edit profile action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFBD112C), // Red color
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                ),
                child: const Text(
                  'Edit Profile',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build profile items
  Widget _buildProfileItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
