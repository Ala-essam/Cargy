import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'NearestWorkshopsPage.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;
  LatLng? _currentLocation;
  bool _locationPermissionGranted = false;

  // Request location permission
  Future<void> _requestLocationPermission() async {
    final status = await Permission.location.request();
    if (status.isGranted) {
      setState(() {
        _locationPermissionGranted = true;
      });
      // Fetch the current location
      await _getCurrentLocation();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Location permission is required to view the map.')),
      );
    }
  }

  // Get the current location using Geolocator
  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        _currentLocation = LatLng(position.latitude, position.longitude);
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to fetch current location.')),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _requestLocationPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map View'),
      ),
      body: _locationPermissionGranted && _currentLocation != null
          ? GoogleMap(
              onMapCreated: (controller) {
                setState(() {
                  mapController = controller;
                });
              },
              initialCameraPosition: CameraPosition(
                target: _currentLocation!,
                zoom: 14,
              ),
              markers: {
                Marker(
                  markerId: const MarkerId('currentLocation'),
                  position: _currentLocation!,
                  infoWindow: const InfoWindow(title: 'Your Location'),
                ),
                // Add markers for workshops
                const Marker(
                  markerId: MarkerId('workshop1'),
                  position: LatLng(31.963158, 35.930359),
                  infoWindow: InfoWindow(title: 'The First Step Workshop'),
                ),
                const Marker(
                  markerId: MarkerId('workshop2'),
                  position: LatLng(31.960000, 35.935000),
                  infoWindow:
                      InfoWindow(title: 'Garanti for Hybrid Maintenance'),
                ),
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the nearest workshops list
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NearestWorkshopsPage()),
          );
        },
        child: const Icon(Icons.list),
      ),
    );
  }
}
