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
                buildArticleCard(
                  context,
                  "Having a Companion Could Help Rattlesnakes Stay Calm",
                  "When rattlesnakes are in the presence of a companion, they’re more resilient to stress, according",
                  'assets/images/snake image.jpg',
                  const Article1(article: null),
                ),
                buildArticleCard(
                  context,
                  "Diverse Serpents of Sri Lanka: An Overview of Snake Specie",
                  "Delve into the rich snake fauna of Sri Lanka, exploring its unique biodiversity, habitats, and conservation efforts, showcasing the island's crucial role in snake research and preservation.",
                  'assets/images/snake2.jpg',
                  const Article2(),
                ),
                buildArticleCard(
                  context,
                  "Venomous Wonders: A Closer Look at Sri Lanka's Poisonous Snakes",
                  "Uncover the deadly beauty of Sri Lanka's venomous snakes, examining their venom composition, potential medical applications, and the importance of snakebite management in the region.",
                  'assets/images/snake3.JPG',
                  const Article3(),
                ),
                buildArticleCard(
                  context,
                  "Cultural Significance of Snakes in Sri Lanka: Myths and Realities",
                  "Investigate the cultural beliefs, superstitions, and folkloric stories surrounding snakes in Sri Lanka, shedding light on the intricate relationship between humans and these reptiles.",
                  'assets/images/snake4.jpg',
                  const Article4(),
                ),
                buildArticleCard(
                  context,
                  "Snakes as Ecosystem Engineers: Role of Sri Lanka's Snakes in Pest Contro",
                  "Explore how snakes contribute to the delicate balance of Sri Lanka's ecosystems by preying on pests, potentially reducing the need for harmful chemical interventions in agriculture.",
                  'assets/images/snake5.jpg',
                  const Article5(),
                ),
                buildArticleCard(
                  context,
                  "Conservation Challenges for Sri Lanka's Endemic Snake Species",
                  "Examine the threats faced by Sri Lanka's unique snake species due to habitat loss, climate change, and human activities, while discussing strategies to protect and conserve these remarkable creatures.",
                  'assets/images/snake6.jpg',
                  const Article6(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildArticleCard(
      BuildContext context, String title, String description, String imagePath, Widget articlePage) {
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
                    maxLines: 2, // Display title in two lines
                    overflow: TextOverflow.ellipsis, // Truncate text if it exceeds two lines
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                    maxLines: 2, // Display description in two lines
                    overflow: TextOverflow.ellipsis, // Truncate text if it exceeds two lines
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
