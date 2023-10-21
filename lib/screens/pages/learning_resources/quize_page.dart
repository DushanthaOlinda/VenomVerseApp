import 'package:VenomVerse/screens/pages/learning_resources/attempt_quiz_page.dart';
import 'package:flutter/material.dart';

class QuizePage extends StatefulWidget {
  const QuizePage({required Key? key}) : super(key: key);

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
            crossAxisAlignment: CrossAxisAlignment.start, // Align the text to the left
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align the text vertically to the middle
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end, // Align the text to the right
                children: [
                  Text(
                    result,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
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

