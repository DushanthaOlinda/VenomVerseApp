import 'package:VenomVerse/screens/pages/learning_resources/Infor_list/inf1.dart';
import 'package:flutter/material.dart';


class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  final List<Map<String, dynamic>> inforPage = [
    {
      'title': "YourEnglishName1",
      'description': "The second edition of my Sinhala language book ‘Snake of Sri Lanka’  was launched in June 2023. This nearly 400-page edition is co-authored with devoted herpetologists",
      'imageUrl': 'assets/images/sp1.jpeg',
      'infoPage': const InforPage(),
    },
    {
      'title': "YourEnglishName1",
      'description': "The second edition of my Sinhala language book ‘Snake of Sri Lanka’  was launched in June 2023. This nearly 400-page edition is co-authored with devoted herpetologists",
      'imageUrl': 'assets/images/sp1.jpeg',
      'infoPage': const InforPage(),
    },
    {
      'title': "YourEnglishName1",
      'description': "The second edition of my Sinhala language book ‘Snake of Sri Lanka’  was launched in June 2023. This nearly 400-page edition is co-authored with devoted herpetologists",
      'imageUrl': 'assets/images/sp1.jpeg',
      'infoPage': const InforPage(),
    },
    {
      'title': "YourEnglishName1",
      'description': "The second edition of my Sinhala language book ‘Snake of Sri Lanka’  was launched in June 2023. This nearly 400-page edition is co-authored with devoted herpetologists",
      'imageUrl': 'assets/images/sp1.jpeg',
      'infoPage': const InforPage(),
    },
    {
      'title': "YourEnglishName1",
      'description': "The second edition of my Sinhala language book ‘Snake of Sri Lanka’  was launched in June 2023. This nearly 400-page edition is co-authored with devoted herpetologists",
      'imageUrl': 'assets/images/sp1.jpeg',
      'infoPage': const InforPage(),
    },
    {
      'title': "YourEnglishName1",
      'description': "The second edition of my Sinhala language book ‘Snake of Sri Lanka’  was launched in June 2023. This nearly 400-page edition is co-authored with devoted herpetologists",
      'imageUrl': 'assets/images/sp1.jpeg',
      'infoPage': const InforPage(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Serpents"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SafeArea(
            child: Column(
              children: [
                for (var infor in inforPage)
                  buildArticleCard(
                    context,
                    infor['title'],
                    infor['description'],
                    infor['imageUrl'],
                    infor['infoPage'],
                  ),
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
  String imageUrl,
  Widget infoPage,
) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => infoPage),
      );
    },
    child: Card(
      elevation: 3.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center( // Added Center widget here
            child: Image.asset(imageUrl),
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
                  "Read More..",
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
