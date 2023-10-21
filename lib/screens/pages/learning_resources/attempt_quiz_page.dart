import 'package:flutter/material.dart';

class AttemptQuizPage extends StatefulWidget {

  AttemptQuizPage( {Key? key}) : super(key: key);

  @override
  State<AttemptQuizPage> createState() => _AttemptQuizPageState();
}

class _AttemptQuizPageState extends State<AttemptQuizPage> {
  List<bool> _selectedAnswers1 = List.filled(5, false);
  List<bool> _selectedAnswers2 = List.filled(4, false);
  List<bool> _selectedAnswers3 = List.filled(4, false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Attempt Quiz"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Topic - Revising what you know",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              buildQuizCard(
                "Select the highly venomous serpents from the below list.",
                ["Cobra", "Rat Snake", "Sri Lankan Krait", "Python", "Whip Snake"],
                _selectedAnswers1,
              ),
              buildQuizCard(
                "What are the things that you should not do when there is a serpent?",
                [
                  "Keep at least 10m distance from the serpent",
                  "Throw stones to the serpent",
                  "Try to catch the serpent",
                  "Throw kerosene oil to the serpent",
                ],
                _selectedAnswers2,
              ),
              buildQuizCard(
                "What should you do when it happens a snake bite?",
                [
                  "Call an ambulance",
                  "Transport the patient to the nearest hospital",
                  "Let the patient drink water",
                  "Tie around the bite area",
                ],
                _selectedAnswers3,
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle submit button press
                    // You can access the selected answers using the _selectedAnswers1, _selectedAnswers2, and _selectedAnswers3 lists
                    // Perform any necessary logic or calculations based on the selected answers
                  },
                  child: const Text("Submit"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildQuizCard(String question, List<String> options, List<bool> selectedAnswers) {
    return Card(
      elevation: 3.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Column(
              children: List.generate(
                options.length,
                (i) => Row(
                  children: [
                    Checkbox(
                      value: selectedAnswers[i],
                      onChanged: (value) {
                        setState(() {
                          selectedAnswers[i] = value!;
                        });
                      },
                    ),
                    Text(options[i]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


