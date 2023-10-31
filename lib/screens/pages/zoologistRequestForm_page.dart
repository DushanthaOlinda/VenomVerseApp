import 'package:flutter/material.dart';

class ZoologistRequestForm extends StatefulWidget {
  const ZoologistRequestForm({Key? key}) : super(key: key);

  @override
  State<ZoologistRequestForm> createState() => _ZoologistRequestFormState();
}

class _ZoologistRequestFormState extends State<ZoologistRequestForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Approval Requests"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          RequestCard(
            degreeName: "Master of Zoology",
            graduationYear: "2022",
            university: "University of Wildlife",
            imagePath: "assets/images/graduationImage.jpeg",
          ),
          // Add more RequestCard widgets for each request
        ],
      ),
    );
  }
}

class RequestCard extends StatelessWidget {
  final String degreeName;
  final String graduationYear;
  final String university;
  final String imagePath;

  const RequestCard({super.key, 
    required this.degreeName,
    required this.graduationYear,
    required this.university,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Degree: $degreeName",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("Graduation Year: $graduationYear"),
                Text("University: $university"),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Handle Approve button click
                      },
                      child: const Text("Approve"),
                    ),
                    const SizedBox(width: 16.0), // Add spacing between buttons
                    ElevatedButton(
                      onPressed: () {
                        // Handle Reject button click
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red, // Button background color
                      ),
                      child: const Text(
                        "Reject",
                        style: TextStyle(
                          color: Colors.white, // Text color
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
