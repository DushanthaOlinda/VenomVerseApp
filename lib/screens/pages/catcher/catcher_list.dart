import 'package:flutter/material.dart';
import 'package:stepper_list_view/stepper_list_view.dart';

class CatcherList extends StatefulWidget {
  const CatcherList({super.key});

  @override
  State<CatcherList> createState() => _CatcherListState();
}

class _CatcherListState extends State<CatcherList> {
  final _stepperData = List.generate(
      10,
          (index) => StepperItemData(
        id: '$index',
        content: ({
          'name': 'Subhash Chandra Shukla',
          'occupation': '297 K B Christie Perera Mawatha, 13',
          'mobileNumber': '7318459902',
          'email': 'subhashchandras7318@gmail.com',
          'born_date': '12\nAug',
        }),
        avatar: 'assets/images/man.jpg',
      )
  ).toList();

  // Function to open a URL
  void _launchURL(String url) async {
    // You can use url_launcher package here to launch the URL
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snake Catchers:'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: StepperListView(
          showStepperInLast: true,
          stepperData: _stepperData,
          stepAvatar: (_, data) {
            final stepData = data as StepperItemData;
            return PreferredSize(
              preferredSize: const Size.fromRadius(20),
              child: CircleAvatar(
                backgroundImage: AssetImage(
                  stepData.avatar!,
                ),
              ),
            );
          },


          stepContentWidget: (_, data) {
            final stepData = data as StepperItemData;
            return Container(
              margin: const EdgeInsets.only(
                top: 20,
              ),
              padding: const EdgeInsets.all(
                15,
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(7),
                visualDensity: const VisualDensity(
                  vertical: -4,
                  horizontal: -4,
                ),
                title: Text(stepData.content['name'] ?? ''),
                subtitle: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Expanded(
                          flex: 3,
                          child: Icon(Icons.work),
                        ),
                        Expanded(
                          flex: 7,
                          child: Text(stepData.content['occupation'] ?? ''),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Expanded(
                          flex: 3,
                          child: Icon(Icons.phone),
                        ),
                        Expanded(
                          flex: 7,
                          child: Text(stepData.content['mobileNumber'] ?? ''),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Expanded(
                          flex: 3,
                          child: Icon(Icons.email),
                        ),
                        Expanded(
                          flex: 7,
                          child: Text(stepData.content['email'] ?? ''),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}