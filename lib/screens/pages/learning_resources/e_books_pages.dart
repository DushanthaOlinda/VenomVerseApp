import 'package:VenomVerse/screens/pages/learning_resources/e_books_list/bk_1.dart';
import 'package:VenomVerse/screens/pages/learning_resources/e_books_list/bk_2.dart';
import 'package:VenomVerse/screens/pages/learning_resources/e_books_list/bk_3.dart';
import 'package:VenomVerse/screens/pages/learning_resources/e_books_list/bk_4.dart';
import 'package:VenomVerse/screens/pages/learning_resources/e_books_list/bk_5.dart';
import 'package:VenomVerse/screens/pages/learning_resources/e_books_list/bk_6.dart';
import 'package:flutter/material.dart';

class EBooksPage extends StatefulWidget {
  const EBooksPage({Key? key}) : super(key: key);

  @override
  State<EBooksPage> createState() => _EBooksPageState();
}

class _EBooksPageState extends State<EBooksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("E-Books"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SafeArea(
            child: Column(
              children: [
                buildArticleCard(
                  context,
                  "SNAKES OF SRI LANKA",
                  "The second edition of my Sinhala language book ‘Snake of Sri Lanka’  was launched in June 2023. This nearly 400-page edition is co-authored with devoted herpetologists",
                  'assets/images/bk2.jpeg',
                  const EBook1(EBook1: null),
                ),
                buildArticleCard(
                  context,
                  "SNAKES OF SRI LANKA",
                  "The second edition of my Sinhala language book ‘Snake of Sri Lanka’  was launched in June 2023. This nearly 400-page edition is co-authored with devoted herpetologists",
                  'assets/images/bk2.jpeg',
                  const EBook2(),
                ),
                buildArticleCard(
                  context,
                  "SNAKES OF SRI LANKA",
                  "The second edition of my Sinhala language book ‘Snake of Sri Lanka’  was launched in June 2023. This nearly 400-page edition is co-authored with devoted herpetologists",
                  'assets/images/bk2.jpeg',
                  const EBook3(),
                ),
                buildArticleCard(
                  context,
                  "SNAKES OF SRI LANKA",
                  "The second edition of my Sinhala language book ‘Snake of Sri Lanka’  was launched in June 2023. This nearly 400-page edition is co-authored with devoted herpetologists",
                  'assets/images/bk2.jpeg',
                  const EBook4(),
                ),
                buildArticleCard(
                  context,
                  "SNAKES OF SRI LANKA",
                  "The second edition of my Sinhala language book ‘Snake of Sri Lanka’  was launched in June 2023. This nearly 400-page edition is co-authored with devoted herpetologists",
                  'assets/images/bk2.jpeg',
                  const EBook5(),
                ),
                buildArticleCard(
                  context,
                  "SNAKES OF SRI LANKA",
                  "The second edition of my Sinhala language book ‘Snake of Sri Lanka’  was launched in June 2023. This nearly 400-page edition is co-authored with devoted herpetologists",
                  'assets/images/bk2.jpeg',
                  const EBook6(),
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
            const SizedBox(width: 15),
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
                  const SizedBox(height: 8),
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
