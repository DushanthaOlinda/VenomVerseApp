import 'package:VenomVerse/screens/pages/catcher/send_request.dart';
import 'package:VenomVerse/services/catcher_services_api.dart';
import 'package:flutter/material.dart';

class ViewHistoryPage extends StatefulWidget {
  ViewHistoryPage({super.key, required this.catcherId, required this.reqId});
  late int catcherId;
  late int reqId;
  @override
  State<ViewHistoryPage> createState() => _ViewHistoryPageState();
}

class _ViewHistoryPageState extends State<ViewHistoryPage> {
  // Dummy data for catcher history
  final List<Map<String, String>> historyData = [
    {
      'Location': 'Matara',
      'date': 'October 10, 2023',
      'details': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    },
    {
      'Location': 'Galle',
      'date': 'October 15, 2023',
      'details': 'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    },
    // Add more history data entries here
  ];


  @override
  Widget build(BuildContext context) {
    var completedRequests = CatcherServicesApi.completedRequests(widget.catcherId);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catcher History'),
      ),
      body: FutureBuilder<List<Map<String, String>>>(
        future: completedRequests,
        builder: (context, snapshot) {
          print(snapshot.data);
          return ListView.builder(
            itemCount: snapshot.data?.length ?? 1,
            itemBuilder: (context, index) {
              final entry = snapshot.data?[index];
              return Card(
                elevation: 4, // Add shadow to the card
                margin: const EdgeInsets.all(10), // Add margin around the card
                child: ListTile(
                  title: Text(entry?['Location'] ?? 'Unknown Location'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Date: ${entry?['date'] ?? 'Unknown Date'}'),
                      Text('Details: ${entry?['details'] ?? 'No details available'}'),
                    ],
                  ),
                ),
              );
            },
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          CatcherServicesApi.serviceRequestResponse(widget.reqId, widget.catcherId, true);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const callingPage()),
          );
        },
        child: const Icon(Icons.send),
      ),
    );
  }
}
