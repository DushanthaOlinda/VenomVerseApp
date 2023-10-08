import 'package:VenomVerse/models/user.dart';
import 'package:VenomVerse/screens/pages/catcher/requests_list.dart';
import 'package:VenomVerse/screens/pages/feedback_page.dart';
import 'package:VenomVerse/screens/pages/instructions_page.dart';
import 'package:VenomVerse/screens/pages/profile_page.dart';
import 'package:VenomVerse/widgets/generate_body.dart';
import 'package:app_bar_with_search_switch/app_bar_with_search_switch.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sidebarx/sidebarx.dart';

import '../models/auth.dart';
import '../services/api_user_control.dart';
// import '../widgets/generate_body.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  String get role => "TestUser";
  String page = "Home";
  late AuthModel auth;


  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthModel>();

    if (auth.isAuthorized == false) {
      const AlertDialog(
        content: Text("data"),
      );
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // Navigator.pushReplacementNamed(context, '/YourRoute');
        Navigator.pushReplacementNamed(context, '/login');
      });
      return const Text("Pls login");
    }else {
      checkUser(auth.userName!);
    }
    return Scaffold(
      appBar: AppBarWithSearchSwitch(
        onChanged: (text) {
          // update your provider here
          // searchText.value = text;
        },
        appBarBuilder: (context) {
          return AppBar(
            title: Text(widget.title),
            actions: const [
              AppBarSearchButton(),
            ],
          );
        },
      ),
      body: GenerateBody(
        role: 'role',
        userId: int.parse(auth.userName!),
      ),
      drawer: SidebarX(
        controller: _controller,
        theme: SidebarXTheme(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: canvasColor,
            borderRadius: BorderRadius.circular(20),
          ),
          hoverColor: scaffoldBackgroundColor,
          textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
          selectedTextStyle: const TextStyle(color: Colors.white),
          itemTextPadding: const EdgeInsets.only(left: 30),
          selectedItemTextPadding: const EdgeInsets.only(left: 30),
          itemDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: canvasColor),
          ),
          selectedItemDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: actionColor.withOpacity(0.37),
            ),
            gradient: const LinearGradient(
              colors: [accentCanvasColor, canvasColor],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.28),
                blurRadius: 30,
              ),
            ],
          ),
          iconTheme: IconThemeData(
            color: Colors.white.withOpacity(0.7),
            size: 20,
          ),
          selectedIconTheme: const IconThemeData(
            color: Colors.white,
            size: 20,
          ),
        ),
        extendedTheme: const SidebarXTheme(
          width: 200,
          decoration: BoxDecoration(
            color: canvasColor,
          ),
        ),
        footerDivider: divider,
        headerBuilder: (context, extended) {
          return SizedBox(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset("assets/images/user image.png"),
            ),
          );
        },
        items: [
          SidebarXItem(
            icon: Icons.person,
            label: 'Catcher Requests',
            onTap: () {
              if (context.mounted) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const RequestsList(),
                  ),
                );
              }
            },
          ),
          SidebarXItem(
            icon: Icons.feedback,
            label: 'Feedback',
            onTap: () {
              if (context.mounted) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const FeedbackPage(),
                  ),
                );
              }
            },
          ),
          SidebarXItem(
            icon: Icons.integration_instructions,
            label: 'Instructions',
            onTap: () {
              if (context.mounted) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const InstructionsPage(),
                  ),
                );
              }
            },
          ),
        ],
        footerItems: [
          SidebarXItem(
              icon: Icons.logout,
              label: 'Logout',
              onTap: () {
                auth.logout();
                Navigator.pushReplacementNamed(context, '/login');
              }),
        ],
      ),
    );
  }

  Future<void> checkUser(String userName) async {
    var auth = context.watch<AuthModel>();
    var usr = await UserApi().getUser(int.parse(auth.userName!));

    if (usr["userId"] != null) {
      var newUser = User.fromJson(usr);
      await newUser.saveUser();
    }

    var userDet = await User.loadUserData();
    print(userDet.userId);
    if (userDet.userId == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => EditProfile(
                    userId: int.parse(userName),
                  )),
        );
      });
    }
  }
}

const primaryColor = Color(0xFF4CAF50);
const canvasColor = Color(0xFF4CAF50);
const scaffoldBackgroundColor = Color(0xFF1B5E20);
const accentCanvasColor = Color(0xFF1B5E20);
const white = Colors.white;
final actionColor = const Color(0xFF1B5E20).withOpacity(0.6);
final divider = Divider(color: white.withOpacity(0.3), height: 1);
