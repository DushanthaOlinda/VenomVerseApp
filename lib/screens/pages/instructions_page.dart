import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../home_screen.dart';



class InstructionsPage extends StatelessWidget {
  const InstructionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Welcome to VenomVerse",
          body: "Explore the fascinating world of snakes with Venomverse. Learn about different species, habitats, and safety tips.",
          image: Image.asset("assets/images/logo.png", width: 200,height: 200,),
        ),
        PageViewModel(
          title: "Swipe to Learn",
          body: "Swipe left or right to navigate through the instructional pages. Tap 'Next' to continue.",
          image: Image.asset("assets/images/swipe_icon.jpg", width: 200,height: 200,),
        ),
        PageViewModel(
          title: "Learn About Snakes",
          body: "Discover a diverse range of snake species from around the world. Tap on any snake for detailed information.",
          image: Image.asset("assets/images/snake1.png", width: 200,height: 200,),
        ),
        PageViewModel(
          title: "Snake Safety",
          body: "Stay safe in snake-prone areas. Learn how to identify venomous snakes and what to do if you encounter one.",
          image: Image.asset("assets/images/snake_safety.png", width: 200,height: 200,),
        ),
        PageViewModel(
          title: "Interactive Quizzes",
          body: "Test your knowledge with interactive quizzes. Earn badges and become a snake expert.",
          image: Image.asset("assets/images/quiz.png", width: 200,height: 200,),
        ),
        PageViewModel(
          title: "Snake Detector",
          body: "Use the snake detection feature to identify snakes in your surroundings. Tap the camera icon to get started.",
          image: Image.asset("assets/images/snake_detector.png", width: 200,height: 200,),
        ),
        PageViewModel(
          title: "Community & Resources",
          body: "Join our community, ask questions, and share your snake encounters. Access additional resources for in-depth learning.",
          image: Image.asset("assets/images/community.png", width: 200,height: 200,),
        ),
        PageViewModel(
          title: "Get Started",
          body: "You're now ready to explore the Venomverse. Tap 'Done' to begin your snake adventure!",
          image: Image.asset("assets/images/get_start.png", width: 200,height: 200,),
        ),

        // Add more pages as needed
      ],
      onDone: () {
        // Handle the "Done" button action
        // Typically, you would navigate to the home screen here.
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const MyHomePage(title: 'VenomVerse'),
          ),
        );
      },
      showSkipButton: true,
      skip: const Text("Skip"),
      done: const Text("Done"),
      next: const Icon(Icons.arrow_forward),
      dotsDecorator: DotsDecorator(
        size: const Size(5.0, 5.0),
        color: Colors.grey,
        activeColor: Colors.blue,
        activeSize: const Size(10.0, 5.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );
  }
}
