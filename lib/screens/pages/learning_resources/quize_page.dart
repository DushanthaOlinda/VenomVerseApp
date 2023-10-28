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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        _showConfirmationDialog(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      child: const Text("Attempt Quiz"),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Attempted Quizzes:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  buildQuizResultCard("01: Venomous or non venomous?", "4/5 marks"),
                  buildQuizResultCard("02: Identifying snakes with pictures", "3/5 marks"),
                  buildQuizResultCard("03: Instructions", "4/5 marks"),
                  buildQuizResultCard("04: Medical treatments", "5/5 marks"),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {

              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                // Change the button color as needed
              ),
              child: const Text("View All"),
            ),
          ),
        ],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //me set ekama one na
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 16.0),
                  //   child: ElevatedButton(
                  //     onPressed: () {
                  //       // _showConfirmationDialog(context);
                  //     },
                  //     style: ElevatedButton.styleFrom(
                  //       backgroundColor: Colors.green,
                  //     ),
                  //     child: const Text("Attempt Quiz"),
                  //   ),
                  // ),  // meka epa
                  // const SizedBox(height: 16), // meka epa
                  // const Text(
                  //   "Attempted Quizzes:",
                  //   style: TextStyle(
                  //     fontSize: 18,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ), // meka epa
                  // const SizedBox(height: 16), // meka epa

                  // methanin passe tika danna
                  FutureBuilder<List>(
                      future: allQuiz,
                      builder: (context, snapshot) {
                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: snapshot.data?.length ?? 0,
                          itemBuilder: (context, index) {
                            return buildQuizCard(
                              context,
                              'Topic ${index + 1}',
                              snapshot.data?[index]['quizTopic'] ?? "Loading",
                              snapshot.data?[index]['quizTopicSinhala'] ??
                                  "Loading",
                              snapshot.data?[index]['quizDetailId'] ??
                                  "Loading",
                              // quizzes[index]['title'],
                              // quizzes[index]['score'],
                            );
                          },
                        );
                      }),
                  // buildQuizResultCard(
                  //     "01: Venomous or non venomous?", "4/5 marks"),
                  // buildQuizResultCard(
                      // "02: Identifying snakes with pictures", "3/5 marks"),
                  // buildQuizResultCard("03: Instructions", "4/5 marks"),
                  // buildQuizResultCard("04: Medical treatments", "5/5 marks"),
                ],
              ),
            ),
          ),
          // me pahala padding eka oneth na
          // Padding(
          //   padding: const EdgeInsets.all(16.0),
          //   child: ElevatedButton(
          //     onPressed: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //             builder: (context) => const viewAllQuizesPage()),
          //       );
          //     },
          //     style: ElevatedButton.styleFrom(
          //       backgroundColor: Colors.green,
          //       // Change the button color as needed
          //     ),
          //     child: const Text("View All"),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget buildQuizResultCard(String title, String result) {
    return SizedBox(
      width: 500, // Set the desired width
      height: 100, // Set the desired height
      child: Card(
        elevation: 3.0,
        color: Colors.green[100], // Set the background color to light green
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align the text to the left
            mainAxisAlignment: MainAxisAlignment
                .spaceBetween, // Align the text vertically to the middle
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              Padding(
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
                            snapshot.data?[index]['quizTopicSinhala'] ??
                                "Loading",
                            snapshot.data?[index]['quizDetailId'] ?? "Loading",
                            // quizzes[index]['title'],
                            // quizzes[index]['score'],
                          );
                        },
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildQuizCard(BuildContext context, String topic, String title,
      String score, int quizDetailId) {
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
          int uid = int.parse(await User.getUserName() ?? "0");
          Map quizData = await QuizApi.getQuizDetails(uid, quizDetailId);
          if (mounted) {
            if (quizData.length == 2) {
              // Navigate to the review page for this quiz
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ReviewPage(quizDetailId, quizData)),
              );
            } else {
              _showConfirmationDialog(context, quizDetailId, quizData);
              // Navigate to the attempt quiz page for this quiz
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) =>
              //           AttemptQuizPage(quizDetailId, quizData)),
              // );
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
                  style: const TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.bold),
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
Future<void> _showConfirmationDialog(BuildContext context) async {
  return showDialog(
    context: context,
    barrierDismissible: false, // Disallow tapping outside the dialog to dismiss
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Confirm Attempt"),
        content: Text("Are you sure you want to attempt the quiz?"),
        actions: <Widget>[
          TextButton(
            child: Text("Cancel"),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
          TextButton(
            child: Text("Yes"),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
              // Navigate to the quiz page here

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  AttemptQuizPage()),
              );
            },
          ),
        ],
      );
    },
  );
}


Future<void> _showConfirmationDialog(BuildContext context, int quizDetailId,
    Map<dynamic, dynamic> quizData) async {
  return showDialog(
    context: context,
    barrierDismissible: false, // Disallow tapping outside the dialog to dismiss
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Confirm Attempt"),
        content: const Text("Are you sure you want to attempt the quiz?"),
        actions: <Widget>[
          TextButton(
            child: const Text("Cancel"),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
          TextButton(
            child: const Text("Yes"),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
              // Navigate to the quiz page here
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        AttemptQuizPage(quizDetailId, quizData)),
              );
            },
          ),
        ],
      );
    },
  );
}
