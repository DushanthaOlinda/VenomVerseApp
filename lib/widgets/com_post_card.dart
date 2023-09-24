import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../screens/pages/home_page.dart';


// posts = postDetail
// comments = commentDetail

// for post in posts
// print post[name]


class PostCard extends StatefulWidget {
  const PostCard({super.key, required this.data});
  final Map data;

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/images/user image.png'),
                radius: 30,
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.data["userId"].toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                      DateTime.now().difference(DateTime.parse(widget.data["dateTime"])).toString(),
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            widget.data["description"],
            style: TextStyle(fontSize: 16),
          ),
        ),
        // Image.asset('assets/images/snake image.jpg'),
        Image.network(widget.data["media"][0]),
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
      desc:
          "We'll send you a notification to view the outcome as soon as possible",
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
