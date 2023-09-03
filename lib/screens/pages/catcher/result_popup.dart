import 'package:flutter/material.dart';

class ResultPopup extends StatefulWidget {
  const ResultPopup({Key? key}) : super(key: key);

  @override
  State<ResultPopup> createState() => _ResultPopupState();
}

class _ResultPopupState extends State<ResultPopup> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(10),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 550,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Colors.black,
              boxShadow: const [
                BoxShadow(color: Colors.white, spreadRadius: 1),
              ],
            ),
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/snake_image.png', width: 100, height: 200,),
                const SizedBox(height: 20),
                const Text(
                  'Predicted Answer: \n\nSeems to be a rattle snake',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 20),
                const Text('Confidence: 70%',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                    textAlign: TextAlign.center),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    // Add your logic to contact a snake catcher here
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.transparent),
                    side: MaterialStateProperty.all(const BorderSide(color: Colors.white, width: 2)),
                    shadowColor: MaterialStateProperty.all(Colors.white),
                    elevation: MaterialStateProperty.all(4),
                    minimumSize: MaterialStateProperty.all(const Size(200, 60)), // Increased button size
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Increased button radius
                    )),
                  ),
                  child: const Text('Contact Snake Catcher', style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.transparent),
                    side: MaterialStateProperty.all(const BorderSide(color: Colors.white, width: 2)),
                    shadowColor: MaterialStateProperty.all(Colors.white),
                    elevation: MaterialStateProperty.all(4),
                    minimumSize: MaterialStateProperty.all(const Size(150, 40)), // Smaller button size
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Increased button radius
                    )),
                  ),
                  child: const Text('Close', style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
