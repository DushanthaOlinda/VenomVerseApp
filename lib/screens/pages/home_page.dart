import 'dart:async';
import 'dart:io';

import 'package:VenomVerse/models/user.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:comment_box/comment/comment.dart';
import 'package:provider/provider.dart';

import '../../models/auth.dart';
import '../../models/post.dart';
import '../../services/post_api.dart';
import '../../widgets/com_post_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLiked = false;
  late Future<List<dynamic>> cardData;
  List<PostCard> posts = [];
  @override
  Widget build(BuildContext context) {
    var auth = context.watch<AuthModel>();
    Map<String, dynamic> user;
    return Scaffold(
      backgroundColor: Colors.red[50],
      body: FutureBuilder<List<dynamic>>(
        future: cardData,
        builder: (context, snapshot) {
          return RefreshIndicator(
            onRefresh: _pullRefresh,
            child: _listView(snapshot),
          );
        },
      ),
      // Center(
      //   child: Card(
      //       child: ListView(
      //     children: posts,
      //   )),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    const AddNewPost()), // Navigate to CardsPage
          );
          // Handle the onPressed event for the "Add New Card" button
          // Perform the desired action here, such as opening a new screen or dialog
          // to add a new card.
          // Example:
          // Navigator.push(context, MaterialPageRoute(builder: (context) => AddCardPage()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _listView(AsyncSnapshot snapshot) {
    if (snapshot.hasData) {
      return ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (context, index) {
          return PostCard(data: snapshot.data[index]);
        },
      );
    } else {
      return const Center(
        child: Text('Loading data...'),
      );
    }
  }

  Future<void> _pullRefresh() async {
    List newPosts = await PostApi().getAllPosts();

    setState(() {
      cardData = Future.value(newPosts);
    });
  }

  @override
  void initState() {
    super.initState();
    cardData = PostApi().getAllPosts();
  }
}

class AddNewPost extends StatefulWidget {
  const AddNewPost({super.key});

  @override
  AddNewPostState createState() => AddNewPostState();
}

class AddNewPostState extends State<AddNewPost> {
  List<File> imageFiles = [];
  TextEditingController descriptionController = TextEditingController();
  late String dropdownValue;

