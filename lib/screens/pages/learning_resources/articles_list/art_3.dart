import 'package:flutter/material.dart';

class Article3 extends StatefulWidget {
  const Article3({super.key});

  @override
  State<Article3> createState() => _Article3State();
}

class _Article3State extends State<Article3> {
  
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
                  image: AssetImage('assets/images/snake3.JPG'),
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
                    "Venomous Wonders: A Closer Look at Sri Lanka's Poisonous Snakes",
                    style: TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Sri Lanka, an island nation abundant in biodiversity, is home to a remarkable array of venomous snakes that have intrigued scientists and enthusiasts alike. These serpents, while often feared for their potent venom, play a vital role in maintaining the ecological balance of the island's ecosystems.",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Among the prominent venomous snake species found in Sri Lanka are the Common Krait, Russell's Viper, and the Hump-nosed Viper. These species have adapted to a variety of habitats, from forests to agricultural lands, showcasing their ability to thrive in diverse environments.",
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