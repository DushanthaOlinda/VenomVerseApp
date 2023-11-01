import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart' show ImagePicker, ImageSource;
import 'package:video_player/video_player.dart';

class RequestedProfile extends StatefulWidget {
  const RequestedProfile({super.key});

  @override
  State<RequestedProfile> createState() => _RequestedProfileState();
}

class _RequestedProfileState extends State<RequestedProfile> {
  late VideoPlayerController _videoPlayerController;
  // late File _video;
  File? _video;


  final picker = ImagePicker();

  _pickVideo() async {
    final pickedVideo = await picker.pickVideo(source: ImageSource.gallery);
    if (pickedVideo != null) {
      _video = File(pickedVideo.path);
      _videoPlayerController = VideoPlayerController.file(_video!)

        ..initialize().then((_) {
          setState(() {});
          _videoPlayerController.play();
        });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Picker:'),
      ),
      body: Column(
        children: [
          if(_video!=null)
            _videoPlayerController.value.isInitialized ? AspectRatio(
              aspectRatio: _videoPlayerController.value.aspectRatio,
              child: VideoPlayer(_videoPlayerController),
            ):Container()
          else
            const Text('Click on pick video to select a video'),
          ElevatedButton(
            onPressed: () {
              _pickVideo();
            },
            child: const Text('Pick video from gallery'),
          )
        ],
      ),



    );
  }
}
