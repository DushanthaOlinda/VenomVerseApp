import 'package:flutter/material.dart';

import 'my_article_list/my_article_1.dart';

class MyArticlePage extends StatefulWidget {
  const MyArticlePage({Key? key}) : super(key: key);

  @override
  State<MyArticlePage> createState() => _MyArticlePageState();
}

class _MyArticlePageState extends State<MyArticlePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Approval Requests"),
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
                  const MyArticle1(article: null),
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