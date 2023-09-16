import 'package:VenomVerse/screens/pages/learning_resources/research_list/research_1.dart';
import 'package:flutter/material.dart';

class ResourcesPage extends StatefulWidget {
  const ResourcesPage({Key? key}) : super(key: key);

  @override
  State<ResourcesPage> createState() => _ResourcesPageState();
}

class _ResourcesPageState extends State<ResourcesPage> {
  final List<Map<String, dynamic>> researchPapers = [
    {
      'title': "SNAKES OF SRI LANKA",
      'description': "The second edition of my Sinhala language book ‘Snake of Sri Lanka’ was launched in June 2023. This nearly 400-page edition is co-authored with devoted herpetologists",
      'authors': "JDevendra Jadav, Rutwik Shedge, Vikas P. Meshram, Tanuj Kanchan, Raghvendra Singh Shekhawat",
      'citation': "SNAKES OF SRI LANKA. Journal of Herpetology, 45(2), 123-145.",
      'researchPage': const Research1(),
    },
    {
      'title': "SNAKES OF SRI LANKA",
      'description': "The second edition of my Sinhala language book ‘Snake of Sri Lanka’ was launched in June 2023. This nearly 400-page edition is co-authored with devoted herpetologists",
      'authors': "JDevendra Jadav, Rutwik Shedge, Vikas P. Meshram, Tanuj Kanchan, Raghvendra Singh Shekhawat",
      'citation': "SNAKES OF SRI LANKA. Journal of Herpetology, 45(2), 123-145.",
      'researchPage': const Research1(),
    },
    {
      'title': "SNAKES OF SRI LANKA",
      'description': "The second edition of my Sinhala language book ‘Snake of Sri Lanka’ was launched in June 2023. This nearly 400-page edition is co-authored with devoted herpetologists",
      'authors': "JDevendra Jadav, Rutwik Shedge, Vikas P. Meshram, Tanuj Kanchan, Raghvendra Singh Shekhawat",
      'citation': "SNAKES OF SRI LANKA. Journal of Herpetology, 45(2), 123-145.",
      'researchPage': const Research1(),
    },
    {
      'title': "SNAKES OF SRI LANKA",
      'description': "The second edition of my Sinhala language book ‘Snake of Sri Lanka’ was launched in June 2023. This nearly 400-page edition is co-authored with devoted herpetologists",
      'authors': "JDevendra Jadav, Rutwik Shedge, Vikas P. Meshram, Tanuj Kanchan, Raghvendra Singh Shekhawat",
      'citation': "SNAKES OF SRI LANKA. Journal of Herpetology, 45(2), 123-145.",
      'researchPage': const Research1(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Research Papers"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SafeArea(
            child: Column(
              children: [
                for (var paper in researchPapers)
                  buildArticleCard(
                    context,
                    paper['title'],
                    paper['description'],
                    paper['authors'],
                    paper['citation'],
                    paper['researchPage'],
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
    String title,
    String description,
    String authors,
    String citation,
    Widget researchPage,
  ) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => researchPage));
      },
      child: Card(
        elevation: 3.0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Text(
                'Authors: $authors',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              Text(
                'Citation: $citation',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Read more...",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
