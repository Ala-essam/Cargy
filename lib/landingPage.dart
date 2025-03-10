import 'package:flutter/material.dart';

// Import other pages
import 'EmergencyPage.dart';
import 'MapPage.dart';
import 'ReelsPage.dart';
import 'ReportsPage.dart';
import 'ProfilePage.dart';
import 'CommunityPage.dart'; // Import the new Community Page

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _selectedIndex = 0; // Track the selected index for bottom navigation

  // List of pages to navigate to
  final List<Widget> _pages = [
    const HomeContent(), // Home Page (content of LandingPage)
    const EmergencyPage(),
    const MapPage(),
    const ReelsPage(),
    const ReportsPage(),
  ];

  // Handle bottom navigation item taps
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDAD1D2),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
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
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.person, color: Colors.black),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
              },
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex, // Highlight the selected item
        onTap: _onItemTapped, // Handle item taps
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emergency),
            label: 'Emergency',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Workshops',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: 'Reels',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Reports',
          ),
        ],
      ),
      floatingActionButton: _selectedIndex == 0 // Show only on Home Page
          ? FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CommunityPage()),
                );
              },
              child: const Icon(Icons.chat, color: Colors.white),
            )
          : null,
    );
  }
}

// Home Content
class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.asset(
                'assets/Group 338.png',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Experience Top Services for Your Vehicle Today',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
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
              'Ahmed Amar and 12 others liked your post',
              'Can someone help me change my tire? I\'m in a Toyota Corolla 2019 near Abdoun Circle. I have a spare but no tools.',
              '13 Likes  4 Comments',
              'assets/Ellipse1.png',
            ),
            const SizedBox(height: 16),
            _buildPost(
              'Nada Ahmad and 28 others liked your post',
              'Tesla Model3 2020 won\'t start, and I don\'t have cables. Anyone close by who can help me jumpstart?',
              '29 Likes  6 Comments',
              'assets/Ellipse2.png',
            ),
            const SizedBox(height: 16),
            _buildPost(
              'Mahmoud Jad and 23 others liked your post',
              'Hyundai Tucson 2021 brakes are making a squealing sound. Could this be serious? Any recommendations for nearby shops?',
              '24 Likes  16 Comments',
              'assets/Ellipse3.png',
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build posts with profile picture
  Widget _buildPost(String likedBy, String postText, String likesComments,
      String profilePic) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(profilePic),
            ),
            const SizedBox(width: 16),
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
                    style: const TextStyle(
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
