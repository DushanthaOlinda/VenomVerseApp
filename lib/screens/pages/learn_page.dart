import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:grid/Homepage.dart';

import 'catcher/catcher_request.dart';

class LearnPage extends StatefulWidget {

  const LearnPage({ Key? key }) : super(key: key);
  // const LearnPage({Key? key}) : super(key: key);

@override
   _LearnPageState createState() => _LearnPageState();
}

class _LearnPageState extends State<LearnPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Grid"),),
      body: Container(child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView(children: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>eBooksPage()));
            },
            child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.red,),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Icon(Icons.home,size: 50,color: Colors.white,),
              Text("E-Books",style: TextStyle(color: Colors.white,fontSize: 30),)
            ],),
            ),
          ),
         InkWell(
             onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ArticlesPage()));
            },
           child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.yellow,),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Icon(Icons.search,size: 50,color: Colors.white,),
              Text("Articles",style: TextStyle(color: Colors.white,fontSize: 30),)
            ],),
            ),
         ),
          InkWell(
              onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>VideoPage()));
            },
            child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.green,),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Icon(Icons.settings,size: 50,color: Colors.white,),
              Text("Video",style: TextStyle(color: Colors.white,fontSize: 30),)
            ],),
            ),
          ),
          InkWell(
              onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ResearchPage()));
            },
            child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.grey,),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Icon(Icons.book,size: 50,color: Colors.white,),
              Text("Research",style: TextStyle(color: Colors.white,fontSize: 30),)
            ],),
            ),
          ),
              InkWell(
              onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>QuizPage()));
            },
            child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.green,),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Icon(Icons.settings,size: 50,color: Colors.white,),
              Text("Quizes",style: TextStyle(color: Colors.white,fontSize: 30),)
            ],),
            ),
          ),
                    InkWell(
              onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>extraPage()));
            },
            child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.green,),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Icon(Icons.settings,size: 50,color: Colors.white,),
              Text("Extra",style: TextStyle(color: Colors.white,fontSize: 30),)
            ],),
            ),
          ),
        ],
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 10,crossAxisSpacing: 10),
        ),
      ),),
    );
  }

  void _onAlertButtonsPressed(BuildContext context) {
    Alert(
      context: context,
      type: AlertType.info,
      title: "You are getting a call",
      desc: "The user is in need of your help. Please answer this call",
      buttons: [
        DialogButton(
          onPressed: () => Navigator.pop(context),
          color: const Color.fromRGBO(0, 179, 134, 1.0),
          child: const Text(
            "Accept",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontFamily: 'Poppins'),
          ),
        ),
        DialogButton(
          onPressed: () => Navigator.pop(context),
          gradient: const LinearGradient(colors: [
            Color.fromRGBO(255, 80, 80, 1.0),
            Color.fromRGBO(200, 60, 60, 1.0),
            Color.fromRGBO(153, 40, 40, 1.0),
          ], stops: [
            0.0,
            0.5,
            1.0,
          ]),
          child: const Text(
            "Reject",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontFamily: 'Poppins'),
          ),
        )
      ],
    ).show();
  }
}