  @override
  Widget build(BuildContext context) {
    const List<String> list = <String>['Cobra', 'Ahatulla', 'Viper', 'Python'];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Request to Add a New Post"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () async {
                var pickedImages = await _getFromGallery();
                if (pickedImages != null) {
                  setState(() {
                    imageFiles.addAll(pickedImages);
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              icon: const Icon(Icons.image),
              label: const Text('Select Images'),
            ),
            const SizedBox(height: 10),
              // Display selected images
              Center(
                child: SizedBox(
                  height: 200,
                  child: Center(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: imageFiles.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.file(
                            imageFiles[index],
                            width: 150,
                            height: 150,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),



            const SizedBox(height: 20),
            DropdownMenu<String>(
              initialSelection: list.first,
              onSelected: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue = value!;
                });
              },
              dropdownMenuEntries:
                  list.map<DropdownMenuEntry<String>>((String value) {
                return DropdownMenuEntry<String>(value: value, label: value);
              }).toList(),
            ),
            const SizedBox(height: 20),
            // Description Box
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  hintText: 'Enter description...',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
            ),
            const SizedBox(height: 20),
            // Submit Button
            ElevatedButton.icon(
              onPressed: () async {
                // TODO: navigate to home
                // Handle submit here
                String description = descriptionController.text;
                String imageLink = '';
                // File? image = imageFile;
                List<File> images = imageFiles;
                List<String> imageLinks = [];
                for (var image in images) {
                  String fileName = "images/${DateTime.timestamp()}.png";
                  final storage = FirebaseStorage.instance;
                  final Reference ref = storage.ref().child(fileName);

                  await ref.putFile(image);
                  imageLink = await ref.getDownloadURL();
                  imageLinks.add(imageLink);
                } // You can now use the 'imageFile' and 'description' for further processing

                var userId = await User.getUserName().then((value) => value);
                if (kDebugMode) {
                  print(userId);
                  print(dropdownValue);
                  print(description);
                  print(imageLink);
                }

                var post = Post(
                    int.parse(userId!), dropdownValue, description, imageLinks);

                await PostApi.createPost(post.toJson()).then((value) =>
                    Navigator.pushReplacementNamed(context, '/home'));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              icon: const Icon(Icons.post_add),
              label: const Text(
                'Request',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<List<File>?> _getFromGallery() async {
    final picker = ImagePicker();
    final pickedImages = await picker.pickMultiImage(
      imageQuality: 50, // Adjust image quality as needed
    );

    return pickedImages.map((pickedImage) => File(pickedImage.path)).toList();
  }
}

class TestMe extends StatefulWidget {
  const TestMe({super.key, required this.postId, required this.comments});
  final int postId;
  final List comments;

  @override
  State<TestMe> createState() => _TestMeState();
}

class _TestMeState extends State<TestMe> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  // List filedata = [
  //   {
  //     'name': 'Chuks Okwuenu',
  //     'pic': 'https://picsum.photos/300/30',
  //     'message': 'I love to code',
  //     'date': '2021-01-01 12:00:00'
  //   },
  //   {
  //     'name': 'Biggi Man',
  //     'pic': 'https://www.adeleyeayodeji.com/img/IMG_20200522_121756_834_2.jpg',
  //     'message': 'Very cool',
  //     'date': '2021-01-01 12:00:00'
  //   },
  //   {
  //     'name': 'Tunde Martins',
  //     'pic': 'assets/img/userpic.jpg',
  //     'message': 'Very cool',
  //     'date': '2021-01-01 12:00:00'
  //   },
  //   {
  //     'name': 'Biggi Man',
  //     'pic': 'https://picsum.photos/300/30',
  //     'message': 'Very cool',
  //     'date': '2021-01-01 12:00:00'
  //   },
  // ];

  Widget commentChild(data) {
    return ListView(
      children: [
        for (var i = 0; i < data.length; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
            child: ListTile(
              leading: GestureDetector(
                onTap: () async {
                  // Display the image in large form.
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: const CircleAvatar(
                    radius: 50,
                    // backgroundImage: CommentBox.commentImageParser(
                    //     imageURLorPath: data[i]['pic'])
                  ),
                ),
              ),
              title: Text(
                data[i]['userId'].toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(data[i]['comment'] ?? ""),
              trailing: Text(data[i]['dateTime'] ?? "",
                  style: const TextStyle(fontSize: 10)),
            ),
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    List filedata = widget.comments;
    var auth = context.watch<AuthModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Comment Page"),
        backgroundColor: Colors.green,
      ),
      body: CommentBox(
        userImage: CommentBox.commentImageParser(
            imageURLorPath: "assets/img/userpic.jpg"),
        labelText: 'Write a comment...',
        errorText: 'Comment cannot be blank',
        withBorder: false,
        sendButtonMethod: () {
          if (formKey.currentState!.validate()) {
            setState(() {
              var value = {
                'userId': auth.userName,
                'pic':
                    'https://lh3.googleusercontent.com/a-/AOh14GjRHcaendrf6gU5fPIVd8GIl1OgblrMMvGUoCBj4g=s400',
                'comment': commentController.text,
                'dateTime': '2021-01-01 12:00:00'
              };
              filedata.insert(0, value);
            });

            setComment(widget.postId, commentController.text,
                int.parse(auth.userName!));

            commentController.clear();
            FocusScope.of(context).unfocus();
          } else {
            if (kDebugMode) {
              print("Not validated");
            }
          }
        },
        formKey: formKey,
        commentController: commentController,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        sendWidget: const Icon(Icons.send_sharp, size: 30, color: Colors.white),
        child: commentChild(filedata),
      ),
    );
  }

  Future<void> setComment(int postId, String text, int uid) async {
    var comment = Comment(postId, uid, text);
    PostApi.setComment(comment.toJson());
  }
}
