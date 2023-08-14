
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:comment_box/comment/comment.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.red[50],

      body: Center(

        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                child: const Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/user image.png'),
                      radius: 30,
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Kimutu Kisal',
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          'Posted 2 hours ago',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'A snake is a type of reptile that belongs to the suborder Serpentes. Snakes are known for their elongated, legless bodies covered in scales. They are found in various habitats worldwide, including forests, deserts, grasslands, and even bodies of water.',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Image.asset('assets/images/snake image.jpg'),
              Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      icon: Icon(
                        isLiked ? Icons.favorite : Icons.favorite_border,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        setState(() {
                          isLiked = !isLiked;
                        });
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.comment,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const TestMe()),
                        );
                        // Perform comment action
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.report,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        popUpReportPost(context);
                        // Perform report action
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          Navigator.push(
            context,
            MaterialPageRoute(builder: (
                context) => const AddNewPost()), // Navigate to CardsPage
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

  popUpReportPost(context) {
    Alert(
      context: context,
      type: AlertType.warning,
      title: "REPORT THE POST",
      desc: "Are you sure to report the post?",
      buttons: [
        DialogButton(
          onPressed: () {
            Navigator.pop(context);
            reportPost(context);
            // Perform report action
          },
          color: const Color.fromRGBO(0, 179, 134, 1.0),
          child: const Text(
            "Yes",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        DialogButton(
          onPressed: () => Navigator.pop(context),
          gradient: const LinearGradient(colors: [
            Color.fromRGBO(116, 116, 191, 1.0),
            Color.fromRGBO(52, 138, 199, 1.0),
          ]),
          child: const Text(
            "No",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        )
      ],
    ).show();
  }

   reportPost(context) {
    Alert(
      context: context,
      type: AlertType.success,
      title: "Thanks for letting us know.",
      desc: "We'll send you a notification to view the outcome as soon as possible",
      buttons: [
        DialogButton(
          onPressed: () {
            Navigator.pop(context);

            // Perform report action
          },
          color: const Color.fromRGBO(0, 179, 134, 1.0),
          child: const Text(
            "Back",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        DialogButton(
          onPressed: () {
            Navigator.pop(context);
            addReason(context);


          },
          gradient: const LinearGradient(colors: [
            Color.fromRGBO(116, 116, 191, 1.0),
            Color.fromRGBO(52, 138, 199, 1.0),
          ]),
          child: const Text(
            "Add a Reason",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        )
      ],
    ).show();
  }

   cancelReport(context) {
     Alert(
       context: context,
       type: AlertType.error,
       title: "This report has been cancelled.",
       desc: "You can report this post again if you change your mind.",
       buttons: [
         DialogButton(
           onPressed: () {
             Navigator.pop(context);
             Navigator.pushReplacementNamed(context, '/home');
             // Perform report action
           },
           color: const Color.fromRGBO(0, 179, 134, 1.0),
           child: const Text(
             "OK",
             style: TextStyle(color: Colors.white, fontSize: 18),
           ),
         ),

       ],
     ).show();
   }

  addReason(context) {
    Alert(
      context: context,
      
      title: "Please select the problem.",
      desc: " ",
      buttons: [
        DialogButton(
          onPressed: () {
            Navigator.pop(context);
            reportReceived(context);
            // Perform report action
          },

          color: const Color.fromRGBO(0, 179, 134, 1.0),
          child: const Text(
            "Hate speech",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        DialogButton(
          onPressed: () {
            Navigator.pop(context);
            reportReceived(context);
            // Perform report action
          },
          color: const Color.fromRGBO(0, 179, 134, 1.0),
          child: const Text(
            "False Information",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        DialogButton(
          onPressed: () {
            Navigator.pop(context);
            reportReceived(context);
            // Perform report action
          },
          color: const Color.fromRGBO(0, 179, 134, 1.0),
          child: const Text(
            "Spam",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),

      ],
    ).show();
  }

   reportReceived(context) {
     Alert(
       context: context,
       type: AlertType.success,
       title: "Thank you, we've received your report",
       desc: " ",
       buttons: [
         DialogButton(
           onPressed: () {
             Navigator.pop(context);
             Navigator.pushReplacementNamed(context, '/home');
             // Perform report action
           },
           color: const Color.fromRGBO(0, 179, 134, 1.0),
           child: const Text(
             "Back",
             style: TextStyle(color: Colors.white, fontSize: 18),
           ),
         ),

       ],
     ).show();
   }

}




class AddNewPost extends StatefulWidget {
  const AddNewPost({super.key});

  @override
  State<StatefulWidget> createState() {
    return AddNewPostState();
  }
}

class AddNewPostState extends State<AddNewPost> {
  File? imageFile;
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                var pickedImage = await _getFromGallery();
                setState(() {
                  imageFile = pickedImage;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,


              ),
              icon: const Icon(Icons.image), // Edit icon
              label: const Text('Select Image'),
               // Adjust padding as needed
            ),

            const SizedBox(height: 10,width: 20,),
            if (imageFile != null)
              Image.file(
                imageFile!,
                width: 400,
                height: 200,

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
              onPressed: () {
                // Handle submit here
                String description = descriptionController.text;
                // You can now use the 'imageFile' and 'description' for further processing
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Add border radius for button
                  ),
              ),
              icon: const Icon(Icons.post_add), // Edit icon
              label: const Text('Request',style: TextStyle(fontSize: 18, color: Colors.white)),

            ),

          ],
        ),

      ),
    );
  }

  Future<File?> _getFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }
}





class TestMe extends StatefulWidget {
  const TestMe({super.key});

  @override
  _TestMeState createState() => _TestMeState();
}

class _TestMeState extends State<TestMe> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  List filedata = [
    {
      'name': 'Chuks Okwuenu',
      'pic': 'https://picsum.photos/300/30',
      'message': 'I love to code',
      'date': '2021-01-01 12:00:00'
    },
    {
      'name': 'Biggi Man',
      'pic': 'https://www.adeleyeayodeji.com/img/IMG_20200522_121756_834_2.jpg',
      'message': 'Very cool',
      'date': '2021-01-01 12:00:00'
    },
    {
      'name': 'Tunde Martins',
      'pic': 'assets/img/userpic.jpg',
      'message': 'Very cool',
      'date': '2021-01-01 12:00:00'
    },
    {
      'name': 'Biggi Man',
      'pic': 'https://picsum.photos/300/30',
      'message': 'Very cool',
      'date': '2021-01-01 12:00:00'
    },
  ];

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
                  print("Comment Clicked");
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: CircleAvatar(
                      radius: 50,
                      backgroundImage: CommentBox.commentImageParser(
                          imageURLorPath: data[i]['pic'])),
                ),
              ),
              title: Text(
                data[i]['name'],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(data[i]['message']),
              trailing: Text(data[i]['date'], style: const TextStyle(fontSize: 10)),
            ),
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Comment Page"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: CommentBox(
          userImage: CommentBox.commentImageParser(
              imageURLorPath: "assets/img/userpic.jpg"),
          labelText: 'Write a comment...',
          errorText: 'Comment cannot be blank',
          withBorder: false,
          sendButtonMethod: () {
            if (formKey.currentState!.validate()) {
              print(commentController.text);
              setState(() {
                var value = {
                  'name': 'New User',
                  'pic':
                  'https://lh3.googleusercontent.com/a-/AOh14GjRHcaendrf6gU5fPIVd8GIl1OgblrMMvGUoCBj4g=s400',
                  'message': commentController.text,
                  'date': '2021-01-01 12:00:00'
                };
                filedata.insert(0, value);
              });
              commentController.clear();
              FocusScope.of(context).unfocus();
            } else {
              print("Not validated");
            }
          },
          formKey: formKey,
          commentController: commentController,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          sendWidget: const Icon(Icons.send_sharp, size: 30, color: Colors.white),
          child: commentChild(filedata),
        ),
      ),
    );
  }
}

