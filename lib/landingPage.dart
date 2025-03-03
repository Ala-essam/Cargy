import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDAD1D2),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
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
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Replaced Section
              Container(
                width: double.infinity, // Make the container take 100% width
                child: Image.asset(
                  'assets/Group 338.png', // Path to your logo image
                  fit: BoxFit.cover, // Ensure the image scales to fit the width
                ),
              ),
              const SizedBox(height: 20),
              // Experience Top Services Section
              Text(
                'Experience Top Services for Your Vehicle Today',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),

              // Posts Section
              const Text(
                'Posts',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              _buildPost(
                'Ahmed Amar and 12 other liked your post',
                'Can someone help me change my tire? I\'m in a Toyota Corolla 2019 near Abdoun Circle. I have a spare but no tools.',
                '13 Likes  4 Comments',
                'assets/profile1.png', // Add profile picture path
              ),
              const SizedBox(height: 16),
              _buildPost(
                'Nada Ahmad and 28 other liked your post',
                'Tesla Model3 2020 won\'t start, and I don\'t have cables. Anyone close by who can help me jumpstart?',
                '29 Likes  6 Comments',
                'assets/profile2.png', // Add profile picture path
              ),
              const SizedBox(height: 16),
              _buildPost(
                'Mahmoud Jad and 23 other liked your post',
                'Hyundai Tucson 2021 brakes are making a squealing sound. Could this be serious? Any recommendations for nearby shops?',
                '24 Likes  16 Comments',
                'assets/profile3.png', // Add profile picture path
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Emergency',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emergency),
            label: 'Workshops',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Reels',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: 'Reports',
          ),
        ],
      ),
    );
  }

  // Helper method to build posts with profile picture
  Widget _buildPost(String likedBy, String postText, String likesComments, String profilePic) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture
            CircleAvatar(
              radius: 25, // 50x50 size
              backgroundImage: AssetImage(profilePic), // Path to profile picture
            ),
            const SizedBox(width: 16), // Add spacing
            // Post Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    likedBy,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    postText,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    likesComments,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}