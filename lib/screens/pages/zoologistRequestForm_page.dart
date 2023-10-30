import 'package:VenomVerse/screens/pages/zoologistRequests_page.dart';
import 'package:flutter/material.dart';

class ZoologistRequestForm extends StatefulWidget {
  const ZoologistRequestForm({Key? key}) : super(key: key);

  @override
  State<ZoologistRequestForm> createState() => _ZoologistRequestFormState();
}

class Zoologist {
  final String name;
  final int age;
  final String nicNumber;
  final String contactNumber;
  final String degreeName;
  final String graduationYear;
  final String university;
  final String zoologistImage;
  final String graduationCertificateImage;

  Zoologist({
    required this.name,
    required this.age,
    required this.nicNumber,
    required this.contactNumber,
    required this.degreeName,
    required this.graduationYear,
    required this.university,
    required this.zoologistImage,
    required this.graduationCertificateImage,
  });
}

class _ZoologistRequestFormState extends State<ZoologistRequestForm> {
  final List<Zoologist> zoologists = [
    Zoologist(
      name: "John Doe",
      age: 30,
      nicNumber: "12345-67890",
      contactNumber: "123-456-7890",
      degreeName: "Master of Zoology",
      graduationYear: "2022",
      university: "University of Wildlife",
      zoologistImage: "assets/images/zoologistImage1.jpeg",
      graduationCertificateImage: "assets/images/graduationImage.jpeg",
    ),
    // Add more Zoologist objects for each request
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Approval Requests"),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: zoologists.map((zoologist) {
          return RequestCard(
            zoologist: zoologist,
          );
        }).toList(),
      ),
    );
  }
}

class RequestCard extends StatelessWidget {
  final Zoologist zoologist;

  const RequestCard({
    required this.zoologist,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            zoologist.zoologistImage,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name: ${zoologist.name}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("Age: ${zoologist.age} years"),
                Text("NIC Number: ${zoologist.nicNumber}"),
                Text("Contact Number: ${zoologist.contactNumber}"),
                Text("Degree: ${zoologist.degreeName}"),
                Text("Graduation Year: ${zoologist.graduationYear}"),
                Text("University: ${zoologist.university}"),
                const SizedBox(height: 16.0),
                Image.asset(
                  zoologist.graduationCertificateImage,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _showSuccessDialog(context);
                      },
                      child: const Text("Approve"),
                    ),
                    const SizedBox(width: 16.0), // Add spacing between buttons
                    ElevatedButton(
                      onPressed: () {
                        _showRejectionDialog(context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red, // Button background color
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
// Method to show a success dialog
void _showSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Approved"),
        content: const Text("Request has been successfully approved."),
        actions: [
          TextButton(
            child: Text("OK"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ZoologistRequestsPage()),
              );// Navigate to the new page
            },
          ),
        ],
      );
    },
  );
}

// Method to show a rejection dialog
void _showRejectionDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Rejected"),
        content: Text("Request has been rejected."),
        actions: [
          TextButton(
            child: Text("OK"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ZoologistRequestsPage()),
                );// Navigate to the new page
              },
          ),
        ],
      );
    },
  );
}


