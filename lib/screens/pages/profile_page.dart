import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_credit_card_new/credit_card_brand.dart';
import 'package:flutter_credit_card_new/flutter_credit_card.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:profile/profile.dart';
import 'package:video_uploader/video_uploader.dart';
import 'package:video_player/video_player.dart';


import 'home_page.dart';



class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topLeft,
            ),
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'Profile',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EditProfile()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow[700],
                ),
                icon: const Icon(Icons.edit), // Edit icon
                label: const Text('Edit Profile'),
              ),
            ),
            Profile(
              //profile data
              imageUrl:
                  "https://images.unsplash.com/photo-1598618356794-eb1720430eb4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",

              name: "Oshadhi Dilthara",
              website: "",
              designation: 'No, 22, Galle rd, Matara',
              email: 'oshadhi@gmail.com',
              phone_number: '0175773607',
            ),
            const SizedBox(height: 20),



            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            CardsPage()), // Navigate to CardsPage
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.yellow[700], // Set the button color to yellow
                ),
                child: const Text('Payments'),
              ),

            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const BecomeCatcher()), // Navigate to CardsPage
                      );
                      // Handle button press
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.yellow[700], // Set the button color to yellow
                    ),
                    child: const Text('Become a Catcher'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BecomeZoologist()), // Navigate to CardsPage
                      );
                      // Handle button press
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.yellow[700], // Set the button color to yellow
                    ),
                    child: const Text('Become a Zoologist'),
                  ),

                ],

              ),
            ),
            const SizedBox(height: 50),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const myPosts()), // Navigate to CardsPage
                  );
                  // Handle button press
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow[700],
                  // Set the button color to green
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15), // Adjust padding for button size
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // Adjust corner radius
                  ),
                ),
                child: const Text(
                  'View My Posts',
                  style: TextStyle(fontSize: 18), // Adjust font size
                ),
              ),
            )

          ],
        ),
      ),
    );
  }

}

class BecomeZoologist extends StatefulWidget {
  const BecomeZoologist({super.key});

  @override
  _BecomeZoologistState createState() => _BecomeZoologistState();
}

