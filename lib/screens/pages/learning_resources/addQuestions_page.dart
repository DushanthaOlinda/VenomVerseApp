import 'package:VenomVerse/screens/pages/learning_resources/viewallquiz_page.dart';
import 'package:flutter/material.dart';

class addQuizQuestionsPage extends StatefulWidget {
  const addQuizQuestionsPage({Key? key});

  @override
  State<addQuizQuestionsPage> createState() => _addQuizQuestionsPageState();
}

class _addQuizQuestionsPageState extends State<addQuizQuestionsPage> {
  PageController _pageController = PageController();
  int currentPage = 0;

  List<QuizQuestion> questions = List.generate(
    10,
        (index) => QuizQuestion(
      sinhalaQuestion: "",
      englishQuestion: "",
      sinhalaAnswerOne: "",
      englishAnswerOne: "",
      sinhalaAnswerTwo: "",
      englishAnswerTwo: "",
      sinhalaAnswerThree: "",
      englishAnswerThree: "",
      sinhalaAnswerFour: "",
      englishAnswerFour: "",
      sinhalaAnswerFive: "",
      englishAnswerFive: "",
      correctAnswer: -1, // Initialize with -1
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Quiz Questions"),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: questions.length,
        onPageChanged: (index) {
          setState(() {
            currentPage = index;
          });
        },
        itemBuilder: (context, index) {
          final question = questions[index];
          // Pass the question number to the QuestionForm
          return SingleChildScrollView(
            child: QuestionForm(
              questionNumber: index + 1, // Add 1 to make it 1-based index
              question: question,
              onNextPressed: () {
                if (currentPage < questions.length - 1) {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
              isLastPage: index == questions.length - 1,
              onDonePressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const viewAllQuizesPage(), // Replace with the actual widget for quizPage
                  ),
                );// Handle "Done" button click
              },
            ),
          );
        },
      ),
    );
  }
}

class QuizQuestion {
  String sinhalaQuestion;
  String englishQuestion;
  String sinhalaAnswerOne;
  String englishAnswerOne;
  String sinhalaAnswerTwo;
  String englishAnswerTwo;
  String sinhalaAnswerThree;
  String englishAnswerThree;
  String sinhalaAnswerFour;
  String englishAnswerFour;
  String sinhalaAnswerFive;
  String englishAnswerFive;
  int correctAnswer; // Store the correct answer as a number from 1 to 5

  QuizQuestion({
    required this.sinhalaQuestion,
    required this.englishQuestion,
    required this.sinhalaAnswerOne,
    required this.englishAnswerOne,
    required this.sinhalaAnswerTwo,
    required this.englishAnswerTwo,
    required this.sinhalaAnswerThree,
    required this.englishAnswerThree,
    required this.sinhalaAnswerFour,
    required this.englishAnswerFour,
    required this.sinhalaAnswerFive,
    required this.englishAnswerFive,
    required this.correctAnswer,
  });
}

class QuestionForm extends StatefulWidget {
  final int questionNumber; // Add question number property
  final QuizQuestion question;
  final VoidCallback onNextPressed;
  final bool isLastPage;
  final VoidCallback onDonePressed;

  QuestionForm({
    Key? key, // Add Key parameter
    required this.questionNumber,
    required this.question,
    required this.onNextPressed,
    required this.isLastPage,
    required this.onDonePressed,
  }) : super(key: key);

  @override
  _QuestionFormState createState() => _QuestionFormState();
}

class _QuestionFormState extends State<QuestionForm> {
  int? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Question ${widget.questionNumber}"), // Display question number
          TextField(
            decoration: const InputDecoration(labelText: 'Sinhala Question'),
            onChanged: (value) {
              widget.question.sinhalaQuestion = value;
            },
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'English Question'),
            onChanged: (value) {
              widget.question.englishQuestion = value;
            },
          ),
          _buildAnswerTextField(1, 'Sinhala Answer 1', 'English Answer 1', widget.question.sinhalaAnswerOne,
              widget.question.englishAnswerOne),
          _buildAnswerTextField(2, 'Sinhala Answer 2', 'English Answer 2', widget.question.sinhalaAnswerTwo,
              widget.question.englishAnswerTwo),
          _buildAnswerTextField(3, 'Sinhala Answer 3', 'English Answer 3', widget.question.sinhalaAnswerThree,
              widget.question.englishAnswerThree),
          _buildAnswerTextField(4, 'Sinhala Answer 4', 'English Answer 4', widget.question.sinhalaAnswerFour,
              widget.question.englishAnswerFour),
          _buildAnswerTextField(5, 'Sinhala Answer 5', 'English Answer 5', widget.question.sinhalaAnswerFive,
              widget.question.englishAnswerFive),

          _buildCorrectAnswerRadioButtonGroup(), // Radio button group for selecting the correct answer
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              if (selectedAnswer != null) {
                widget.question.correctAnswer = selectedAnswer!;
              }

              if (widget.isLastPage) {
                widget.onDonePressed();
              } else {
                widget.onNextPressed();
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            ),
            child: Text(widget.isLastPage ? "Done" : "Next"),
          ),
        ],
      ),
    );
  }

  Widget _buildAnswerTextField(int answerNumber, String sinhalaLabel, String englishLabel, String sinhalaValue,
      String englishValue) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Answer $answerNumber', style: TextStyle(fontWeight: FontWeight.bold)),
        TextField(
          decoration: InputDecoration(labelText: 'Sinhala $sinhalaLabel'),
          onChanged: (value) {
            if (answerNumber == 1) {
              widget.question.sinhalaAnswerOne = value;
            } else if (answerNumber == 2) {
              widget.question.sinhalaAnswerTwo = value;
            } else if (answerNumber == 3) {
              widget.question.sinhalaAnswerThree = value;
            } else if (answerNumber == 4) {
              widget.question.sinhalaAnswerFour = value;
            } else if (answerNumber == 5) {
              widget.question.sinhalaAnswerFive = value;
            }
          },
        ),
        TextField(
          decoration: InputDecoration(labelText: 'English $englishLabel'),
          onChanged: (value) {
            if (answerNumber == 1) {
              widget.question.englishAnswerOne = value;
            } else if (answerNumber == 2) {
              widget.question.englishAnswerTwo = value;
            } else if (answerNumber == 3) {
              widget.question.englishAnswerThree = value;
            } else if (answerNumber == 4) {
              widget.question.englishAnswerFour = value;
            } else if (answerNumber == 5) {
              widget.question.englishAnswerFive = value;
            }
          },
        ),
      ],
    );
  }

  Widget _buildCorrectAnswerRadioButtonGroup() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Select Correct Answer', style: TextStyle(fontWeight: FontWeight.bold)),
        Row(
          children: [
            for (int i = 1; i <= 5; i++)
              Row(
                children: [
                  Radio<int>(
                    value: i,
                    groupValue: selectedAnswer,
                    onChanged: (value) {
                      setState(() {
                        selectedAnswer = value;
                      });
                    },
                  ),
                  Text('Answer $i'),
                ],
              ),
          ],
        ),
      ],
    );
  }
}
