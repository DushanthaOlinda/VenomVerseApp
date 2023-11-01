import 'package:flutter/material.dart';

import 'addquiz_page.dart';

class viewAllQuizesPage extends StatefulWidget {
  const viewAllQuizesPage({super.key});

  @override
  State<viewAllQuizesPage> createState() => _viewAllQuizesPageState();
}

class _viewAllQuizesPageState extends State<viewAllQuizesPage> {
  // Sample quiz titles (replace with your data)
  final List<String> quizTitles = [
    "Quiz 1: Venomous or non venomous?",
    "Quiz 2: Identifying snakes with pictures",
    "Quiz 3: Instructions",
    "Quiz 4: Medical treatments",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quizzes"),
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: quizTitles.length,
            itemBuilder: (context, index) {
              final quizTitle = quizTitles[index];
              return QuizBox(title: quizTitle);
            },
          ),
          Positioned(
            bottom: 16, // Adjust this value to position the button as needed
            right: 16, // Adjust this value to position the button as needed
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const addNewQuizPage()),
                );

              },
              backgroundColor: Colors.green, // Change the button color as needed
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}

class QuizBox extends StatelessWidget {
  final String title;

  const QuizBox({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      margin: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          // Handle quiz item click here
          // You can navigate to the quiz details or perform any other action
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
