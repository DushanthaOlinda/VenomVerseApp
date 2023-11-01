import 'package:VenomVerse/models/auth.dart';
import 'package:VenomVerse/screens/pages/zoologistRequests_page.dart';
import 'package:VenomVerse/services/api_user_control.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ZoologistRequestForm extends StatefulWidget {
  const ZoologistRequestForm({Key? key, required this.data,}) : super(key: key);

  final Map<String,dynamic > data;

  @override
  State<ZoologistRequestForm> createState() => _ZoologistRequestFormState();
}

class Zoologist {
  final int zoologistId;
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
    required this.zoologistId,
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


  @override
  Widget build(BuildContext context) {

    final List<Zoologist> zoologists = [
      Zoologist(
        zoologistId: widget.data["zoologistId"],
        name: widget.data["userFirstName"],
        age: 30, // convert DOB widget.data["dob]
        nicNumber: widget.data["nic"],
        contactNumber: widget.data["contactNo"],
        degreeName: widget.data["degreeName"],
        graduationYear: widget.data["graduatedYear"],
        university: widget.data["university"],
        zoologistImage: "assets/images/zoologistImage1.jpeg",
        graduationCertificateImage: "assets/images/graduationImage.jpeg",
      ),
      // Add more Zoologist objects for each request
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Approval Requests"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
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

  const RequestCard({super.key,
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
                  style: const TextStyle(fontWeight: FontWeight.bold),
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
                        AuthModel auth = context.read<AuthModel>();
                        UserApi.approveZooloigist(zoologist.zoologistId, int.parse(auth.userName!), true);
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
            child: const Text("OK"),
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
        title: const Text("Rejected"),
        content: const Text("Request has been rejected."),
        actions: [
          TextButton(
            child: const Text("OK"),
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


