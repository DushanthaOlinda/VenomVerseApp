import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Video4 extends StatefulWidget {
  final String videoUrl;

  const Video4({Key? key, required this.videoUrl}) : super(key: key);


  @override
  State<Video4> createState() => _Video4State();
}

class _Video4State extends State<Video4> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl)!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stylish mischievous cobra"),
      ),
      body: Center(
        child: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.blueAccent,
          progressColors: const ProgressBarColors(
            playedColor: Colors.blueAccent,
            handleColor: Colors.blueAccent,
          ),
          onReady: () {
            // Perform any additional setup here
          },
        ),
      ),
    );
  }
}
