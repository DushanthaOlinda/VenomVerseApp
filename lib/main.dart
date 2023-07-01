import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),



  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        leading: Image.asset('assets/LOGO Round 8.png'),
      ),




      body: Container(
        color: Colors.red[50], // Set the background color to red
        child: Center(
          child: Text(
            'Hello!',
            style: TextStyle(
              fontSize: 50.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              color: Colors.grey[600],
              fontFamily: 'Poppins',
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green[900],
        child: Text('Click'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green[900], // Set the bottom navigation bar color to green
        type: BottomNavigationBarType.fixed, // Allow more than three items
        currentIndex: currentIndex,
        onTap: onTabTapped,
        selectedItemColor: Colors.yellow[700],

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),


            label: 'Home',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 48.0,
              height: 48.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 2.0,
                ),

              ),
              child: IconButton(
                icon: Icon(Icons.camera_alt),
                onPressed: () {
                  // Handle camera icon pressed
                },
              ),
            ),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Learn',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),

        ],
      ),
    );
  }
}
