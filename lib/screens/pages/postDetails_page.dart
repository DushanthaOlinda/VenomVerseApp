import 'package:VenomVerse/models/auth.dart';
import 'package:VenomVerse/screens/pages/postRequests_page.dart';
import 'package:VenomVerse/services/api.dart';
import 'package:VenomVerse/services/post_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class PostDetailsPage extends StatefulWidget {


  const PostDetailsPage({Key? key, required this.postId}) : super(key: key);

  final int postId;

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
    required this.images, required name,

  });
}

class _PostDetailsPageState extends State<PostDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return PostDetailsWidget(postId: widget.postId);
  }
}

class PostCard extends StatelessWidget {

  final Post post;

  const PostCard({
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
  const PostDetailsWidget({super.key, required this.postId});
  final int postId;

  @override
  // Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
// }
// final List<Post> posts = [
//     Post(
//       category: "science",
//       title: "This is the title",
//       summary: "This is the summary about the article",
//       description: "This is the description",
//       images: [
//         'assets/images/snake2.jpg',
//         'assets/images/snake4.jpg',
//         // Add more image paths here...
//       ],
//     ),
//   ];
//
//   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Article Requests"),
      ),
      body: Column(
        children: [
           Expanded(
            child: FutureBuilder<Map<String, dynamic>>(
              future: PostApi.getPost(postId),
              builder: (context, snapshot) {
                return PostCard(post: Post(name: "", category: snapshot.data?["category"], title: snapshot.data?[""], summary: '', description: snapshot.data?["description"], images: snapshot.data?["media"]),);
              }
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    AuthModel auth = context.read<AuthModel>();
                    PostApi.postApprove(postId, true, int.parse(auth.userName!));
                    _showSuccessDialog(context);
                  },
                  child: const Text("Approve"),
                ),
                ElevatedButton(
                  onPressed: () {
                    AuthModel auth = context.read<AuthModel>();
                    PostApi.postApprove(postId, false, int.parse(auth.userName!));
                    _showRejectionDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red, // Set the background color to red
                  ),
                  child: const Text("Reject"),
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
