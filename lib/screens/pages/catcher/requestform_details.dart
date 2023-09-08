import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class RequestForm extends StatefulWidget {
  const RequestForm({Key? key}) : super(key: key);

  @override
  State<RequestForm> createState() => _RequestFormState();
}

class _RequestFormState extends State<RequestForm> {
  VideoPlayerController? _controller;
  List<VideoPlayerController> _controllers = [];
  List<String> videos = [
    'assets/videos/video.mp4',
    'assets/videos/video1.mp4',
    'assets/videos/video2.mp4',
    // Add more video paths
  ];

  @override
  @override
  void initState() {
    super.initState();

    // Initialize each VideoPlayerController with a video
    _controllers = List.generate(videos.length, (index) {
      final controller = VideoPlayerController.asset(videos[index]);
      controller.initialize();
      return controller;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Request Details:'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile picture
              const SizedBox(height: 16),
              Center(
                // child: CircleAvatar(
                //   radius: 80,
                //   backgroundImage: AssetImage('assets/images/profile_picture.png'),
                // ),
                child: Image.asset(
                  'assets/images/profile_picture.png',
                  width: 160, // You can adjust this value to fit your needs
                  height: 160, // You can adjust this value to fit your needs
                ),
              ),
              const SizedBox(height: 16),

              // Text details
              textWidget('Name: Senuri Dilshara'),
              textWidget('Age: 38 Years'),
              textWidget('Details: [Add details here]'),
              textWidget('Qualifications: [Add qualifications here]'),

              // Video Player
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _controllers.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Toggle play/pause when the video player is tapped
                      setState(() {
                        if (_controllers[index].value.isPlaying) {
                          _controllers[index].pause();
                        } else {
                          _controllers[index].play();
                        }
                      });
                    },
                    child: Card(
                      child: AspectRatio(
                        aspectRatio: _controllers[index].value.aspectRatio,
                        child: VideoPlayer(_controllers[index]),
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 16),
              Center(
                child: _controllers.isNotEmpty && _controllers.first.value.isInitialized
                    ? AspectRatio(
                  aspectRatio: _controllers.first.value.aspectRatio,
                  child: VideoPlayer(_controllers.first),
                )
                    : const Text('Video is loading...'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  createButton('Approve', Colors.green, () {
                    // TODO: Implement approve logic
                  }),
                  createButton('Reject', Colors.red, () {
                    // TODO: Implement reject logic
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget textWidget(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        text,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }

  Widget createButton(String text, Color color, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30), // roundness of button
          ),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
          textStyle: const TextStyle(fontSize: 20), // font size of text
        ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    for (final controller in _controllers) {
      controller.dispose();
    }
  }
}
