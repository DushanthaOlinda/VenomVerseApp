import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class RequestForm extends StatefulWidget {
  const RequestForm({Key? key}) : super(key: key);

  @override
  State<RequestForm> createState() => _RequestFormState();
}

class _RequestFormState extends State<RequestForm> {
  VideoPlayerController? _controller;
  List<VideoPlayerController> _controllers = [];
  String currentVideo = '';
  List<String> videos = [
    'assets/videos/video.mp4',
    'assets/videos/video1.mp4',
    'assets/videos/video2.mp4',
  ];

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  // Initialize video controllers
  void _initializeControllers() async {
    _controllers = await Future.wait(
      videos.map((e) async {
        final controller = VideoPlayerController.asset(e);
        await controller.initialize();
        return controller;
      }),
    );
    setState(() {
      // Initialize the first video
      _controller = _controllers.first;
    });
  }

  void onTapVideo(int index) {
    if (_controller != null) {
      _controller!.pause();
    }
    setState(() {
      _controller = _controllers[index];
      _controller!.play();
    });
  }
// Function to navigate to the ApprovedAlert screen
//   void navigateToApprovedAlert() {
//     Navigator.of(context).push(MaterialPageRoute(
//       builder: (context) => ApprovedAlert(key: UniqueKey()),
//     ));
//   }
//
//   // Function to navigate to the RejectedAlert screen
//   void navigateToRejectedAlert() {
//     Navigator.of(context).push(MaterialPageRoute(
//       builder: (context) => const RejectedAlert(),
//     ));
//   }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
    return ScaffoldMessenger(
      key: scaffoldMessengerKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Request Details:'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //green container starts
                Container(
                  color: Colors.green,
                  // Center the CircleAvatar and name within the green container.
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center, // Center vertically
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2), // White stroke
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5), // Shadow color
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 5), // Shadow position
                              ),
                            ],
                          ),
                          child: const CircleAvatar(
                            backgroundImage: AssetImage('assets/images/man.jpg'),
                            radius: 50.0,
                          ),
                        ),
                        const SizedBox(height: 10), // Keep the larger spacing
                        const Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Name: Siripala Perera',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Detail section
                detailSection('Age:', '[Add age here]'),
                detailSection('Details:', '[Add details here]'),
                detailSection('Qualifications:', '[Add qualifications here]'),
                const Divider(color: Colors.black),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _controllers.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (context, int i) {
                    return GestureDetector(
                      onTap: () => onTapVideo(i),
                      child: Card(
                        child: AspectRatio(
                          aspectRatio: _controllers[i].value.size.aspectRatio,
                          child: VideoPlayer(_controllers[i]),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 30),
                _controller != null && _controller!.value.isInitialized
                    ? AspectRatio(
                  aspectRatio: _controller!.value.aspectRatio,
                  child: VideoPlayer(_controller!),
                )
                    : Container(),
                // Add some spacing below the video player
                const SizedBox(height: 20),
                // Two buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  Material(
                  // elevation: 2,
                  shadowColor: Colors.black, // Add a black shadow
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    onPressed: () {
                      // navigateToApprovedAlert(); // Navigate to the ApprovedAlert screen
                      ArtSweetAlert.show(
                        context: context,
                        artDialogArgs: ArtDialogArgs(
                          type: ArtSweetAlertType.success,
                          title: "Approved",
                          text: "You have Successfully Approved this person as a snake catcher",
                        ),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text('Approve', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),

            Material(
                      // elevation: 4,
                      shadowColor: Colors.black, // Add a black shadow
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        onPressed: () {
                          // navigateToRejectedAlert(); // Navigate to the RejectedAlert screen
                          ArtSweetAlert.show(
                              context: context,
                              artDialogArgs: ArtDialogArgs(
                                  type: ArtSweetAlertType.danger,
                                  title: "Rejected",
                                  text: "You have rejected this person"
                              )
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text('Reject', style: TextStyle(color: Colors.white)),
                        ),
                      ),
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

  Widget detailSection(
      String title,
      String? subtitle,
      ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF373737))),
          Text(subtitle ?? '', style: const TextStyle(fontSize: 14, color: Colors.black)),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controllers.forEach((controller) {
      controller.dispose();
    });
  }
}
