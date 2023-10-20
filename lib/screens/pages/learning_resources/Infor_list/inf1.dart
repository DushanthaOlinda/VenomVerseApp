import 'package:flutter/material.dart';

class InforPage extends StatefulWidget {
  const InforPage({Key? key}) : super(key: key);

  @override
  State<InforPage> createState() => _InforPageState();
}

class _InforPageState extends State<InforPage> {
  final List<Map<String, dynamic>> inforPage =  [
    {
      'imagePath': 'assets/images/sp1.jpeg',
      'scientificName': 'YourScientificName1',
      'englishName': 'YourEnglishName1',
      'venomous': true,
      'family': 'YourFamily1',
      'subFamily': 'YourSubFamily1',
      'genus': 'YourGenus1',
      'description': 'YourDescription1',
      'specialNote': 'YourSpecialNote1',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Serpents"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SafeArea(
            child: Column(
              children: [
                for (var infor in inforPage)
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8, // 80% of screen width
                        child: buildArticleCard(
                          context,
                          infor['imagePath'],
                          infor['scientificName'],
                          infor['englishName'],
                          infor['venomous'],
                          infor['family'],
                          infor['subFamily'],
                          infor['genus'],
                          infor['description'],
                          infor['specialNote'],
                        ),
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

Widget buildArticleCard(
  BuildContext context,
  String imagePath,
  String scientificName,
  String englishName,
  bool venomous,
  String family,
  String subFamily,
  String genus,
  String description,
  String specialNote,
){
  return Card(
    elevation: 3.0,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Scientific Name: $scientificName",
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                "English Name: $englishName",
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                "Venomous: ${venomous ? 'Yes' : 'No'}",
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                "Family: $family",
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                "Sub Family: $subFamily",
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                "Genus: $genus",
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                "Description: $description",
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                "Special Note: $specialNote",
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
}