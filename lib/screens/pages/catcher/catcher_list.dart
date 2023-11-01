import 'package:VenomVerse/models/auth.dart';
import 'package:VenomVerse/screens/pages/catcher/view_history.dart';
import 'package:VenomVerse/services/catcher_services_api.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stepper_list_view/stepper_list_view.dart';

import '../../../services/api.dart';

class CatcherList extends StatefulWidget {
  const CatcherList({super.key, this.reqId});
  final int? reqId;

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
              'rating': '5.0',
            }),
            avatar: 'assets/images/man.jpg',
          )).toList();

  // Function to open a URL
  void _launchURL(String url) async {
    // You can use url_launcher package here to launch the URL
  }

  // Future<List<StepperItemData>> _getCatcherList() async {
  //   var listCatcher = await CatcherServicesApi.getAllCatchers();
  //
  //   print(listCatcher.length);
  //
  //   if (kDebugMode) {
  //     print("object");
  //   }
  //
  //   List<StepperItemData> data = [];
  //
  //   if(listCatcher != null) {
  //   }
  //   return data;
  //
  // }

  // final _catcherList = _getCatcherList;

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("afobject");
    }
    var catchers = CatcherServicesApi.getAllCatchers();
    if (kDebugMode) {
      print(catchers);
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snake Catchers:'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FutureBuilder<List>(
            future: catchers,
            builder: (context, snapshot) {
              if (kDebugMode) {
                print(snapshot.data);
              }

              var cList = snapshot.data
                  ?.map((element) => StepperItemData(
                        id: element["reqCatcher"].toString(),
                        content: ({
                          'name': element["userFirstName"],
                          //+ ' ' + element["userLastName"] ?? ".",
                          'occupation': element["workingStatus"],
                          'mobileNumber': element["contactNo"],
                          'email': element["userEmail"],
                          'bor_date': element["dob"],
                          'rating': '5.0',
                        }),
                        avatar: 'assets/images/man.jpg',
                      ))
                  .toList();
              return StepperListView(
                showStepperInLast: true,
                stepperData: cList ?? _stepperData,
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
                    child: Column(
                      children: [
                        ListTile(
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
                                    child: Text(
                                        stepData.content['occupation'] ?? ''),
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
                                    child: Text(
                                        stepData.content['mobileNumber'] ?? ''),
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
                                    child:
                                        Text(stepData.content['email'] ?? ''),
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
                                    child: Icon(Icons.star),
                                  ),
                                  Expanded(
                                    flex: 7,
                                    child:
                                        Text(stepData.content['rating'] ?? ''),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            var newReqId = DateTime.now().millisecondsSinceEpoch;
                            AuthModel auth = context.read<AuthModel>();
                            if(widget.reqId == null){
                              Api.requestCatcher(newReqId, int.parse(auth.userName!), null, null, null,);
                            }
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ViewHistoryPage(
                                        catcherId: int.parse(stepData.id!), reqId: widget.reqId ?? newReqId,
                                      )),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors
                                .green, // Set the button background color to green.
                          ),
                          child: const Text(
                              'View & Request'), // Text on the button.
                        ),
                      ],
                    ),
                  );
                },
              );
            }),
      ),
    );
  }
}
