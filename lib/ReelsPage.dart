import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ReelsPage extends StatefulWidget {
  const ReelsPage({super.key});

  @override
  State<ReelsPage> createState() => _ReelsPageState();
}

class _ReelsPageState extends State<ReelsPage> {
  // List of local video paths
  final List<String> _reels = [
    'assets/videos/ForBiggerJoyrides.mp4',
    'assets/videos/ForBiggerEscapes.mp4',
    'assets/videos/ForBiggerBlazes.mp4',
  ];

  // Video player controllers
  late List<VideoPlayerController> _controllers;
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    // Initialize video player controllers
    _controllers = _reels.map((path) {
      final controller = VideoPlayerController.asset(path)
        ..initialize().then((_) {
          setState(() {}); // Refresh the UI after initialization
          //controller.setLooping(true); // Loop the video
          //controller.play(); // Autoplay the video
        });
      return controller;
    }).toList();
  }

  @override
  void dispose() {
    // Dispose of all video controllers
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Reels',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: PageView.builder(
        scrollDirection: Axis.vertical, // Vertical scroll for reels
        itemCount: _reels.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                if (_controllers[index].value.isPlaying) {
                  _controllers[index].pause();
                } else {
                  _controllers[index].play();
                }
              });
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Video player
                _controllers[index].value.isInitialized
                    ? AspectRatio(
                        aspectRatio: _controllers[index].value.aspectRatio,
                        child: VideoPlayer(_controllers[index]),
                      )
                    : const Center(
                        child: CircularProgressIndicator(), // Loading indicator
                      ),
                // Play/pause icon
                if (!_controllers[index].value.isPlaying)
                  const Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 50,
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
