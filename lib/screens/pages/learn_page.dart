import 'dart:ffi';

import 'package:VenomVerse/screens/pages/learning_resources/extra_page.dart';
import 'package:VenomVerse/screens/pages/learning_resources/quize_page.dart';
import 'package:VenomVerse/screens/pages/learning_resources/resource_page.dart';
import 'package:VenomVerse/screens/pages/learning_resources/video_page.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'learning_resources/articles_page.dart';
import 'catcher/requestform_details.dart';
import 'catcher/requests_list.dart';
import 'catcher/result_popup.dart';

// class LearnPage extends StatefulWidget {
//   const LearnPage({Key? key}) : super(key: key);
//
//   @override
//   State<LearnPage> createState() => _LearnPageState();
// }
class LearnPage extends StatefulWidget {
  const LearnPage({Key? key}) : super(key: key);

  @override
  State<LearnPage> createState() => _LearnPageState();
}

class _LearnPageState extends State<LearnPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SafeArea(
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 25,
              crossAxisSpacing: 25,
              mainAxisExtent: 140,
              childAspectRatio: 1,
            ),
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EBooksPage()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(20.0), // Curve the corners
                    color: Colors.white, // Set the card color to white
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors
                              .green, // Set the icon background color to green
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Icon(
                            Icons.menu_book,
                            size: 40,
                            color: Colors.white, // Set the icon color to white
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Books",
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 18), // Set the text color to green
                      )
                    ],
                  ),
                ),
              ),

              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ArticlesPage()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Icon(
                            Icons.description_outlined,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Articles",
                        style: TextStyle(color: Colors.green, fontSize: 18),
                      )
                    ],
                  ),
                ),
              ),
              // Repeat the same modifications for the other InkWell widgets
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const VideosPage()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Icon(
                            Icons.video_collection,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Videos",
                        style: TextStyle(color: Colors.green, fontSize: 18),
                      )
                    ],
                  ),
                ),
              ),
              // Repeat the same modifications for the other InkWell widgets
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ResourcesPage()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Icon(
                            Icons.library_books,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Research Papers",
                        style: TextStyle(color: Colors.green, fontSize: 18),
                      )
                    ],
                  ),
                ),
              ),
              // Repeat the same modifications for the other InkWell widgets
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const QuizePage()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Icon(
                            Icons.description_outlined,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Quizzes",
                        style: TextStyle(color: Colors.green, fontSize: 18),
                      )
                    ],
                  ),
                ),
              ),
              // Repeat the same modifications for the other InkWell widgets
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const InfoPage()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Icon(
                            Icons.description_outlined,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Serpents",
                        style: TextStyle(color: Colors.green, fontSize: 18),
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

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red[50],
        body: Column(
          children: [
            Container(
              color: Colors.white,
              height: 450,
              width: 400,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CatcherRequest(key: UniqueKey())),

                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onAlertButtonsPressed(BuildContext context) {
    Alert(
      context: context,
      type: AlertType.info,
      title: "You are getting a call",
      desc: "The user is in need of your help. Please answer this call",
      buttons: [
        DialogButton(
          onPressed: () => Navigator.pop(context),
          color: const Color.fromRGBO(0, 179, 134, 1.0),
          child: const Text(
            "Accept",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontFamily: 'Poppins'),
          ),
        ),
        DialogButton(
          onPressed: () => Navigator.pop(context),
          gradient: const LinearGradient(colors: [
            Color.fromRGBO(255, 80, 80, 1.0),
            Color.fromRGBO(200, 60, 60, 1.0),
            Color.fromRGBO(153, 40, 40, 1.0),
          ], stops: [
            0.0,
            0.5,
            1.0,
          ]),
          child: const Text(
            "Reject",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontFamily: 'Poppins'),
          ),
        )
      ],
    ).show();
  }
}
