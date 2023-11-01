import 'package:flutter/material.dart';

import 'catcher_feedback.dart';

class callingPage extends StatefulWidget {
  const callingPage({super.key});

  @override
  State<callingPage> createState() => _callingPageState();
}

class _callingPageState extends State<callingPage> {
  @override
  void initState() {
    super.initState();

    // Simulate a delay of 3 seconds for the waiting screen
    Future.delayed(const Duration(seconds: 3), () {
      // After the delay, navigate to a new page or perform the next action
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const NextPage(), // Replace 'NextPage' with your next page widget
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Prevent the user from going back from this page
        return false;
      },
      child: const Scaffold(
        backgroundColor: Colors.black, // Set background color to black
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sending Request', // Display the name of the person being called
                style: TextStyle(
                  color: Colors.white, // Set the text color to white
                  fontSize: 25, // Adjust the font size
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Connecting...',
                style: TextStyle(
                  color: Colors.white, // Set the text color to white
                  fontSize: 24, // Increase the font size
                ),
              ),
              SizedBox(height: 20),
              Icon(
                Icons.send,
                size: 100, // Increase the size of the call icon
                color: Colors.green, // Set the color of the call icon
              ),




            ],
          ),
        ),
      ),

    );
  }
}

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Add the statement at the top of the page
            const Text(
              'Catcher request has been sent catcher will respond to the request soon',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.green, // You can choose a suitable color
              ),
            ),
            const SizedBox(height: 20), // Add some spacing between the statement and the emergency information
            const Text(
              'Emergency Contacts',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const ListTile(
              title: Text('Emergency Services: 911'),
            ),
            const ListTile(
              title: Text('Local Hospital: 123-456-7890'),
            ),
            const ListTile(
              title: Text('Local Poison Control: 800-123-4567'),
            ),
            const Divider(),
            const Text(
              'Snake Handling Instructions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              '1. Do not approach the snake; keep a safe distance.',
            ),
            const Text(
              '2. Keep children and pets away from the snake.',
            ),
            const Text(
              '3. Do not attempt to catch or handle the snake yourself.',
            ),
            const Text(
              '4. If bitten, immobilize the affected limb and seek immediate medical help.',
            ),
            const SizedBox(height: 20), // Add some spacing between the instructions and the button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const catcherFeedbackPage()),
                  );
                },
                child: const Text('Rate the Service'),
              ),
            ),
          ],
        ),
      ),
    );

  }
}

