import 'package:flutter/material.dart';

class Research1 extends StatefulWidget {
  const Research1({super.key});

  @override
  State<Research1> createState() => _Research1State();
}

class _Research1State extends State<Research1> {
  bool isLiked = false;

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text("Research Papers"),
    ),
    backgroundColor: Colors.white,
    body: const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Snake venom – An unconventional recreational substance for psychonauts',
              style: TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Text(
              'Authors: JDevendra Jadav, Rutwik Shedge, Vikas P. Meshram, Tanuj Kanchan, Raghvendra Singh Shekhawat \nDate: 20th Jan 2022',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            Divider(),
            Text(
              'Abstract:',
              style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Text(
              'Psychoactive substances have been used by humankind for recreational purposes since time immemorial. The psychoactive properties of these substances are known to alter the consciousness, mood, and perception of people taking them. While the use of alcohol, opioids, and cannabinoids for recreational purposes has been researched thoroughly, cases of using psychoactive fauna or animal body parts for getting a ‘high’ are seldom reported. One such psychoactive substance used in India is snake venom. Snake venom has been reported to cause mood alteration, nociception, lethargy, and blurring of vision, and hence requires a careful review to delve into whether the recreational effects felt by the users can be attributed to constituents of snake venom or are solely due to self-induced effects.',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            Divider(),
            Text(
              'Introduction:',
              style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Text(
              'Psychoactive elements are substances that revise the operative capability of the brain, causing alteration in mood, perception, and consciousness by principally acting upon the central nervous system. Depending on the nature of psychoactive substances, they produce either a modest type of psychological effects such as euphoria, anxiolysis, dissociation, emotional blunting, etc. or more unusual effects such as hallucination, synaesthesia, altered space-time continuum, and mystical experience. Psychoactive substances which cause such unusual effects are either hallucinogens or psychedelics. Some of the most commonly used hallucinogens/psychedelics are mushrooms, cannabis, mescaline, lysergic acid diethylamide (LSD), dimethyltryptamine (DMT), methylenedioxymethamphetamine (MDMA), etc.1',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            Divider(),
            Text(
              'Methods:',
              style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Text(
              'The effects such as nociception, blurring of vision, lethargy, mood elevation, and temporary muscular paralysis produced by the venom of snakes of the family Elapidae (cobras, kraits, coral snakes etc.) and subfamily Hyrdophiinae (sea snakes) can mesmerise the psychonauts and encourage them to use it as a substance of abuse.20 The usual mode of introducing the snake venom into the body is getting a bite from a venomous snake, usually a neurotoxic one.',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            Divider(),
            Text(
              'Conclusion:',
              style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Text(
              'In all the reported cases of snake venom abuse, the most common motive was to get high, and the most common abused snake species was found to be Cobra. The most common symptoms reported are feeling of well-being and deep sleep. However, the identification of the snake used for getting high was not confirmed except in one case. On the whole, Snake venom intoxication is relatively common in India, although less reported in the medical literature.20,25',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            Divider(),
          ],
        ),
      ),
    ),
  );
}
}