import 'package:VenomVerse/screens/pages/learning_resources/attempt_quiz_page.dart';
import 'package:VenomVerse/screens/pages/learning_resources/review_page.dart';
import 'package:VenomVerse/screens/pages/learning_resources/viewallquiz_page.dart';
import 'package:flutter/material.dart';

final List<Map<String, dynamic>> quizzes = [
  {
    'title': 'Basic Snake Classification',
    'score': '4/5',
  },
  {
    'title': 'Snake Anatomy',
    'score': '3/5',
  },
  {
    'title': 'Habitats and Habitual Snakes',
    'score': '2/5',
  },
  {
    'title': 'Snake Behavior',
    'score': 'Attempt the quiz',
  },
];

class QuizePage extends StatefulWidget {
  const QuizePage({Key? key}) : super(key: key);

  @override
  State<QuizePage> createState() => _QuizePageState();
}

class _QuizePageState extends State<QuizePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0), // Add padding on top
        child: ListView.builder(
          itemCount: quizzes.length,
          itemBuilder: (context, index) {
            return buildQuizCard(
              context,
              'Topic ${index + 1}',
              quizzes[index]['title'],
              quizzes[index]['score'],
            );
          },
        ),
      ),
    );
  }

  Widget buildQuizCard(BuildContext context, String topic, String title, String score) {
    bool completed = score != 'Attempt the quiz';
    Color textColor;

    if (completed) {
      List<String> scoreParts = score.split('/');
      int correctAnswers = int.tryParse(scoreParts[0]) ?? 0;
      int totalQuestions = int.tryParse(scoreParts[1]) ?? 1;

      if (correctAnswers >= totalQuestions * 0.8) {
        textColor = Colors.green;
      } else if (correctAnswers >= totalQuestions * 0.5) {
        textColor = Colors.orange;
      } else {
        textColor = Colors.red;
      }
    } else {
      textColor = Colors.grey;
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          if (completed) {
            // Navigate to the review page for this quiz
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ReviewPage()),
            );
          } else {
            // Navigate to the attempt quiz page for this quiz
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AttemptQuizPage()),
            );
          }
        },
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  topic,
                  style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  title,
                  style: const TextStyle(fontSize: 18.0),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    completed ? 'Completed: $score' : 'Attempt the quiz',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: textColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
