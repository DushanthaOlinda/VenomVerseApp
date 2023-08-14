import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_credit_card_new/credit_card_brand.dart';
import 'package:flutter_credit_card_new/flutter_credit_card.dart';
import 'package:image_picker/image_picker.dart';
import 'package:profile/profile.dart';
import 'package:video_uploader/video_uploader.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[50],
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
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EditProfile()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow[700],
                ),
                icon: const Icon(Icons.edit), // Edit icon
                label: const Text('Edit Profile'),
              ),
            ),
            Profile(
              //profile data
              imageUrl:
                  "https://images.unsplash.com/photo-1598618356794-eb1720430eb4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",

              name: "Oshadhi Dilthara",
              website: "",
              designation: 'No, 22, Galle rd, Matara',
              email: 'oshadhi@gmail.com',
              phone_number: '0175773607',
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            CardsPage()), // Navigate to CardsPage
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.yellow[700], // Set the button color to yellow
                ),
                child: const Text('Payments'),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const BecomeCatcher()), // Navigate to CardsPage
                      );
                      // Handle button press
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.yellow[700], // Set the button color to yellow
                    ),
                    child: const Text('Become a Catcher'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle button press
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.yellow[700], // Set the button color to yellow
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

const primaryColor = Colors.green;
const secondaryColor = Colors.green;

class BecomeCatcher extends StatefulWidget {
  const BecomeCatcher({super.key});

  @override
  _BecomeCatcherState createState() => _BecomeCatcherState();
}

class _BecomeCatcherState extends State<BecomeCatcher> {
  late String _imagePath;
  final _tokenTextController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  double _progressValue = 0;

  void setProgress(double value) async {
    setState(() {
      _progressValue = value;
    });
  }

  @override
  void dispose() {
    _tokenTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: primaryColor,
        ),
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: primaryColor,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(
                    context); // This will navigate back to the previous screen
              },
            ),
            title: const Text('Become a Catcher'),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 52,
                  ),
                  TextField(
                    cursorColor: primaryColor,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor, width: 2.0),
                      ),
                      hintText: 'My video token',
                    ),
                    controller: _tokenTextController,
                  ),
                  MaterialButton(
                    color: primaryColor,
                    child: const Text(
                      "Pick Video from Gallery",
                      style: TextStyle(
                          color: Colors.white70, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () async {
                      var source = ImageSource.gallery;
                      XFile? image = await _picker.pickVideo(source: source);
                      if (image != null) {
                        setState(() {
                          try {
                            _imagePath = image.path;
                          } catch (e) {
                            log("Failed to get video: $e");
                          }
                        });
                      }
                    },
                  ),
                  MaterialButton(
                    color: primaryColor,
                    child: const Text(
                      "Upload video",
                      style: TextStyle(
                          color: Colors.white70, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () async {
                      try {
                        var video =
                            await ApiVideoUploader.uploadWithUploadToken(
                                _tokenTextController.text, _imagePath,
                                (bytesSent, totalByte) {
                          log("Progress : ${bytesSent / totalByte}");
                          setProgress(bytesSent / totalByte);
                        });
                        log("Video : $video");
                        log("Title : ${video.title}");
                      } catch (e) {
                        log("Failed to upload video: $e");
                      }
                    },
                  ),
                  LinearProgressIndicator(
                    color: primaryColor,
                    backgroundColor: secondaryColor,
                    value: _progressValue,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  void _changeProfilePicture() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profilePictureUrl = pickedFile.path;
      });
    }
  }

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late String _profilePictureUrl =
      'https://images.unsplash.com/photo-1598618356794-eb1720430eb4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'; // Store the profile picture URL here

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
            CircleAvatar(
              radius: 60.0,
              backgroundImage: NetworkImage(_profilePictureUrl),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _changeProfilePicture,
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
            MaterialPageRoute(
                builder: (context) =>
                    const AddNewCard()), // Navigate to CardsPage
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

class AddNewCard extends StatefulWidget {
  const AddNewCard({super.key});

  @override
  State<StatefulWidget> createState() {
    return AddNewCardState();
  }
}

class AddNewCardState extends State<AddNewCard> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.7),
        width: 2.0,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Credit Card View Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Colors.red[50],
        appBar: AppBar(
          title: const Text('Add New Card'),
          backgroundColor: Colors.green,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(
                  context); // This will navigate back to the previous screen
            },
          ),
        ),
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(
            image: !useBackgroundImage
                ? const DecorationImage(
                    image: ExactAssetImage('assets/bg.png'),
                    fit: BoxFit.fill,
                  )
                : null,
          ),
          child: SafeArea(
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 30,
                ),
                CreditCardWidget(
                  glassmorphismConfig:
                      useGlassMorphism ? Glassmorphism.defaultConfig() : null,
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  showBackView: isCvvFocused,
                  obscureCardNumber: true,
                  obscureCardCvv: true,
                  isHolderNameVisible: true,
                  cardBgColor: Colors.red,
                  backgroundImage:
                      useBackgroundImage ? 'assets/images/card_bg.jpg' : null,
                  isSwipeGestureEnabled: true,
                  onCreditCardWidgetChange:
                      (CreditCardBrand creditCardBrand) {},
                  customCardTypeIcons: <CustomCardTypeIcon>[
                    CustomCardTypeIcon(
                      cardType: CardType.mastercard,
                      cardImage: Image.asset(
                        'assets/images/mastercard.png',
                        height: 48,
                        width: 48,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        CreditCardForm(
                          formKey: formKey,
                          obscureCvv: true,
                          obscureNumber: true,
                          cardNumber: cardNumber,
                          cvvCode: cvvCode,
                          isHolderNameVisible: true,
                          isCardNumberVisible: true,
                          isExpiryDateVisible: true,
                          cardHolderName: cardHolderName,
                          expiryDate: expiryDate,
                          themeColor: Colors.blue,
                          cardNumberDecoration: InputDecoration(
                            labelText: 'Number',
                            hintText: 'XXXX XXXX XXXX XXXX',
                            hintStyle: const TextStyle(color: Colors.black),
                            labelStyle: const TextStyle(color: Colors.black),
                            focusedBorder: border,
                            enabledBorder: border,
                          ),
                          expiryDateDecoration: InputDecoration(
                            hintStyle: const TextStyle(color: Colors.black),
                            labelStyle: const TextStyle(color: Colors.black),
                            focusedBorder: border,
                            enabledBorder: border,
                            labelText: 'Expired Date',
                            hintText: 'XX/XX',
                          ),
                          cvvCodeDecoration: InputDecoration(
                            hintStyle: const TextStyle(color: Colors.black),
                            labelStyle: const TextStyle(color: Colors.black),
                            focusedBorder: border,
                            enabledBorder: border,
                            labelText: 'CVV',
                            hintText: 'XXX',
                          ),
                          cardHolderDecoration: InputDecoration(
                            hintStyle: const TextStyle(color: Colors.black),
                            labelStyle: const TextStyle(color: Colors.black),
                            focusedBorder: border,
                            enabledBorder: border,
                            labelText: 'Card Holder',
                          ),
                          onCreditCardModelChange: onCreditCardModelChange,
                          textStyle: const TextStyle(
                              color: Colors.black, fontSize: 12),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              'Glassmorphism',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                            Switch(
                              value: useGlassMorphism,
                              inactiveTrackColor: Colors.grey,
                              activeColor: Colors.white,
                              activeTrackColor: Colors.green,
                              onChanged: (bool value) => setState(() {
                                useGlassMorphism = value;
                              }),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              'Card Image',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                            Switch(
                              value: useBackgroundImage,
                              inactiveTrackColor: Colors.grey,
                              activeColor: Colors.white,
                              activeTrackColor: Colors.green,
                              onChanged: (bool value) => setState(() {
                                useBackgroundImage = value;
                              }),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            backgroundColor: const Color(0xff1b447b),
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(12),
                            child: const Text(
                              'Validate',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'halter',
                                fontSize: 14,
                                package: 'flutter_credit_card',
                              ),
                            ),
                          ),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              print('valid!');
                            } else {
                              print('invalid!');
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
