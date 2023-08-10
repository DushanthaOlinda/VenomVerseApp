import 'package:VenomVerse/screens/pages/learning_resources/extra_page.dart';
import 'package:VenomVerse/screens/pages/learning_resources/quize_page.dart';
import 'package:VenomVerse/screens/pages/learning_resources/resource_page.dart';
import 'package:VenomVerse/screens/pages/learning_resources/video_page.dart';
import 'package:flutter/material.dart';
import 'package:VenomVerse/screens/pages/learning_resources/e_books_pages.dart';

import 'learning_resources/articles_page.dart';

class LearnPage extends StatefulWidget {
  const LearnPage({Key? key}) : super(key: key);

  @override
  State<LearnPage> createState() => _LearnPageState();
}

class _LearnPageState extends State<LearnPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
        //title: const Text("Learning Resources"),
      //),

      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SafeArea(
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20, // Set the spacing between the rows
                  crossAxisSpacing: 20, // Set the spacing between the columns
                  mainAxisExtent: 140,   // Set the height of each grid cell
                  childAspectRatio: 1,  // Maintain square cells (width:height ratio)
                ),
            children: [ 
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const EBooksPage()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1.0),
                    border: Border.all(color: Colors.orange), 
                    color: Colors.white,
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.menu_book,
                        size: 50,
                        color: Colors.orange,
                      ),
                      SizedBox(height: 8), // Add space between Icon and Text
                      Text(
                        "Books",
                        style: TextStyle(color: Colors.orange, fontSize: 18),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const ArticlesPage()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1.0),
                    border: Border.all(color: Colors.orange), 
                    color: Colors.white,
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.description_outlined,
                        size: 50,
                        color: Colors.orange,
                      ),
                      SizedBox(height: 8), // Add space between Icon and Text
                      Text(
                        "Articles",
                        style: TextStyle(color: Colors.orange, fontSize: 18),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const VideosPage()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1.0),
                    border: Border.all(color: Colors.orange), 
                    color: Colors.white,
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.video_collection,
                        size: 50,
                        color: Colors.orange,
                      ),
                      SizedBox(height: 8), // Add space between Icon and Text
                      Text(
                        "Video",
                        style: TextStyle(color: Colors.orange, fontSize: 18),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const ResourcesPage()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1.0),
                    border: Border.all(color: Colors.orange), 
                    color: Colors.white,
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.library_books,
                        size: 50,
                        color: Colors.orange,
                      ),
                      SizedBox(height: 8), // Add space between Icon and Text
                      Text(
                        "Research Papers",
                        style: TextStyle(color: Colors.orange, fontSize: 18),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const QuizePage()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1.0),
                    border: Border.all(color: Colors.orange), 
                    color: Colors.white,
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.list_alt,
                        size: 50,
                        color: Colors.orange,
                      ),
                      SizedBox(height: 8), // Add space between Icon and Text
                      Text(
                        "Quize",
                        style: TextStyle(color: Colors.orange, fontSize: 18),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const ExtraPage()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1.0),
                    border: Border.all(color: Colors.orange), 
                    color: Colors.white,
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.settings,
                        size: 50,
                        color: Colors.orange,
                      ),
                      SizedBox(height: 8), // Add space between Icon and Text
                      Text(
                        "Extra",
                        style: TextStyle(color: Colors.orange, fontSize: 18),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


