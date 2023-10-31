import 'package:flutter/material.dart';

import 'complaintslist_page.dart';

class ComplaintsPage extends StatefulWidget {
  const ComplaintsPage({Key? key}) : super(key: key);

  @override
  State<ComplaintsPage> createState() => _ComplaintsPageState();
}

class _ComplaintsPageState extends State<ComplaintsPage> {
  // Sample data - You should replace this with your actual complaint data.
  List<Complaint> complaints = [
    Complaint(
      username: "User1",
      postCategory: "Category1",
      description: "This is a complaint about something.",
      images: ["image1.jpg", "image2.jpg"],
      postedDateTime: "2023-10-29 10:00 AM",
      reportedByUser: "Admin",
      reportedDateTime: "2023-10-29 12:00 PM",
      reason: "Inappropriate content",
    ),
    // Add more complaints here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Complaints"),
      ),
      body: ListView.builder(
        itemCount: complaints.length,
        itemBuilder: (context, index) {
          final complaint = complaints[index];
          return ComplaintCard(complaint: complaint);
        },
      ),
    );
  }
}

class Complaint {
  final String username;
  final String postCategory;
  final String description;
  final List<String> images;
  final String postedDateTime;
  final String reportedByUser;
  final String reportedDateTime;
  final String reason;

  Complaint({
    required this.username,
    required this.postCategory,
    required this.description,
    required this.images,
    required this.postedDateTime,
    required this.reportedByUser,
    required this.reportedDateTime,
    required this.reason,
  });
}

class ComplaintCard extends StatelessWidget {
  final Complaint complaint;

  const ComplaintCard({super.key, required this.complaint});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Column(
        children: [
          ListTile(
            title: Text("Username: ${complaint.username}"),
            subtitle: Text("Category: ${complaint.postCategory}"),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text("Description: ${complaint.description}"),
          ),

          // Display images here (you can use a GridView or a horizontal ListView).
          // Display posted date and time.
          ListTile(
            title: Text("Posted: ${complaint.postedDateTime}"),
          ),
          ListTile(
            title: Text("Reported by: ${complaint.reportedByUser}"),
            subtitle: Text("Reported on: ${complaint.reportedDateTime}"),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text("Reason: ${complaint.reason}"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  _showSuccessDialog(context);// Handle approve action
                },
                child: const Text("Approve"),
              ),
              ElevatedButton(
                onPressed: () {
                  _showRejectionDialog(context);// Handle reject action
                },
                child: const Text("Reject"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
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
                    builder: (context) => const ComplaintsListPage()),
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
                    builder: (context) => const ComplaintsListPage()),
              );// Navigate to the new page
            },
          ),
        ],
      );
    },
  );
}

