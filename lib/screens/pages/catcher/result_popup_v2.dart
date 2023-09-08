
import 'package:VenomVerse/screens/pages/catcher/catcher_list.dart';
import 'package:VenomVerse/screens/pages/catcher/result_popup.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';


class ResultPopupV2 extends StatefulWidget {
  const ResultPopupV2({Key? key, required this.species, required this.confidence})
      : super(key: key);

  final String species;
  final double confidence;
  @override
  State<ResultPopupV2> createState() => _ResultPopupV2State();
}

class _ResultPopupV2State extends State<ResultPopupV2> {
  String image = 'assets/images/snake_image.png';

  @override
  Widget build(BuildContext context) {


    switch (widget.species) {
      case 'Cobra' : // Enter this block if mark == 0
        image = "assets/images/sp1.jpeg" ;
        break;
      case 'Sri Lankan Krait':
        image = "assets/images/sp2.jpeg" ;
        break;
      case 'Whip snakes':
        image = "assets/images/sp3.jpeg" ;
        break;
      default :
        image = "assets/images/snake_image.png" ;
    }


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
                Image.asset(image, width: 100, height: 200,),
                const SizedBox(height: 20),
                Text(
                  'Predicted Answer: \n\nSeems to be a ${widget.species}!',
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 20),
                Text('Confidence: ${widget.confidence}%',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                    textAlign: TextAlign.center),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    // Add your logic to contact a snake catcher here

                    if (context.mounted) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const PendingCatcherRequest(),
                        ),
                      );
                    }
                    
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