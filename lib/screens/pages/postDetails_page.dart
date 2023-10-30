import 'package:VenomVerse/screens/pages/postRequests_page.dart';
import 'package:flutter/material.dart';



class PostDetailsPage extends StatefulWidget {

  const PostDetailsPage({Key? key}) : super(key: key);

  @override
  State<PostDetailsPage> createState() => _PostDetailsPageState();
}
class Post {
  final String category;
  final String title;
  final String summary;
  final String description;
  final List<String> images;


  Post({
    required this.category,
    required this.title,
    required this.summary,
    required this.description,
    required this.images,

  });
}

class _PostDetailsPageState extends State<PostDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return PostDetailsWidget();
  }
}

class PostCard extends StatelessWidget {
  final Post post;

  PostCard({
    Key? key, // Add the key parameter here
    required this.post,
  }) : super(key: key); // Correct the syntax here

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Category: ${post.category}"),
          const SizedBox(height: 10),
          Text("Title: ${post.title}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 10),
          Text("Summary: ${post.summary}",
              style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text("Description: ${post.description}"),
          const SizedBox(height: 20),
          const Text("Images:"),
          const SizedBox(height: 10),
          for (String imageUrl in post.images)
            Image.asset(imageUrl), // Use Image.asset if images are in your project
        ],
      ),
    );
  }
}
class PostDetailsWidget extends StatelessWidget {
  final List<Post> posts = [
    Post(
      category: "science",
      title: "This is the title",
      summary: "This is the summary about the article",
      description: "This is the description",
      images: [
        'assets/images/snake2.jpg',
        'assets/images/snake4.jpg',
        // Add more image paths here...
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Article Requests"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: posts.map((post) {
                return PostCard(
                  post: post,
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _showSuccessDialog(context);
                  },
                  child: Text("Approve"),
                ),
                ElevatedButton(
                  onPressed: () {
                    _showRejectionDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red, // Set the background color to red
                  ),
                  child: Text("Reject"),
                ),
              ],
            ),
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
        title: Text("Approved"),
        content: Text("Request has been successfully approved."),
        actions: [
          TextButton(
            child: Text("OK"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PostRequestsPage()),
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
                    builder: (context) => const PostRequestsPage()),
              );// Navigate to the new page
            },
          ),
        ],
      );
    },
  );
}
