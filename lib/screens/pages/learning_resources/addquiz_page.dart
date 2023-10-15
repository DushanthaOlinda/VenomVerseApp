import 'package:flutter/material.dart';

import 'addQuestions_page.dart';

class addNewQuizPage extends StatefulWidget {
  const addNewQuizPage({super.key});

  @override
  State<addNewQuizPage> createState() => _addNewQuizPageState();
}

class _addNewQuizPageState extends State<addNewQuizPage> {
  TextEditingController sinhalaTitleController = TextEditingController();
  TextEditingController englishTitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Quiz"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: sinhalaTitleController,
              decoration: const InputDecoration(labelText: 'Quiz Title In Sinhala'),
            ),
            TextField(
              controller: englishTitleController,
              decoration: const InputDecoration(labelText: 'Quiz Title In English'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle adding the new quiz here
                final sinhalaTitle = sinhalaTitleController.text;
                final englishTitle = englishTitleController.text;

                // Validate that both titles are not empty before proceeding
                if (sinhalaTitle.isNotEmpty && englishTitle.isNotEmpty) {
                  // You can add the new quiz with titles here
                  // For example, you can save it to your backend
                  // or perform any other necessary action
                  // After adding the quiz, you can navigate back

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const addQuizQuestionsPage()),
                    );


                } else {
                  // Display an error message if titles are empty
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Please enter both Sinhala and English titles."),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Change the button color as needed
              ),
              child: const Text("OK"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    sinhalaTitleController.dispose();
    englishTitleController.dispose();
    super.dispose();
  }
}
