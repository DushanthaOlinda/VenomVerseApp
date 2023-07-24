
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[50],
      body: Center(
        child: Card(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Posted 2 hours ago',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                child: const Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/user image.png'),
                      radius: 30,
                    ),
                    SizedBox(width: 16),
                    Text(
                      'Kimutu Kisal',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'A snake is a type of reptile that belongs to the suborder Serpentes. Snakes are known for their elongated, legless bodies covered in scales. They are found in various habitats worldwide, including forests, deserts, grasslands, and even bodies of water.',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Image.asset('assets/images/snake image.jpg'),
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

                        // Perform comment action
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.report,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        // Perform report action
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}








