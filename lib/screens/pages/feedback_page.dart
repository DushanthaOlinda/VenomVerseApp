import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../home_screen.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  double rating = 0;
  TextEditingController topicController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool isEnglish = true; // Add a variable to track the language state.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(isEnglish?"Give Feedback":"ප්රතිචාර දක්වන්න"),
        actions: [
          DropdownButton<String>(
            onChanged: (value) {
              setState(() {
                isEnglish = value == 'English'; // Set the language based on the selected value.
              });
            },
            value: isEnglish ? 'English' : 'සිංහල',
            items: <String>['English', 'සිංහල']
                .map((String language) {
              return DropdownMenuItem<String>(
                value: language,
                child: Row(
                  children: [
                    language == 'English'
                        ? Icon(Icons.language)
                        : Icon(Icons.translate),
                    SizedBox(width: 8),
                    Text(language),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [


              ],
            ),
               Text(
                isEnglish ? 'Rate your Experience' : 'ඔබේ අත්දැකීම් ශ්‍රේණිගත කරන්න',
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
                isEnglish?'You rated: $rating':'ඔබ ශ්‍රේණිගත කළා: $rating',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 50),
               Text(
                isEnglish?'Care to share more about us?':'අප ගැන වැඩි විස්තර බෙදා ගැනීමට සැලකිලිමත් වන්න',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: descriptionController,
                maxLines: 10,
                decoration:  InputDecoration(
                  labelText: isEnglish ? 'Feedback Description'
                      : 'ප්‍රතිපෝෂණ විස්තරය',
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
                    style: TextStyle(fontSize: 18),
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
