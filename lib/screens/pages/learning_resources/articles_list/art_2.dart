import 'package:flutter/material.dart';

class Article2 extends StatefulWidget {
  const Article2({super.key});

  @override
  State<Article2> createState() => _Article2State();
}

class _Article2State extends State<Article2> {
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
                  image: AssetImage('assets/images/snake2.jpg'),
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
                    'By Chaminda Jayalal',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Diverse Serpents of Sri Lanka: An Overview of Snake Specie',
                    style: TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'One prominent group is the family Colubridae, comprising non-venomous snakes like the Green Vine Snake and the Checkered Keelback. These agile creatures play a crucial role in maintaining ecological balance by controlling rodent populations.',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "The island's endemic species are particularly intriguing, like the Hump-nosed Viper and the Sri Lankan Shieldtail Snake, which have evolved in isolation. Sadly, many of these unique species face habitat degradation and human encroachment, highlighting the urgent need for conservation efforts.",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Exploring the diverse serpents of Sri Lanka allows us to delve into the intricate connections between these reptiles and their surroundings. By studying their behaviors, ecological roles, and vulnerabilities, we gain insights that contribute not only to our understanding of snake biology but also to the broader field of biodiversity conservation.',
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