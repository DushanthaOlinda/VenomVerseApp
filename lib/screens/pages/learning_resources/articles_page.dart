import 'package:VenomVerse/screens/pages/learning_resources/articles_list/art_1.dart';
import 'package:VenomVerse/screens/pages/learning_resources/articles_list/art_2.dart';
import 'package:VenomVerse/screens/pages/learning_resources/articles_list/art_3.dart';
import 'package:VenomVerse/screens/pages/learning_resources/articles_list/art_4.dart';
import 'package:VenomVerse/screens/pages/learning_resources/articles_list/art_5.dart';
import 'package:VenomVerse/screens/pages/learning_resources/articles_list/art_6.dart';
import 'package:flutter/material.dart';

class ArticlesPage extends StatefulWidget {
  const ArticlesPage({Key? key}) : super(key: key);

  @override
  State<ArticlesPage> createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
  final List<Map<String, dynamic>> articles = [
    {
      'title': "Having a Companion Could Help Rattlesnakes Stay Calm",
      'description': "When rattlesnakes are in the presence of a companion, they’re more resilient to stress, according",
      'imagePath': 'assets/images/snake image.jpg',
      'articlePage': const Article1(article: null),
    },
    {
      'title': "Diverse Serpents of Sri Lanka: An Overview of Snake Specie",
      'description': "Delve into the rich snake fauna of Sri Lanka, exploring its unique biodiversity, habitats, and conservation efforts, showcasing the island's crucial role in snake research and preservation.",
      'imagePath': 'assets/images/snake2.jpg',
      'articlePage': const Article2(),
    },
    {
      'title': "Venomous Wonders: A Closer Look at Sri Lanka's Poisonous Snakes",
      'description': "Uncover the deadly beauty of Sri Lanka's venomous snakes, examining their venom composition, potential medical applications, and the importance of snakebite management in the region.",
      'imagePath': 'assets/images/snake3.JPG',
      'articlePage': const Article3(),
    },
    {
      'title': "Cultural Significance of Snakes in Sri Lanka: Myths and Realities",
      'description': "Investigate the cultural beliefs, superstitions, and folkloric stories surrounding snakes in Sri Lanka, shedding light on the intricate relationship between humans and these reptiles.",
      'imagePath': 'assets/images/snake4.jpg',
      'articlePage': const Article4(),
    },
    {
      'title': "Snakes as Ecosystem Engineers: Role of Sri Lanka's Snakes in Pest Contro",
      'description': "Explore how snakes contribute to the delicate balance of Sri Lanka's ecosystems by preying on pests, potentially reducing the need for harmful chemical interventions in agriculture.",
      'imagePath': 'assets/images/snake5.jpg',
      'articlePage': const Article5(),
    },
    {
      'title': "Conservation Challenges for Sri Lanka's Endemic Snake Species",
      'description': "Examine the threats faced by Sri Lanka's unique snake species due to habitat loss, climate change, and human activities, while discussing strategies to protect and conserve these remarkable creatures.",
      'imagePath': 'assets/images/snake6.jpg',
      'articlePage': const Article6(),
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Articles"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SafeArea(
            child: Column(
              children: [
                for (var article in articles)
                  buildArticleCard(
                    context,
                    article['title'],
                    article['description'],
                    article['imagePath'],
                    article['articlePage'],
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
    String imagePath,
    Widget articlePage,
  ) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => articlePage));
      },
      child: Card(
        elevation: 3.0,
        child: Row(
          children: [
            SizedBox(
              width: 120,
              height: 200,
              child: Image.asset(imagePath, fit: BoxFit.cover),
            ),
            const SizedBox(width: 10),
            Expanded(
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
                    "Read more...",
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
