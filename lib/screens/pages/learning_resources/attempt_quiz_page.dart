import 'package:VenomVerse/services/quiz_api.dart';
import 'package:flutter/material.dart';

class AttemptQuizPage extends StatefulWidget {
  final int quizDetailId;

  final List quizData;

  const AttemptQuizPage(this.quizDetailId, this.quizData, {Key? key}) : super(key: key);

  @override
  State<AttemptQuizPage> createState() => _AttemptQuizPageState();
}

class _AttemptQuizPageState extends State<AttemptQuizPage> {
  final List<List<bool>> selectedAnswers = [
    List<bool>.filled(5, false),
    List<bool>.filled(4, false),
    List<bool>.filled(4, false),
  ];

  List<Map<String, dynamic>> quizData = [
    {
      'question': 'Select the highly venomous serpents from the below list.',
      'options': ['Cobra', 'Rat Snake', 'Sri Lankan Krait', 'Python', 'Whip Snake'],
    },
    {
      'question': 'What are the things that you should not do when there is a serpent?',
      'options': [
        'Keep at least 10m distance from the serpent',
        'Throw stones to the serpent',
        'Try to catch the serpent',
        'Throw kerosene oil to the serpent',
      ],
    },
    {
      'question': 'What should you do when it happens a snake bite?',
      'options': [
        'Call an ambulance',
        'Transport the patient to the nearest hospital',
        'Let the patient drink water',
        'Tie around the bite area',
      ],
    },
  ];

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
             const SizedBox(height: 16),
              for (var i = 0; i < quizData.length; i++)
                buildQuizCard(
                  quizData[i]['question'],
                  quizData[i]['options'],
                  selectedAnswers[i],
                  i,
                ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () {
                    var data = {
                      "quizUserAnswerId": 0,
                      "quizAttemptId": 0,
                      "questionId": 0,
                      "select01": true,
                      "correctness01": true,
                      "select02": true,
                      "correctness02": true,
                      "select03": true,
                      "correctness03": true,
                      "select04": true,
                      "correctness04": true,
                      "select05": true,
                      "correctness05": true
                    };
                    QuizApi.submit(data);
                    // Handle submit button press
                    // You can access the selected answers from the selectedAnswers list
                    for (var i = 0; i < quizData.length; i++) {
                      List<bool> currentAnswers = selectedAnswers[i];
                      // Perform any necessary logic or calculations based on the selected answers
                    }
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

  Widget buildQuizCard(String question, List<String> options, List<bool> selectedAnswers, int index) {
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
                    Expanded(
                      child: Text(
                        options[i],
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
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
