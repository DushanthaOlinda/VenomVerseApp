import 'dart:io';

import 'package:VenomVerse/models/user.dart';
import 'package:VenomVerse/screens/home_screen.dart';
import 'package:VenomVerse/screens/pages/catcher/result_popup_v2.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:camera/camera.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';

import '../../services/api.dart';
import '../pages/catcher/catcher_list.dart';

class ScanImage extends StatefulWidget {
  const ScanImage({super.key, required this.camera});

  final CameraDescription camera;
  @override
  State<ScanImage> createState() => _ScanImageState();
}

class _ScanImageState extends State<ScanImage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text('Take a picture')),
      // You must wait until the controller is initialized before displaying the
      // camera preview. Use a FutureBuilder to display a loading spinner until the
      // controller has finished initializing.
      body: Column(
        children: [
          FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                // If the Future is complete, display the preview.
                return CameraPreview(_controller);
              } else {
                // Otherwise, display a loading indicator.
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "1. Do not touch or handle any snake. \n2. Stay away from tall grass and piles of leaves when possible. \n3. Avoid climbing on rocks or piles of wood where a snake may be hiding",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        // Provide an onPressed callback.
        onPressed: () async {
          // Take the Picture in a try / catch block. If anything goes wrong,
          // catch the error.
          try {
            // Ensure that the camera is initialized.
            await _initializeControllerFuture;

            // Attempt to take a picture and get the file `image`
            // where it was saved.
            final image = await _controller.takePicture();

            if (!mounted) return;

            // If the picture was taken, display it on a new screen.
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DisplayPictureScreen(
                  // Pass the automatically generated path to
                  // the DisplayPictureScreen widget.
                  imagePath: image.path,
                ),
              ),
            );
          } catch (e) {
            // If an error occurs, log the error to the console.
            if (kDebugMode) {
              print(e);
            }
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        gapLocation: GapLocation.none,
        inactiveColor: Colors.white,
        activeColor: Colors.white,
        backgroundColor: Colors.green,
        icons: const [Icons.home, Icons.image_search, Icons.person],
        activeIndex: 1,
        onTap: (int i) async {
          print(i);
          if (i == 1) {
            try {
              final pickedFile =
                  await ImagePicker().pickImage(source: ImageSource.gallery);
              if (pickedFile != null) {}
              if (pickedFile == null) {
                // TODO: do what if photo is not selected
              } else {
                // DisplayPictureScreen(imagePath: pickedFile.path);
                if (context.mounted) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DisplayPictureScreen(
                        imagePath: pickedFile.path,
                      ),
                    ),
                  );
                }
              }
              // final image = await _controller.takePicture();
            } catch (e) {
              if (kDebugMode) {
                print(e);
              }
            }
          } else if (i == 0) {
            if (kDebugMode) {
              print("imHere");
            }
            // Navigator.pushReplacementNamed(context, '/home');
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const MyHomePage(
                  title: "VenomVerse",
                ),
              ),
            );
          } else if (i == 2) {
            if (context.mounted) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CatcherList(),
                ),
              );
            }
          }
          setState(() => {});
        },
      ),
    );
  }
}

// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text('Capture Snake')),
      body: Column(
        children: [
          Image.file(File(imagePath)),
          const SizedBox(
            height: 40,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: const SizedBox(
                    width: 100,
                    height: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.replay),
                        Text(
                          "Retake a Picture",
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                ElevatedButton(
                  child: const SizedBox(
                    width: 100,
                    height: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.send),
                        Text(
                          "Get Species name",
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  onPressed: () => _sendToScan(context),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _sendToScan(BuildContext context) async {
    EasyLoading.show(status: 'loading...');

    var result = await Api.scanSnake(File(imagePath));
    var image = File(imagePath);
    String fileName = "ScannedImages/${DateTime.timestamp()}.png";
    final storage = FirebaseStorage.instance;
    final Reference ref = storage.ref().child(fileName);

    await ref.putFile(image);
    var imageLink = await ref.getDownloadURL();
    if (kDebugMode) {
      print(imageLink);
    }
    var userName = await User.getUserName();
    if (kDebugMode) {
      print(userName);
    }
    var recId = null;
    if (result['snake_id'] != -1) {
      recId = await Api.saveScannedImage(int.parse(userName!), imageLink,
          result['snake_id'], result['confidence'], "", "");
    }

    EasyLoading.dismiss();
    if (kDebugMode) {
      print(result);
    }
    if (context.mounted) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          print(recId);
          // there are two result popups use ResultPopupV2 instead ResultPopup
          return ResultPopupV2(
            species: result['class'],
            confidence: result['confidence'],
            resultRecordId: result['snake_id'],
            imageLink : imageLink,
            savedImageId : recId['scannedImageId'],
            user: int.parse(userName!),
          );
        },
      );
    }
  }
}
