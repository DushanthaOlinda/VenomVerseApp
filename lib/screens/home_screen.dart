import 'package:VenomVerse/widgets/generate_body.dart';
import 'package:app_bar_with_search_switch/app_bar_with_search_switch.dart';
import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';
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

        return  Scaffold(
          drawer: SidebarX(
            controller: SidebarXController(selectedIndex: 0, extended: true),
            items: const [
              SidebarXItem(icon: Icons.home, label: 'Home'),
              SidebarXItem(icon: Icons.search, label: 'Search'),
            ],
          ),
            appBar: AppBarWithSearchSwitch(
                onChanged: (text) {
                    // update you provider here
                    // searchText.value = text;
                }, // onSubmitted: (text) => searchText.value = text,
                appBarBuilder: (context) {
                    return AppBar(
                        title: Text(widget.title),

                        actions: const [
                            AppBarSearchButton(),
        // or
        // IconButton(onPressed: AppBarWithSearchSwitch.of(context)?startSearch, icon: Icon(Icons.search)),
                        ],

                    );
                },
            ),

    // search in body by any way you want, example:



            body: const GenerateBody(
                role: 'role',

            ),

            // This trailing comma makes auto-formatting nicer for build methods.
        );




  }
}







