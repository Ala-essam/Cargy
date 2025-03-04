import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'; // For LatLng
import 'mapPage.dart';

class NearestWorkshopsPage extends StatelessWidget {
  NearestWorkshopsPage({super.key});

  // Hardcoded user location (Shafa Badran coordinates)
  final LatLng _userLocation = const LatLng(31.963158, 35.930359);

  // List of workshops with their coordinates and images
  final List<Map<String, dynamic>> _workshops = [
    {
      'name': 'The First Step Workshop',
      'location': 'Amman, Shafa Badran',
      'coordinates': const LatLng(31.963158, 35.930359),
      'image': 'assets/workshops/workshop1.png', // Add image path
    },
    {
      'name': 'Garanti for Hybrid Maintenance',
      'location': 'Amman, Shafa Badran',
      'coordinates': const LatLng(31.960000, 35.935000),
      'image': 'assets/workshops/workshop2.png', // Add image path
    },
    {
      'name': 'Yazan Auto Parts Store',
      'location': 'Amman, Shafa Badran',
      'coordinates': const LatLng(31.965000, 35.940000),
      'image': 'assets/workshops/workshop3.png', // Add image path
    },
    {
      'name': 'Hattan Auto Repair Shop',
      'location': 'Amman, Shafa Badran',
      'coordinates': const LatLng(31.970000, 35.945000),
      'image': 'assets/workshops/workshop4.png', // Add image path
    },
    {
      'name': 'Al Nasser Auto Parts Store',
      'location': 'Amman, Shafa Badran',
      'coordinates': const LatLng(31.975000, 35.950000),
      'image': 'assets/workshops/workshop5.png', // Add image path
    },
    {
      'name': 'Al-Aawi Steering Wheel Balance',
      'location': 'Amman, Shafa Badran',
      'coordinates': const LatLng(31.980000, 35.955000),
      'image': 'assets/workshops/workshop6.png', // Add image path
    },
  ];

  // Calculate distance between two coordinates
  double _calculateDistance(LatLng start, LatLng end) {
    return Geolocator.distanceBetween(
          start.latitude,
          start.longitude,
          end.latitude,
          end.longitude,
        ) /
        1000; // Convert meters to kilometers
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nearest Workshops'),
        backgroundColor: Colors.blue, // Custom app bar color
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: _workshops.map((workshop) {
          final LatLng workshopLocation = workshop['coordinates'];
          final double distance =
              _calculateDistance(_userLocation, workshopLocation);

          return GestureDetector(
            onTap: () {
              // Show distance in a dialog
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(workshop['name']),
                    content: Text(
                      'Distance: ${distance.toStringAsFixed(2)} km',
                      style: const TextStyle(fontSize: 18),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              );
            },
            child: _buildWorkshopCard(
              workshop['name'],
              workshop['location'],
              '${distance.toStringAsFixed(2)} km',
              workshop['image'], // Pass image path
            ),
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate back to the map
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MapPage()),
          );
        },
        child: const Icon(Icons.map),
        backgroundColor: Colors.blue, // Custom FAB color
      ),
    );
  }

  Widget _buildWorkshopCard(
      String name, String location, String distance, String imagePath) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 4, // Add shadow to the card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Rounded corners
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Workshop image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue, // Custom text color
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    location,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.red,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        distance,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.red,
                        ),
                      ),
                    ],
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
