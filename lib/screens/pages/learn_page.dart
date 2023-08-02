import 'package:flutter/material.dart';
import 'package:grid/Homepage.dart';

class LearnPage extends StatefulWidget {

  const LearnPage({ Key? key }) : super(key: key);

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
}