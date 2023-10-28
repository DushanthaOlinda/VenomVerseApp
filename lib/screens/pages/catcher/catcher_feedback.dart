import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../home_screen.dart';

class catcherFeedbackPage extends StatefulWidget {
  const catcherFeedbackPage({Key? key});

  @override
  State<catcherFeedbackPage> createState() => _catcherFeedbackPageState();
}

class _catcherFeedbackPageState extends State<catcherFeedbackPage> {
  double rating = 0;
  TextEditingController topicController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Give Feedback for the Snake Catcher service"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Rate your Experience',
                style: TextStyle(fontSize: 20),
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
              const SizedBox(height: 20),
              Text(
                'You rated: $rating',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 50),
              const Text(
                'Care to share more about us?',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: descriptionController,
                maxLines: 10,
                decoration: const InputDecoration(
                  labelText: 'Feedback Description',
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
                child: const Text('Publish Feedback'),
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
      title: "Thank You For Giving Us Feedback",
      desc: "By making your voice heard, you help us improve VenomVerse",
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
          child: const Text(
            "Go Back Home",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    ).show();
  }

}