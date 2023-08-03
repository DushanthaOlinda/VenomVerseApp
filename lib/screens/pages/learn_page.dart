import 'package:flutter/material.dart';
import 'package:horizontal_card_pager/horizontal_card_pager.dart';
import 'package:horizontal_card_pager/card_item.dart';

class LearnPage extends StatefulWidget {

  const LearnPage({super.key});


  @override
  State<LearnPage> createState() => _LearnPageState();
}

class _LearnPageState extends State<LearnPage> {

  @override
  Widget build(BuildContext context) {
    List<CardItem> items = [
      IconTitleCardItem(
        text: "E-Books",
        iconData: Icons.book,
        selectedBgColor: Colors.green,
      ),
      IconTitleCardItem(

        text: "Articles",
        iconData: Icons.article,
        selectedBgColor: Colors.green,
      ),
      IconTitleCardItem(
        text: "Videos",
        iconData: Icons.video_label,
        selectedBgColor: Colors.green,
      ),
      IconTitleCardItem(
        text: "Quizes",
        iconData: Icons.quiz,
        selectedBgColor: Colors.green,
      ),
      IconTitleCardItem(
        text: "Researches",
        iconData: Icons.book_online,
        selectedBgColor: Colors.green,
      ),
    ];
    return MaterialApp(

      home: Scaffold(
          backgroundColor: Colors.red [50],
          body: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Learning Materials',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SafeArea(

                minimum: const EdgeInsets.all(20),
                child: HorizontalCardPager(
                    onPageChanged: (page) => print("page : $page"),
                    onSelectedItem: (page) => print("selected : $page"),
                    items: items,
                ),
              ),

            Container(
              color: Colors.white,

              height: 450,
              width: 400,


            )
            ],

          )),

    );
  }



}
