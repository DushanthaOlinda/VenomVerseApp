import 'package:VenomVerse/screens/pages/catcher/service_requestlist.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';

class ServiceInfo extends StatefulWidget {
  const ServiceInfo({super.key});

  @override
  State<ServiceInfo> createState() => _ServiceInfoState();
}

class _ServiceInfoState extends State<ServiceInfo> {
  final List<Map<String, String>> serviceDetails = [
    {
      'name': 'සිරිපාල පෙරේරා',
      'address': '[Add Address here]',
      'contactNumber': '[Add Contact number here]',
      'serpentType': '[Add Serpent Type here]',
      'moreDetails': '[Add more details here]',
      'imageAssetKey': 'assets/images/man.jpg', // Use a key for the asset path
    },
    // Add more service details here
  ];

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
    return ScaffoldMessenger(
      key: scaffoldMessengerKey,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('සර්ප ආරක්ෂකයන්'),
          ),
          body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  //green container starts
                  Container(
                  color: Colors.green,
                  // Center the CircleAvatar and name within the green container.
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center, // Center vertically
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2), // White stroke
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5), // Shadow color
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 5), // Shadow position
                              ),
                            ],
                          ),
                          child: const CircleAvatar(
                            backgroundImage: AssetImage('assets/images/man.jpg'),
                            radius: 50.0,
                          ),
                        ),
                        const SizedBox(height: 10), // Keep the larger spacing
                        const Align(
                          alignment: Alignment.center,
                          child: Text(
                            'සිරිපාල පෙරේරා',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Detail section
                for (var details in serviceDetails)
            detailSection(
            'ලිපිනය:',
            details['address'],
          ),
          for (var details in serviceDetails)
      detailSection(
      'ඇමතුම් අංකය:',
      details['contactNumber'],
    ),
    for (var details in serviceDetails)
    detailSection(
    'සර්ප වර්ගය:',
    details['serpentType'],
    ),
    for (var details in serviceDetails)
    detailSection(
    'අමතර විස්තර:',
    details['moreDetails'],
    ),
    const Divider(color: Colors.black),

    const SizedBox(height: 30),
    for (var details in serviceDetails)
    Image.asset(
    details['imageAssetKey']!, // Use the key to fetch the asset path
    fit: BoxFit.cover,
    ),
    // Add some spacing below the scanned image
    const SizedBox(height: 20),
    // // Two buttons
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
    Material(
    // elevation: 2,
    shadowColor: Colors.black, // Add a black shadow
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(30.0),
    ),
    child: ElevatedButton(
    style: ElevatedButton.styleFrom(
    primary: Colors.green,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(30.0),
    ),
    ),
    onPressed: () {
    // Navigate to the ServiceRequests screen
    Navigator.of(context).push(
    MaterialPageRoute(
    builder: (context) => const ServiceRequests(), // Replace with the actual route or widget
    ),
    );
    // Navigate to the successfully screen
    ArtSweetAlert.show(
    context: context,
    artDialogArgs: ArtDialogArgs(
    type: ArtSweetAlertType.success,
    title: "සම්පූර්ණ කර ඇත",
    // text: "You have Successfully completed your service",
    text: "ඔබ ඔබේ සේවාව සාර්ථකව නිම කර ඇත",
    ),
    );
    },
                      child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text('සාර්ථකයි', style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                    Material(
                      // elevation: 4,
                      shadowColor: Colors.black, // Add a black shadow
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const ServiceRequests(), // Replace with the actual route or widget
                            ),
                          );
                          // navigateToRejectedAlert(); // Navigate to the RejectedAlert screen
                          ArtSweetAlert.show(
                            context: context,
                            artDialogArgs: ArtDialogArgs(
                              type: ArtSweetAlertType.danger,
                              title: "ප්‍රතික්ෂේප කළා",
                              text: "ඔබ මෙම සේවාව ලබා දීම ප්‍රතික්ෂේප කර ඇත",
                            ),
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text('අසාර්ථකයි', style: TextStyle(color: Colors.white)),
                        ),

                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget detailSection(
      String title,
      String? subtitle,
      ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF373737))),
          Text(subtitle ?? '', style: const TextStyle(fontSize: 14, color: Colors.black)),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
