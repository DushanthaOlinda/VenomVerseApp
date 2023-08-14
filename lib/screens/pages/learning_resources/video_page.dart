import 'package:VenomVerse/screens/pages/learning_resources/video_list/video_1.dart';
import 'package:VenomVerse/screens/pages/learning_resources/video_list/video_2.dart';
import 'package:VenomVerse/screens/pages/learning_resources/video_list/video_3.dart';
import 'package:VenomVerse/screens/pages/learning_resources/video_list/video_4.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class VideosPage extends StatefulWidget {
  const VideosPage({super.key});

  @override
  State<VideosPage> createState() => _VideosPageState();
}

class _VideosPageState extends State<VideosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Videos"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SafeArea(
            child: Column(
              children: [
                buildArticleCard(
                  context,
                  "Steps to be taken in case of snake bite",
                  "Steps to be taken in case of snake bite - Snakes Guardian",
                  'https://youtu.be/fzGzUC2OgTM',
                   const Video1(videoUrl: 'https://youtu.be/Up60JaEfBJY'),
                ),

                buildArticleCard(
                  context,
                  "The giant Russell's Viper fell into the cultivation well",
                  "The giant Russell's Viper fell into the cultivation well - Snakes Guardian",
                  'https://youtu.be/8ORY6wyISZc',
                  const Video1(videoUrl: 'https://youtu.be/8ORY6wyISZc'),
                ),
                buildArticleCard(
                  context,
                  "Steps to be taken in case of snake bite",
                  "Steps to be taken in case of snake bite - Snakes Guardian",
                  'https://youtu.be/fzGzUC2OgTM',
                  const Video2(videoUrl:'https://youtu.be/fzGzUC2OgTM'),
                ),
                buildArticleCard(
                  context,
                  "The degree of hunger",
                  "The degree of hunger - Snakes Guardian",
                  'https://youtu.be/BmQehXrXsrs',
                  const Video3(videoUrl:'https://youtu.be/BmQehXrXsrs'),
                ),
                buildArticleCard(
                  context,
                  "Stylish mischievous cobra",
                  "Stylish mischievous cobra - Snakes Guardian",
                  'https://youtu.be/b0UNkWYTGgw',
                  const Video4(videoUrl: 'https://youtu.be/b0UNkWYTGgw'),
                ),

                // Repeat for other articles...
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildArticleCard(
  BuildContext context,
  String title,
  String description,
  String videoUrl,
  Widget videoPage,
) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => videoPage),
      );
    },
    child: Card(
      elevation: 3.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          YoutubePlayer(
            controller: YoutubePlayerController(
              initialVideoId: YoutubePlayer.convertUrlToId(videoUrl)!,
              flags: const YoutubePlayerFlags(
                autoPlay: false,
                mute: false,
              ),
            ),
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
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                const Text(
                  "Watch Video..",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
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