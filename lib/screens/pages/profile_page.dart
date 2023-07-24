import 'package:flutter/material.dart';
import 'package:profile/profile.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:group_list_view/group_list_view.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topLeft,
            ),
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'Profile',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CardsPage()), // Navigate to CardsPage
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow[700], // Set the button color to yellow
                ),
                child: const Text('Card Details'),
              ),
            ),

            Profile(
              imageUrl:
              "https://images.unsplash.com/photo-1598618356794-eb1720430eb4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",

              name: "Oshadhi Dilthara",
              website: "",
              designation: 'No, 22, Galle rd, Matara',
              email: 'oshadhi@gmail.com',
              phone_number: '0175773607',
            ),

            const SizedBox(height: 20), // Add some spacing between the details
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditProfile()), // Navigate to CardsPage
                  );
                  // Handle button press
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow[700], // Set the button color to yellow
                ),
                child: const Text('Edit Profile'),
              ),
            ),
            const SizedBox(height: 50),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle button press
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow[700], // Set the button color to yellow
                    ),
                    child: const Text('Become a Catcher'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle button press
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow[700], // Set the button color to yellow
                    ),
                    child: const Text('Become a Zoologist'),
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




class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final String _profilePictureUrl = ''; // Store the profile picture URL here

  // Method to handle saving profile changes
  void _saveChanges() {
    // Implement the logic to save changes here
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    String profilePictureUrl = _profilePictureUrl;

    // Perform saving operations (e.g., update database, send API requests)
    // ...

    // Optionally, show a success message or navigate back to the previous screen
    // ...
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[50],
      appBar: AppBar(
        title: const Text('Edit Profile Details'),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          children: [
            const SizedBox(height: 16.0),
            // Profile Picture
            const CircleAvatar(
              radius: 60.0,



            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Implement the logic to change profile picture here
                // You can use image picker packages to choose an image from the gallery or camera
                // For simplicity, we'll assume the URL of the new profile picture is stored in _profilePictureUrl
                // _profilePictureUrl = ... (update the URL here)
                setState(() {});
              },
              child: const Text('Change Profile Picture'),
            ),
            const SizedBox(height: 16.0),
            // Username
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 16.0),
            // Email Address
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email Address',
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16.0),
            // Password
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _saveChanges,
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}


class CardsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[50],
      appBar: AppBar(
        title: const Text('Card Details'),
      ),
      body: const Center(
        child: Column(
          children: [
            Card(
              child: ListTile(
                title: Text('Card 1'),
                subtitle: Text('Card 1 Subtitle'),
                leading: Icon(Icons.credit_card),
                trailing: Text('Card 1 Number'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Card 2'),
                subtitle: Text('Card 2 Subtitle'),
                leading: Icon(Icons.credit_card),
                trailing: Text('Card 2 Number'),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNewCard()), // Navigate to CardsPage
          );
          // Handle the onPressed event for the "Add New Card" button
          // Perform the desired action here, such as opening a new screen or dialog
          // to add a new card.
          // Example:
          // Navigator.push(context, MaterialPageRoute(builder: (context) => AddCardPage()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class AddNewCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[50],
      appBar: AppBar(
        title: const Text('Add New Card'),
      ),
      body: const Center(
        child: Text('Add New Card Page'),
      ),
    );
  }
}






