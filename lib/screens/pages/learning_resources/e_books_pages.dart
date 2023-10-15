import 'package:VenomVerse/screens/pages/learning_resources/e_books_list/bk_1.dart';
import 'package:VenomVerse/screens/pages/learning_resources/e_books_list/bk_2.dart';
import 'package:VenomVerse/screens/pages/learning_resources/e_books_list/bk_3.dart';
import 'package:VenomVerse/screens/pages/learning_resources/e_books_list/bk_4.dart';
import 'package:VenomVerse/screens/pages/learning_resources/e_books_list/bk_5.dart';
import 'package:VenomVerse/screens/pages/learning_resources/e_books_list/bk_6.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../services/learn_content_api.dart';

class EBooksPage extends StatefulWidget {
  const EBooksPage({Key? key}) : super(key: key);

  @override
  State<EBooksPage> createState() => _EBooksPageState();
}

class _EBooksPageState extends State<EBooksPage> {
  final _eBooks = LearnContentApi.getAllBooks();
final List<dynamic> ebooks = [
    {
      'title': "SNAKES OF SRI LANKA",
      'description': "The second edition of my Sinhala language book ‘Snake of Sri Lanka’  was launched in June 2023. This nearly 400-page edition is co-authored with devoted herpetologists",
      'imageUrl': 'assets/images/bk2.png',
      'ebookPage': const EBook1(),
    },
    {
      'title': "SNAKES OF SRI LANKA",
      'description': "The second edition of my Sinhala language book ‘Snake of Sri Lanka’  was launched in June 2023. This nearly 400-page edition is co-authored with devoted herpetologists",
      'imageUrl': 'assets/images/bk2.png',
      'ebookPage': const EBook2(),
    },
    {
      'title': "SNAKES OF SRI LANKA",
      'description': "The second edition of my Sinhala language book ‘Snake of Sri Lanka’  was launched in June 2023. This nearly 400-page edition is co-authored with devoted herpetologists",
      'imageUrl': 'assets/images/bk2.png',
      'ebookPage': const EBook3(),
    },
    {
      'title': "SNAKES OF SRI LANKA",
      'description': "The second edition of my Sinhala language book ‘Snake of Sri Lanka’  was launched in June 2023. This nearly 400-page edition is co-authored with devoted herpetologists",
      'imageUrl': 'assets/images/bk2.png',
      'ebookPage': const EBook4(),
    },
    {
      'title': "SNAKES OF SRI LANKA",
      'description': "The second edition of my Sinhala language book ‘Snake of Sri Lanka’  was launched in June 2023. This nearly 400-page edition is co-authored with devoted herpetologists",
      'imageUrl': 'assets/images/bk2.png',
      'ebookPage': const EBook5(),
    },
    {
      'title': "SNAKES OF SRI LANKA",
      'description': "The second edition of my Sinhala language book ‘Snake of Sri Lanka’  was launched in June 2023. This nearly 400-page edition is co-authored with devoted herpetologists",
      'imageUrl': 'assets/images/bk2.png',
      'ebookPage': const EBook6(),
    },
  ];


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: _eBooks,
      builder: (context, snapshot) {
        if (kDebugMode) {
          print(snapshot.data);
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text("Books"),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: SafeArea(
                child: Column(
                  children: [
                    for (var ebook in snapshot.data ?? ebooks)
                      buildArticleCard(
                        context,
                        ebook['communityBookId'].toString(),
                        ebook['description'],
                        // ebook['content'],
                        'assets/images/bk2.png',
                        const EBook1(),
                        // ebook['ebookPage'],
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }

  Widget buildArticleCard(
    BuildContext context,
    String title,
    String description,
    String imageUrl,
    Widget ebookPage,
  ) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ebookPage),
        );
      },
      child: Card(
        elevation: 3.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imageUrl),
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

