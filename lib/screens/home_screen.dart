import 'package:VenomVerse/widgets/generate_body.dart';
import 'package:app_bar_with_search_switch/app_bar_with_search_switch.dart';
import 'package:flutter/material.dart';
// import '../widgets/generate_body.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String get role => "TestUser";
  String page = "Home";
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    // BottomNavBar navBar = BottomNavBar(context, role: 'Role',);

    return Scaffold(
      appBar: AppBarWithSearchSwitch(
        onChanged: (text) {
          // update you provider here
          // searchText.value = text;
        }, // onSubmitted: (text) => searchText.value = text,
        appBarBuilder: (context) {
          return AppBar(
            leading: const Image(
              image: AssetImage('assets/images/logo.png'),

            ),
            title:  Text(widget.title),

            actions: const [
              AppBarSearchButton(),
              // or
              // IconButton(onPressed: AppBarWithSearchSwitch.of(context)?startSearch, icon: Icon(Icons.search)),
            ],
          );
        },
      ),
      // search in body by any way you want, example:



      // body: pages[page],
      // body: Center(
      //   // Center is a layout widget. It takes a single child and positions it
      //   // in the middle of the parent.
      //   child: Column(
      //     // Column is also a layout widget. It takes a list of children and
      //     // arranges them vertically. By default, it sizes itself to fit its
      //     // children horizontally, and tries to be as tall as its parent.
      //     //
      //     // Invoke "debug painting" (press "p" in the console, choose the
      //     // "Toggle Debug Paint" action from the Flutter Inspector in Android
      //     // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
      //     // to see the wireframe for each widget.
      //     //
      //     // Column has various properties to control how it sizes itself and
      //     // how it positions its children. Here we use mainAxisAlignment to
      //     // center the children vertically; the main axis here is the vertical
      //     // axis because Columns are vertical (the cross axis would be
      //     // horizontal).
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       const Text(
      //         'You have pushed the button this many times:',
      //       ),
      //       Text(
      //         '$_counter',
      //         style: Theme.of(context).textTheme.headlineMedium,
      //       ),
      //     ],
      //   ),
      // ),
      body: const GenerateBody(
        role: 'role',

      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
