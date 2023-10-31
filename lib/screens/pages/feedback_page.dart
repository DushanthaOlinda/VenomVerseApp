import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../home_screen.dart';

class FeedbackPage extends StatefulWidget {
  final bool isEnglish; // Declare the variable as a parameter for the FeedbackPage.

  const FeedbackPage({Key? key, required this.isEnglish}) : super(key: key);

  @override
  State<FeedbackPage> createState() => _FeedbackPageState(isEnglish: isEnglish);
}


class _FeedbackPageState extends State<FeedbackPage> {
  final bool isEnglish; // Declare the variable in the state.

  _FeedbackPageState({required this.isEnglish});
  double rating = 0;
  TextEditingController topicController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(isEnglish?'Give Feedback':'ප්රතිචාර දක්වන්න'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                isEnglish ? 'Rate your Experience' : 'ඔබේ අත්දැකීම් ශ්‍රේණිගත කරන්න',
                style: const TextStyle(fontSize: 20),
              ),
              RatingBar.builder(
                initialRating: rating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 40,
                itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (newRating) {
                  setState(() {
                    rating = newRating;
                  });
                },
              ),
              SizedBox(height: 20),
              Text(
                isEnglish?'You rated: $rating':'ඔබ ශ්‍රේණිගත කළා: $rating',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 50),
               Text(
                isEnglish?'Care to share more about us?':'අප ගැන වැඩි විස්තර බෙදා ගැනීමට කැමතිද?',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: descriptionController,
                maxLines: 10,
                decoration: InputDecoration(
                  labelText: isEnglish
                      ? 'Feedback Description'
                      : 'ප්‍රතිපාදන විස්තර',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  popUpThankFeedback(context);
                  // Handle the publish button press here
                  // You can use feedbackTopic, feedbackDescription, and rating for further processing
                  // For example, you can send this data to a server or save it locally.
                },
                child: Text(
                  isEnglish ? 'Publish Feedback' : 'ප්‍රතිපෝෂණ ප්‍රකාශ කරන්න',
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  popUpThankFeedback(context) {

    Alert(
      context: context,
      image: Image.asset("assets/images/thank.jpg"),
      title: isEnglish?'Thank You For Giving Us Feedback':'අපට ප්‍රතිපෝෂණ ලබා දීම ගැන ස්තුතියි',
      desc: isEnglish? 'By making your voice heard, you help us improve VenomVerse':'ඔබේ හඬ ඇසීමට සැලැස්වීමෙන්, ඔබ අපට VenomVerse වැඩිදියුණු කිරීමට උදවු කරයි',
      buttons: [
        DialogButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const MyHomePage(title: 'VenomVerse',)),
            );
          },
          width: 150,
          child: Text(
            isEnglish? 'Go Back Home': 'ආපසු ගෙදර යන්න',
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    ).show();
  }
}
