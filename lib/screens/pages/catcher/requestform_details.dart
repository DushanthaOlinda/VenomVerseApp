import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class RequestForm extends StatefulWidget {
  const RequestForm({Key? key}) : super(key: key);

  @override
  State<RequestForm> createState() => _RequestFormState();
}

class _RequestFormState extends State<RequestForm> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    // TODO: Replace the asset with your video file
    _controller = VideoPlayerController.asset('assets/videos/video.mp4')
      ..initialize().then((_) {
        setState(() {});
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
              textWidget('Name: John Doe'),
              textWidget('Age: 38 Years'),
              textWidget('Details: [Add details here]'),
              textWidget('Qualifications: [Add qualifications here]'),

              // Video Player
              const SizedBox(height: 16),
              Center(
                child: _controller!.value.isInitialized
                    ? AspectRatio(
                  aspectRatio: _controller!.value.aspectRatio,
                  child: VideoPlayer(_controller!),
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
    _controller?.dispose();
  }
}