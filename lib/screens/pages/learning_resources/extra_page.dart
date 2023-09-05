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
                  "naja naja",
                  "Cobra",
                  true,
                  "elapidae",
                  "naja naja",
                  "naja",
                  "Cobra is famous for its hood, which is a flap of skin that can be spread when snake feels angry or threatened. Hood can scare predators and chase them away. Most cobras can stand as tall as a third of their body length.",
                  "The world’s largest venomous snake is the king cobra, or hamadryad (Ophiophagus hannah).",
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: buildArticleCard(
                  context,
                  'assets/images/sp2.jpeg',
                  "Bungarus ceylonicus",
                  "Sri Lankan Krait",
                  false,
                  "Elapidae",
                  "Bungarus",
                  "Bungarus",
                  "The Sri Lankan krait is small and slender. On hatching, the length of the snake is about 250 mm (9.8 in). The average adult length for this species is 75 cm (29+1⁄2 in) with 90 cm (35+1⁄2 in) being the upper limit.[3] Its black skin is crossed with thin white transverse bands. It has an extraordinarily long lung which it inflates when angry.",
                  "The highly potent venom of this snake attacks the central nervous system and gradually destroys it. Death is caused when the respiratory system is suppressed. Therefore, a bite from this snake should be treated immediately, or else the victim may die within 12 hours.",
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: buildArticleCard(
                  context,
                  'assets/images/sp3.jpeg',
                  "Ahaetulla nasuta",
                  "Whip Snake",
                  true,
                  "Colubridae",
                  "Ahaetulla nasuta",
                  "Ahaetulla",
                  "Coachwhips are thin-bodied snakes with small heads and large eyes with round pupils. They vary greatly in color, but most reflect a proper camouflage for their natural habitat. M. f. testaceus is typically a shade of light brown with darker brown flecking, but in the western area of Texas, where the soil color is a shade of pink, the coachwhips are also pink in color.",
                  "Subspecies can be difficult to distinguish in areas where their ranges overlap. Adult sizes of 127–183 cm (50–72 in) in total length (including tail) are common. The record sized specimen, of the eastern coachwhip race",
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