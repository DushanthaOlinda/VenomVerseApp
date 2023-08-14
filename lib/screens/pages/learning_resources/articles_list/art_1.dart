import 'package:flutter/material.dart';

class Article1 extends StatefulWidget {
  const Article1({super.key, required article});

  @override
  State<Article1> createState() => _Article1State();
}

class _Article1State extends State<Article1> {
  bool isLiked = false;


   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: const Text("Articles"),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 5),
              width: 400,
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/snake image.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'By Will Sullivan',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Having a Companion Could Help Rattlesnakes Stay Calm',
                    style: TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'When rattlesnakes are in the presence of a companion, they’re more resilient to stress, according to new research published this month in the journal Frontiers in Ethology.',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Operating off a hunch, a team of scientists decided to monitor rattlesnakes’ heart rates as the animals underwent a stressful situation, with and without another snake nearby. They found snakes that faced stress alone experienced a greater spike in their heart rates than those that had company.",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Because snakes are solitary foragers, scientists typically consider the animals to be asocial, the study authors write. But some research has found examples of snake behaviors that appear more social, such as male snakes guarding female mates and female snakes grouping together during gestation.',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}