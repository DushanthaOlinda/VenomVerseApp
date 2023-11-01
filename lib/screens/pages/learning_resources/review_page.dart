import 'package:flutter/material.dart';

class ReviewPage extends StatelessWidget {
  final List<Map<String, dynamic>> quizData = [
    {
      'question': 'Select the highly venomous serpents from the below list.',
      'options': ['Cobra', 'Rat Snake', 'Sri Lankan Krait', 'Python', 'Whip Snake'],
      'correctAnswer': [true, false, true, false, false], // True for correct options
    },
    {
      'question': 'What are the things that you should not do when there is a serpent?',
      'options': [
        'Keep at least 10m distance from the serpent',
        'Throw stones to the serpent',
        'Try to catch the serpent',
        'Throw kerosene oil to the serpent',
      ],
      'correctAnswer': [false, true, true, true], // True for correct options
    },
    {
      'question': 'What should you do when it happens a snake bite?',
      'options': [
        'Call an ambulance',
        'Transport the patient to the nearest hospital',
        'Let the patient drink water',
        'Tie around the bite area',
      ],
      'correctAnswer': [true, true, false, true], // True for correct options
    },
  ];

  final List<List<bool>> selectedAnswers = [
    List<bool>.filled(5, false), // Initialize with an empty List<bool>
    List<bool>.filled(4, false), // Initialize with an empty List<bool>
    List<bool>.filled(4, false), // Initialize with an empty List<bool>
  ];

  int quizDetailId;

  Map quizDataa;

  ReviewPage(this.quizDetailId, this.quizDataa, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Review Quiz"),
      ),
      body: ListView.builder(
        itemCount: quizData.length,
        itemBuilder: (context, index) {
          final data = quizDataa;
          final quizid = quizDetailId;
          final question = quizData[index]['question'];
          final options = quizData[index]['options'];
          final selected = selectedAnswers[index];
          final correctAnswer = quizData[index]['correctAnswer'];

          return ReviewCard(
            question: question,
            options: options,
            selected: selected,
            correctAnswer: correctAnswer,
          );
        },
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  final String question;
  final List<String> options;
  final List<bool> selected;
  final List<bool> correctAnswer;

  const ReviewCard({
    Key? key,
    required this.question,
    required this.options,
    required this.selected,
    required this.correctAnswer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    Icon(
                      selected[i] == correctAnswer[i] ? Icons.check : Icons.close,
                      color: selected[i] == correctAnswer[i]
                          ? Colors.green
                          : Colors.red,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      options[i],
                      overflow: TextOverflow.ellipsis,
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
