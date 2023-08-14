import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

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
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: buildArticleCard(
                  context,
                  'assets/images/sp1.jpeg',
                  "YourScientificName1",
                  "YourEnglishName1",
                  true,
                  "YourFamily1",
                  "YourSubFamily1",
                  "YourGenus1",
                  "YourDescription1",
                  "YourSpecialNote1",
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: buildArticleCard(
                  context,
                  'assets/images/sp2.jpeg',
                  "YourScientificName2",
                  "YourEnglishName2",
                  false,
                  "YourFamily2",
                  "YourSubFamily2",
                  "YourGenus2",
                  "YourDescription2",
                  "YourSpecialNote2",
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: buildArticleCard(
                  context,
                  'assets/images/sp3.jpeg',
                  "YourScientificName3",
                  "YourEnglishName3",
                  true,
                  "YourFamily3",
                  "YourSubFamily3",
                  "YourGenus3",
                  "YourDescription3",
                  "YourSpecialNote3",
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