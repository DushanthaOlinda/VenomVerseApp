import 'package:flutter/material.dart';

class Post {
  final String name;
  final String title;
  final DateTime requestedDate;
  final List<String> imagePaths; // List of image paths

  const Post({
    required this.name,
    required this.title,
    required this.requestedDate,
    required this.imagePaths,
  });
}

class ArticleRequestsPage extends StatefulWidget {
  const ArticleRequestsPage({Key? key}) : super(key: key);

  @override
  State<ArticleRequestsPage> createState() => _ArticleRequestsPageState();
}

class _ArticleRequestsPageState extends State<ArticleRequestsPage> {
  final List<Post> posts = [
    Post(
      name: "John Doe",
      title: "Science",
      requestedDate: DateTime(2023, 9, 20), // Example date
      imagePaths: [
        'assets/images/snake2.jpg',
        'assets/images/snake4.jpg',
        // Add more image paths here...
      ],
    ),
    // Add more posts here...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Articles"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SafeArea(
            child: Column(
              children: [
                for (final post in posts)
                  buildListTile(context, post),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildListTile(BuildContext context, Post post) {
    return Card(
      elevation: 3.0,
      child: ListTile(
        title: Text("${post.name} - ${post.title}"),
        subtitle: Text("Requested Date: ${post.requestedDate.toLocal()}"),
        trailing: const Icon(Icons.arrow_forward),
        onTap: () {
          // Navigate to the specific post page and pass imagePaths
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ArticleDetailsPage(
                post: post,
              ),
            ),
          );
        },
      ),
    );
  }
}

class ArticleDetailsPage extends StatelessWidget {
  final Post post;

  const ArticleDetailsPage({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${post.name} - ${post.title}"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Requested Date: ${post.requestedDate.toLocal()}",
              style: TextStyle(fontSize: 16),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              // Display the full details here
              "Having a Companion Could Help Rattlesnakes Stay Calm",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              // Display the full details here
              "This is the full description of the post. You can provide more details and information about the post here.",
              style: TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(height: 10), // Add some spacing between description and images
          Expanded(
            child: ListView.builder(
              itemCount: post.imagePaths.length,
              itemBuilder: (context, index) {
                return Image.asset(
                  post.imagePaths[index],
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          const SizedBox(height: 20), // Add spacing below the images
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Handle Approve button click
                  // You can implement the logic here
                },
                child: const Text("Approve"),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle Reject button click
                  // You can implement the logic here
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
          const SizedBox(height: 20), // Add spacing below the buttons
        ],
      ),
    );
  }
}
