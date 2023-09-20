import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
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
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        10), // Add border radius for button
                  ),
                ),
                icon: const Icon(
                  Icons.edit,
                  color: Colors.white, // Set icon color to green
                ), // Edit icon
                label: const Text(
                  'Edit Profile',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18, // Set font color to green
                  ),
                ),
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
            Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const myPosts()), // Navigate to myPosts
                    );
                    // Handle button press
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors
                        .white, // Set the button background color to white
                    onPrimary:
                        Colors.green, // Set the button label color to green
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15), // Adjust padding for button size
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(15), // Adjust corner radius
                      side: const BorderSide(
                          color: Colors.green), // Add a green border
                    ),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Posts',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                          height:
                              5), // Add spacing between the label and the count
                      Text(
                        '5', // Replace with your count value
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )),
            const SizedBox(height: 20),
            Align(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BecomeCatcher(),
                        ),
                      );
                      // Handle button press
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors
                          .green[50], // Set the button background color to grey
                      onPrimary:
                          Colors.green, // Set the button label color to green
                      padding: const EdgeInsets.all(
                          20), // Adjust padding for button size
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10), // Add border radius for button
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/snake_catcher.png', // Replace with your image asset path
                          width: 72, // Adjust the image width as needed
                          height: 72, // Adjust the image height as needed
                        ),
                        const SizedBox(
                            height:
                                8), // Add some spacing between the image and label
                        const Text(
                          'Become a Catcher',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BecomeZoologist(),
                        ),
                      );
                      // Handle button press
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors
                          .green[50], // Set the button background color to grey
                      onPrimary:
                          Colors.green, // Set the button label color to green
                      padding: const EdgeInsets.all(
                          20), // Adjust padding for button size
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10), // Add border radius for button
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/zoologist.png', // Replace with your image asset path
                          width: 72, // Adjust the image width as needed
                          height: 72, // Adjust the image height as needed
                        ),
                        const SizedBox(
                            height:
                                8), // Add some spacing between the image and label
                        const Text(
                          'Become a Zoologist',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
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
  TextEditingController uniController = TextEditingController();

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
            // Heading: Upload Image
            const Text(
              'Upload an image to provide proof of your qualifications to become a Zoologist.',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Instructions on how to get an image
            const Text(
              'Instructions:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Instruction 1
            const Text(
              '1. Capture a clear image of your zoology degree certificate.',
              style: TextStyle(fontSize: 16),
            ),
            // Instruction 2
            const Text(
              '2. Ensure the image shows your degree, graduation year, and university clearly.',
              style: TextStyle(fontSize: 16),
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
                backgroundColor: Colors.green,
              ),
              icon: const Icon(Icons.image),
              label: const Text('Select Image'),
            ),
            const SizedBox(height: 10, width: 20),
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
                controller: uniController,
                keyboardType: TextInputType.text,
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
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15), // Adjust padding for button size
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10), // Add border radius for button
                ),
              ),
              icon: const Icon(Icons.post_add),
              label: const Text(
                'Request',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white), // Set font color to green
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<File?> _getFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
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
                          backgroundImage:
                              AssetImage('assets/images/user image.png'),
                          radius: 30,
                        ),
                        SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Kimuthu Kisal',
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              'Posted 2 hours ago',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(width: 120),
                    PopupMenuButton<int>(
                      onSelected: (item) => handleClick(item),
                      itemBuilder: (context) => [
                        const PopupMenuItem<int>(
                            value: 0, child: Text('Edit Post')),
                        const PopupMenuItem<int>(
                            value: 1, child: Text('Delete Post')),
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
                          MaterialPageRoute(
                              builder: (context) => const TestMe()),
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
      desc:
          "We'll send you a notification to view the outcome as soon as possible",
      buttons: [
        DialogButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const myPosts()), // Navigate to CardsPage
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
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const myPosts()), // Navigate to CardsPage
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
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const myPosts()), // Navigate to CardsPage
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
                  builder: (context) =>
                      const myPosts()), // Navigate to CardsPage
            ); // Perform report action
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
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EditPost()),
        );

        break;
      case 1:
        popUpDeletePost(context);
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
                backgroundColor: Colors.green,
              ),
              onPressed: () async {
                final pickedFile =
                    await ImagePicker().pickImage(source: ImageSource.gallery);

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
                hintText:
                    'A snake is a type of reptile that belongs to the suborder Serpentes. Snakes are known for their elongated, legless bodies covered in scales. They are found in various habitats worldwide, including forests, deserts, grasslands, and even bodies of water.',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
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
              Navigator.pop(
                  context); // This will navigate back to the previous screen
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
                // Heading: Upload Video
                const Text(
                  'Upload a video to provide proof of your qualifications to become a Snake Catcher.',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 40),
                // Instructions on how to get a video
                const Text(
                  'Instructions:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                // Instruction 1
                const Text(
                  '1. Capture a video that demonstrates your snake-catching skills.',
                  style: TextStyle(fontSize: 16),
                ),
                // Instruction 2
                const Text(
                  '2. Ensure the video includes the entire process, from identifying the snake to safe release.',
                  style: TextStyle(fontSize: 16),
                ),
                // Instruction 3
                const Text(
                  '3. Clearly narrate the video to explain your actions and knowledge of snake handling.',
                  style: TextStyle(fontSize: 16),
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
                    backgroundColor: Colors.green,
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
                  color: Colors.green,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        10), // Add border radius for the button
                  ), // Adjust padding as needed
                  onPressed: () async {
                    if (_selectedVideo != null) {
                      try {
                        var video =
                            await ApiVideoUploader.uploadWithUploadToken(
                                _tokenTextController.text, _selectedVideo!.path,
                                (bytesSent, totalByte) {
                          setProgress(bytesSent / totalByte);
                        });
                        if (kDebugMode) {
                          print("Video : $video");
                        }
                        if (kDebugMode) {
                          print("Title : ${video.title}");
                        }
                      } catch (e) {
                        if (kDebugMode) {
                          print("Failed to upload video: $e");
                        }
                      }
                    } else {
                      if (kDebugMode) {
                        print("No video selected.");
                      }
                    }
                  },
                  child: const Text(
                    "Request",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
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
}

class VideoPlayerWidget extends StatefulWidget {
  final String videoPath;

  const VideoPlayerWidget({Key? key, required this.videoPath})
      : super(key: key);

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

  // final TextEditingController _usernameController = TextEditingController();
  // final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _nicController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cnumController = TextEditingController();
  final TextEditingController _wstatusController = TextEditingController();

  late String _profilePictureUrl =
      'https://images.unsplash.com/photo-1598618356794-eb1720430eb4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'; // Store the profile picture URL here

  // Method to handle saving profile changes
  void _saveChanges() {
    // No Need to get email, password and username again
    // Implement the logic to save changes here
    // String username = _usernameController.text;
    // String email = _emailController.text;
    // String password = _passwordController.text;
    String nic = _nicController.text;
    String district = _districtController.text;
    String address = _addressController.text;
    String cnum = _cnumController.text;
    String wstatus = _wstatusController.text;

    // I created storage to store email and password

    DateTime? dateOfBirth;

    try {
      // Parse the date string from the controller and create a DateTime object
      dateOfBirth = DateTime.parse(_dobController.text);
    } catch (e) {
      // Handle parsing errors if the input is not a valid date
      if (kDebugMode) {
        print("Error parsing date of birth: $e");
      }
      dateOfBirth = null; // Set to null or another default value
    }
    String profilePictureUrl = _profilePictureUrl;

    Navigator.pop(context);
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
        leading: const Icon(Icons.check),
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
            // const SizedBox(height: 16.0),
            // Username
            // TextField(
            //   controller: _usernameController,
            //   decoration: const InputDecoration(
            //     labelText: 'Username',
            //   ),
            // ),
            // const SizedBox(height: 16.0),
            // // Email Address
            // TextField(
            //   controller: _emailController,
            //   decoration: const InputDecoration(
            //     labelText: 'Email Address',
            //   ),
            //   keyboardType: TextInputType.emailAddress,
            // ),
            // const SizedBox(height: 16.0),
            // // Password
            // TextField(
            //   controller: _passwordController,
            //   decoration: const InputDecoration(
            //     labelText: 'Password',
            //   ),
            //   obscureText: true,
            // ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _dobController,
              decoration: const InputDecoration(
                labelText: 'Date of birth',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _nicController,
              decoration: const InputDecoration(
                labelText: 'NIC',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _districtController,
              decoration: const InputDecoration(
                labelText: 'District',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _addressController,
              decoration: const InputDecoration(
                labelText: 'Address',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _cnumController,
              decoration: const InputDecoration(
                labelText: 'Contact Number',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _wstatusController,
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
  const CardsPage({super.key});

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
                              'Glass morphism',
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
                              if (kDebugMode) {
                                print('valid!');
                              }
                            } else {
                              if (kDebugMode) {
                                print('invalid!');
                              }
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
