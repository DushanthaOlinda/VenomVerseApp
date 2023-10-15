import 'package:VenomVerse/models/user.dart';
import 'package:VenomVerse/screens/pages/learning_resources/attempt_quiz_page.dart';
import 'package:VenomVerse/screens/pages/learning_resources/review_page.dart';
import 'package:VenomVerse/services/quiz_api.dart';
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

  // var completedQuestions = QuizApi.getCompletedQuiz();
  // var pendingQuestions = QuizApi.getPendingQuiz();
  var allQuiz = QuizApi.getQuizList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0), // Add padding on top
        child: FutureBuilder<List>(
          future: allQuiz,
          builder: (context, snapshot) {
            return ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                return buildQuizCard(
                  context,
                  'Topic ${index + 1}',
                  snapshot.data?[index]['quizTopic'] ?? "Loading",
                  snapshot.data?[index]['quizTopicSinhala'] ?? "Loading",
                  snapshot.data?[index]['quizDetailId'] ?? "Loading",
                  // quizzes[index]['title'],
                  // quizzes[index]['score'],
                );
              },
            );
          }
        ),
      ),
    );
  }

  Widget buildQuizCard(BuildContext context, String topic, String title, String score, int quizDetailId ) {
    bool completed = score != 'Attempt the quiz';
    completed = false;
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
        onTap: () async {
          int uid = int.parse(await User.getUserName()?? "0");
          List quizData = await QuizApi.getQuizDetails(uid, quizDetailId);
          if (mounted) {
            if (quizData.length == 2) {
              // Navigate to the review page for this quiz
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReviewPage(quizDetailId,quizData)),
              );
            } else {
              // Navigate to the attempt quiz page for this quiz
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AttemptQuizPage(quizDetailId, quizData)),
              );
            }
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
                Text(
                  score,
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
