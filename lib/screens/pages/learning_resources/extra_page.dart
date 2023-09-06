import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

final List<Map<String, dynamic>> articles =  [
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
    {
      'imagePath': 'assets/images/sp2.jpeg',
      'scientificName': 'YourScientificName2',
      'englishName': 'YourEnglishName2',
      'venomous': false,
      'family': 'YourFamily2',
      'subFamily': 'YourSubFamily2',
      'genus': 'YourGenus2',
      'description': 'YourDescription2',
      'specialNote': 'YourSpecialNote2',
    },
    {
      'imagePath': 'assets/images/sp3.jpeg',
      'scientificName': 'YourScientificName3',
      'englishName': 'YourEnglishName3',
      'venomous': true,
      'family': 'YourFamily3',
      'subFamily': 'YourSubFamily3',
      'genus': 'YourGenus3',
      'description': 'YourDescription3',
      'specialNote': 'YourSpecialNote3',
    },
];

class _InfoPageState extends State<InfoPage> {
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
              for (var article in articles)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: buildArticleCard(
                      context,
                      article['imagePath'],
                      article['scientificName'],
                      article['englishName'],
                      article['venomous'],
                      article['family'],
                      article['subFamily'],
                      article['genus'],
                      article['description'],
                      article['specialNote'],
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
) {
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