class _BecomeZoologistState extends State<BecomeZoologist> {
  File? imageFile;
  TextEditingController degreeController = TextEditingController();
  TextEditingController yearController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Request to Become a Zoologist"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 52),
            // Description: Upload a Video to Provide Proof of Qualifications
            const Text(
              'Upload a image to provide proof of your qualifications to become a Zoologist.',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () async {
                var pickedImage = await _getFromGallery();
                setState(() {
                  imageFile = pickedImage;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow[700],
              ),
              icon: const Icon(Icons.image),
              label: const Text('Select Image'),
            ),
            const SizedBox(height: 10, width: 20,),
            if (imageFile != null)
              Image.file(
                imageFile!,
                width: 400,
                height: 200,
              ),
            const SizedBox(height: 20),
            // Degree Box
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: degreeController,
                decoration: const InputDecoration(
                  hintText: 'Enter your degree...',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Graduation Year Box
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: yearController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Enter graduation year...',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: yearController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Enter your University...',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Submit Button
            ElevatedButton.icon(
              onPressed: () {
                // Handle submit here
                String degree = degreeController.text;
                String year = yearController.text;
                // You can now use the 'imageFile', 'degree', and 'year' for further processing
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow[700],
              ),
              icon: const Icon(Icons.post_add),
              label: const Text('Request'),
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

class myPosts extends StatefulWidget {
  const myPosts({super.key});

  @override
  _myPostsState createState() => _myPostsState();
}

class _myPostsState extends State<myPosts> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[50],
      appBar: AppBar(
        title: const Text('My Posts'),
      ),
      body: Center(
        child: Card(

          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Row(

                  children: [
                    const Row(
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
                    const SizedBox(width: 150),
                    PopupMenuButton<int>(
                      onSelected: (item) => handleClick(item),
                      itemBuilder: (context) => [
                        const PopupMenuItem<int>(value: 0, child: Text('Edit Post')),
                        const PopupMenuItem<int>(value: 1, child: Text('Delete Post')),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'A snake is a type of reptile that belongs to the suborder Serpentes. Snakes are known for their elongated, legless bodies covered in scales...',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Image.asset('assets/images/snake image.jpg'),
                const SizedBox(height: 16),
                Row(
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  popUpDeletePost(context) {
    Alert(
      context: context,

      title: "DELETE THE POST",
      desc: "Are you sure to delete the post?",
      buttons: [
        DialogButton(
          onPressed: () {
            Navigator.pop(context);
            deleteSuccess(context);
            // Perform report action
          },
          color: const Color.fromRGBO(0, 179, 134, 1.0),
          child: const Text(
            "OK",
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
            "CANCEL",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        )
      ],
    ).show();
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
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const myPosts()), // Navigate to CardsPage
            );
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

          onPressed: ()
    {
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const myPosts()), // Navigate to CardsPage
      );
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
          onPressed: ()
          {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const myPosts()), // Navigate to CardsPage
            );
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

  deleteSuccess(context) {
    Alert(
      context: context,
      type: AlertType.success,
      title: "Successfully Deleted",
      desc: " ",
      buttons: [
        DialogButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const myPosts()), // Navigate to CardsPage
            );            // Perform report action
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

  void handleClick(int item) {
    switch (item) {
      case 0: Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EditPost()),
      );

        break;
      case 1:popUpDeletePost(context);
        break;
    }
  }


}

class EditPost extends StatefulWidget {
  const EditPost({Key? key}) : super(key: key);

  @override
  _EditPostState createState() => _EditPostState();
}

class _EditPostState extends State<EditPost> {
  final TextEditingController _descriptionController = TextEditingController();
  File? _imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _imageFile != null
                ? Image.file(
              _imageFile!,
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            )
                : Image.asset(
              'assets/images/snake image.jpg', // Initial image from assets
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow[700],
                ),
              onPressed: () async {
                final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

                if (pickedFile != null) {
                  setState(() {
                    _imageFile = File(pickedFile.path);
                  });
                }
              },
              child: const Text('Pick and Update Image'),
            ),
            const SizedBox(height: 100),
            TextField(
              controller: _descriptionController,
              maxLines: null, // Allow unlimited lines
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                hintText: 'A snake is a type of reptile that belongs to the suborder Serpentes. Snakes are known for their elongated, legless bodies covered in scales. They are found in various habitats worldwide, including forests, deserts, grasslands, and even bodies of water.',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow[700],
                ),
              onPressed: () {
                // Update the description
              },
              child: const Text('Update Description'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }
}



const primaryColor = Colors.green;
const secondaryColor = Colors.green;

class BecomeCatcher extends StatefulWidget {
  const BecomeCatcher({super.key});

  @override
  _BecomeCatcherState createState() => _BecomeCatcherState();
}

class _BecomeCatcherState extends State<BecomeCatcher> {
  final _tokenTextController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  XFile? _selectedVideo; // Store the selected video

  void setProgress(double value) {
    setState(() {
      // Update the progress state here
    });
  }

  @override
  void dispose() {
    _tokenTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: primaryColor,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // This will navigate back to the previous screen
            },
          ),
          title: const Text('Request to Become a Catcher'),
        ),

        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 52),
                // Description: Upload a Video to Provide Proof of Qualifications
                const Text(
                  'Upload a video to provide proof of your qualifications to become a catcher.',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                ElevatedButton.icon(
                  onPressed: () async {
                    var source = ImageSource.gallery;
                    XFile? video = await _picker.pickVideo(source: source);
                    if (video != null) {
                      setState(() {
                        _selectedVideo = video;
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow[700],
                  ),
                  icon: const Icon(Icons.video_library), // Video icon
                  label: const Text('Select Video'),
                ),
                const SizedBox(height: 10),
                if (_selectedVideo != null)
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: VideoPlayerWidget(
                      videoPath: _selectedVideo!.path,
                    ),
                  ),
                const SizedBox(height: 20),
                // Description Box
                TextFormField(
                  controller: _tokenTextController,
                  decoration: const InputDecoration(
                    hintText: 'Enter description...',
                  ),
                ),
                const SizedBox(height: 20),
                MaterialButton(
                  color: Colors.yellow[700],
                  child: const Text(
                    "Upload Video",
                    style: TextStyle(
                        color: Colors.white70, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () async {
                    if (_selectedVideo != null) {
                      try {
                        var video = await ApiVideoUploader.uploadWithUploadToken(
                            _tokenTextController.text, _selectedVideo!.path,
                                (bytesSent, totalByte) {
                              setProgress(bytesSent / totalByte);
                            });
                        print("Video : $video");
                        print("Title : ${video.title}");

                      } catch (e) {
                        print("Failed to upload video: $e");
                      }
                    } else {
                      print("No video selected.");
                    }

                  },
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final String videoPath;

  const VideoPlayerWidget({Key? key, required this.videoPath}) : super(key: key);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(
      File(widget.videoPath),
    )..initialize().then((_) {
      // Ensure the first frame is shown
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: VideoPlayer(_controller),
    )
        : const CircularProgressIndicator(); // You can show a loading indicator while the video is loading
  }
}

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  void _changeProfilePicture() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profilePictureUrl = pickedFile.path;
      });
    }
  }

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late String _profilePictureUrl =
      'https://images.unsplash.com/photo-1598618356794-eb1720430eb4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'; // Store the profile picture URL here

  // Method to handle saving profile changes
  void _saveChanges() {
    // Implement the logic to save changes here
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    String profilePictureUrl = _profilePictureUrl;

    // Perform saving operations (e.g., update database, send API requests)
    // ...

    // Optionally, show a success message or navigate back to the previous screen
    // ...
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[50],
      appBar: AppBar(
        title: const Text('Edit Profile Details'),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          children: [
            const SizedBox(height: 16.0),

            // Profile Picture
            CircleAvatar(
              radius: 60.0,
              backgroundImage: NetworkImage(_profilePictureUrl),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _changeProfilePicture,
              child: const Text('Change Profile Picture'),
            ),
            const SizedBox(height: 16.0),
            // Username
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 16.0),
            // Email Address
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email Address',
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16.0),
            // Password
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Date of birth',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'NIC',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'District',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Address',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Contact Number',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Working Status',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _saveChanges,
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}

class CardsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[50],
      appBar: AppBar(
        title: const Text('Card Details'),
      ),
      body: const Center(
        child: Column(
          children: [
            Card(
              child: ListTile(
                title: Text('Card 1'),
                subtitle: Text('Card 1 Subtitle'),
                leading: Icon(Icons.credit_card),
                trailing: Text('Card 1 Number'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Card 2'),
                subtitle: Text('Card 2 Subtitle'),
                leading: Icon(Icons.credit_card),
                trailing: Text('Card 2 Number'),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    const AddNewCard()), // Navigate to CardsPage
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
}

class AddNewCard extends StatefulWidget {
  const AddNewCard({super.key});

  @override
  State<StatefulWidget> createState() {
    return AddNewCardState();
  }
}

class AddNewCardState extends State<AddNewCard> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.7),
        width: 2.0,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Credit Card View Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Colors.red[50],
        appBar: AppBar(
          title: const Text('Add New Card'),
          backgroundColor: Colors.green,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(
                  context); // This will navigate back to the previous screen
            },
          ),
        ),
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(
            image: !useBackgroundImage
                ? const DecorationImage(
                    image: ExactAssetImage('assets/bg.png'),
                    fit: BoxFit.fill,
                  )
                : null,
          ),
          child: SafeArea(
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 30,
                ),
                CreditCardWidget(
                  glassmorphismConfig:
                      useGlassMorphism ? Glassmorphism.defaultConfig() : null,
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  showBackView: isCvvFocused,
                  obscureCardNumber: true,
                  obscureCardCvv: true,
                  isHolderNameVisible: true,
                  cardBgColor: Colors.red,
                  backgroundImage:
                      useBackgroundImage ? 'assets/images/card_bg.jpg' : null,
                  isSwipeGestureEnabled: true,
                  onCreditCardWidgetChange:
                      (CreditCardBrand creditCardBrand) {},
                  customCardTypeIcons: <CustomCardTypeIcon>[
                    CustomCardTypeIcon(
                      cardType: CardType.mastercard,
                      cardImage: Image.asset(
                        'assets/images/mastercard.png',
                        height: 48,
                        width: 48,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        CreditCardForm(
                          formKey: formKey,
                          obscureCvv: true,
                          obscureNumber: true,
                          cardNumber: cardNumber,
                          cvvCode: cvvCode,
                          isHolderNameVisible: true,
                          isCardNumberVisible: true,
                          isExpiryDateVisible: true,
                          cardHolderName: cardHolderName,
                          expiryDate: expiryDate,
                          themeColor: Colors.blue,
                          cardNumberDecoration: InputDecoration(
                            labelText: 'Number',
                            hintText: 'XXXX XXXX XXXX XXXX',
                            hintStyle: const TextStyle(color: Colors.black),
                            labelStyle: const TextStyle(color: Colors.black),
                            focusedBorder: border,
                            enabledBorder: border,
                          ),
                          expiryDateDecoration: InputDecoration(
                            hintStyle: const TextStyle(color: Colors.black),
                            labelStyle: const TextStyle(color: Colors.black),
                            focusedBorder: border,
                            enabledBorder: border,
                            labelText: 'Expired Date',
                            hintText: 'XX/XX',
                          ),
                          cvvCodeDecoration: InputDecoration(
                            hintStyle: const TextStyle(color: Colors.black),
                            labelStyle: const TextStyle(color: Colors.black),
                            focusedBorder: border,
                            enabledBorder: border,
                            labelText: 'CVV',
                            hintText: 'XXX',
                          ),
                          cardHolderDecoration: InputDecoration(
                            hintStyle: const TextStyle(color: Colors.black),
                            labelStyle: const TextStyle(color: Colors.black),
                            focusedBorder: border,
                            enabledBorder: border,
                            labelText: 'Card Holder',
                          ),
                          onCreditCardModelChange: onCreditCardModelChange,
                          textStyle: const TextStyle(
                              color: Colors.black, fontSize: 12),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              'Glassmorphism',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                            Switch(
                              value: useGlassMorphism,
                              inactiveTrackColor: Colors.grey,
                              activeColor: Colors.white,
                              activeTrackColor: Colors.green,
                              onChanged: (bool value) => setState(() {
                                useGlassMorphism = value;
                              }),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              'Card Image',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                            Switch(
                              value: useBackgroundImage,
                              inactiveTrackColor: Colors.grey,
                              activeColor: Colors.white,
                              activeTrackColor: Colors.green,
                              onChanged: (bool value) => setState(() {
                                useBackgroundImage = value;
                              }),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            backgroundColor: const Color(0xff1b447b),
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(12),
                            child: const Text(
                              'Validate',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'halter',
                                fontSize: 14,
                                package: 'flutter_credit_card',
                              ),
                            ),
                          ),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              print('valid!');
                            } else {
                              print('invalid!');
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
