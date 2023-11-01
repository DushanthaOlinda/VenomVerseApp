import 'package:VenomVerse/models/user.dart';
import 'package:VenomVerse/screens/pages/addNewArticlelist_page.dart';
import 'package:VenomVerse/screens/pages/addnewarticle_page.dart';
import 'package:VenomVerse/screens/pages/articleRequests_page.dart';
import 'package:VenomVerse/screens/pages/catcher/requests_list.dart';
import 'package:VenomVerse/screens/pages/catcher/service_requestlist.dart';
import 'package:VenomVerse/screens/pages/complaints_page.dart';
import 'package:VenomVerse/screens/pages/complaintslist_page.dart';
import 'package:VenomVerse/screens/pages/feedback_page.dart';
import 'package:VenomVerse/screens/pages/instructions_page.dart';
import 'package:VenomVerse/screens/pages/learning_resources/viewallquiz_page.dart';
import 'package:VenomVerse/screens/pages/profile_page.dart';
import 'package:VenomVerse/screens/pages/myArticle_page.dart';
import 'package:VenomVerse/screens/pages/postRequests_page.dart';
import 'package:VenomVerse/screens/pages/zoologistRequests_page.dart';
import 'package:VenomVerse/widgets/generate_body.dart';
import 'package:app_bar_with_search_switch/app_bar_with_search_switch.dart';
import 'package:flutter/foundation.dart';
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
    var user = UserApi().getUser(int.parse(auth.userName!));

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
      if(auth.userName != null){
        checkUser(auth.userName!);
      }
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
      drawer: FutureBuilder<Map<String, dynamic>>(
        future: user,
        builder: (context, snapshot) {
          return SidebarX(
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
            items: itemsForRoles(snapshot.data),
            // items: [
            //   SidebarXItem(
            //     icon: Icons.quiz,
            //     label: 'Manage Quiz',
            //     onTap: () {
            //       if (context.mounted) {
            //         Navigator.of(context).push(
            //           MaterialPageRoute(
            //             builder: (context) => const viewAllQuizesPage(),
            //           ),
            //         );
            //       }
            //     },
            //   ), // Zoologist
            //   SidebarXItem(
            //     icon: Icons.post_add_sharp,
            //     label: 'My Articles',
            //     onTap: () {
            //       if (context.mounted) {
            //         Navigator.of(context).push(
            //           MaterialPageRoute(
            //             builder: (context) => const MyArticlePage(),
            //           ),
            //         );
            //       }
            //     },
            //   ), // Zoologist
            //   SidebarXItem(
            //     icon: Icons.post_add_sharp,
            //     label: 'Add New Article',
            //     onTap: () {
            //       if (context.mounted) {
            //         Navigator.of(context).push(
            //           MaterialPageRoute(
            //             builder: (context) => const AddNewArticlePage(),
            //           ),
            //         );
            //       }
            //     },
            //   ), // Zoologist
            //   SidebarXItem(
            //     icon: Icons.post_add,
            //     label: 'Post Requests',
            //     onTap: () {
            //       if (context.mounted) {
            //         Navigator.of(context).push(
            //           MaterialPageRoute(
            //             builder: (context) => const PostRequestsPage(),
            //           ),
            //         );
            //       }
            //     },
            //   ), // Com Admin
            //   SidebarXItem(
            //     icon: Icons.report,
            //     label: 'Complaints',
            //     onTap: () {
            //       if (context.mounted) {
            //         Navigator.of(context).push(
            //           MaterialPageRoute(
            //             builder: (context) => const ComplaintsListPage(),
            //           ),
            //         );
            //       }
            //     },
            //   ), // Com Admin
            //   SidebarXItem(
            //     icon: Icons.post_add,
            //     label: 'Article requests',
            //     onTap: () {
            //       if (context.mounted) {
            //         Navigator.of(context).push(
            //           MaterialPageRoute(
            //             builder: (context) => const ArticleRequestsPage(),
            //           ),
            //         );
            //       }
            //     },
            //   ), // Com Admin
            //   SidebarXItem(
            //     icon: Icons.person_add_outlined,
            //     label: 'Approve Zoologists',
            //     onTap: () {
            //       if (context.mounted) {
            //         Navigator.of(context).push(
            //           MaterialPageRoute(
            //             builder: (context) => const ZoologistRequestsPage(),
            //           ),
            //         );
            //       }
            //     },
            //   ), // Com Admin
            //   SidebarXItem(
            //     icon: Icons.feedback,
            //     label: 'Service List',
            //     onTap: () {
            //       if (context.mounted) {
            //         Navigator.of(context).push(
            //           MaterialPageRoute(
            //             builder: (context) => const ServiceRequests(),
            //           ),
            //         );
            //       }
            //     },
            //   ), // Catcher
            //   SidebarXItem(
            //     icon: Icons.person,
            //     label: 'Catcher Requests',
            //     onTap: () {
            //       if (context.mounted) {
            //         Navigator.of(context).push(
            //           MaterialPageRoute(
            //             builder: (context) => const RequestsList(),
            //           ),
            //         );
            //       }
            //     },
            //   ), // Catcher
            //   SidebarXItem(
            //     icon: Icons.integration_instructions,
            //     label: 'Instructions',
            //     onTap: () {
            //       if (context.mounted) {
            //         Navigator.of(context).push(
            //           MaterialPageRoute(
            //             builder: (context) => const InstructionsPage(),
            //           ),
            //         );
            //       }
            //     },
            //   ), // All users
            //   SidebarXItem(
            //     icon: Icons.feedback,
            //     label: 'Feedback',
            //     onTap: () {
            //       if (context.mounted) {
            //         Navigator.of(context).push(
            //           MaterialPageRoute(
            //             builder: (context) => const FeedbackPage(),
            //           ),
            //         );
            //       }
            //     },
            //   ), // All Users
            //
            // ], //
            footerItems: [
              SidebarXItem(
                  icon: Icons.logout,
                  label: 'Logout',
                  onTap: () {
                    auth.logout();
                    Navigator.pushReplacementNamed(context, '/login');
                  }),
            ],
          );
        }
      ),
    );
  }

  List<SidebarXItem> itemsForRoles(Map<String, dynamic>? auth) {
    List<SidebarXItem> items = [];
    // AuthModel auth = await context.watch<AuthModel>();

    if (auth == null) {
      return [];
    }

    print(auth["catcherPrivilege"]);

    List roles = [];

    if(auth["catcherPrivilege"]){
      roles.add("Catcher");
    }
    if(auth["expertPrivilege"]){
      roles.add("Expert");
    }
    if(auth["communityAdminPrivilege"]){
      roles.add("ComAdmin");
    }
    if(auth["zoologistPrivilege"]){
      roles.add("Zoologist");
    }
    for (String role in roles) {
      switch (role) {
        case 'Zoologist': // zoologist
          items.addAll([
            SidebarXItem(
              icon: Icons.quiz,
              label: 'Manage Quiz',
              onTap: () {
                if (context.mounted) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const viewAllQuizesPage(),
                    ),
                  );
                }
              },
            ), // Zoologist
            SidebarXItem(
              icon: Icons.post_add_sharp,
              label: 'My Articles',
              onTap: () {
                if (context.mounted) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const MyArticlePage(),
                    ),
                  );
                }
              },
            ), // Zoologist
            SidebarXItem(
              icon: Icons.post_add_sharp,
              label: 'Add New Article',
              onTap: () {
                if (context.mounted) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AddNewArticlePage(),
                    ),
                  );
                }
              },
            ), // Zoologist
            // Catcher items...
          ]);
          break;
        case 'ComAdmin': // Com Admin
          items.addAll([
            SidebarXItem(
              icon: Icons.post_add,
              label: 'Post Requests',
              onTap: () {
                if (context.mounted) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const PostRequestsPage(),
                    ),
                  );
                }
              },
            ), // Com Admin
            SidebarXItem(
              icon: Icons.report,
              label: 'Complaints',
              onTap: () {
                if (context.mounted) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ComplaintsListPage(),
                    ),
                  );
                }
              },
            ), // Com Admin
            SidebarXItem(
              icon: Icons.post_add,
              label: 'Article requests',
              onTap: () {
                if (context.mounted) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ArticleRequestsPage(),
                    ),
                  );
                }
              },
            ), // Com Admin
            SidebarXItem(
              icon: Icons.person_add_outlined,
              label: 'Approve Zoologists',
              onTap: () {
                if (context.mounted) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ZoologistRequestsPage(),
                    ),
                  );
                }
              },
            ), // Com Admin
            // Zoologist items...
          ]);
          break;
        case 'Catcher':
          items.addAll([
            SidebarXItem(
              icon: Icons.feedback,
              label: 'Service List',
              onTap: () {
                if (context.mounted) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ServiceRequests(),
                    ),
                  );
                }
              },
            ), // Catcher
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
            ), // Catcher
            // Com Admin items...
          ]);
          break;
      }
    }
    return items;
  }


  Future<void> checkUser(String userName) async {
    var auth = context.watch<AuthModel>();
    var usr = await UserApi().getUser(int.parse(auth.userName!));

    if (usr["userId"] != null) {
      var newUser = User.fromJson(usr);
      await newUser.saveUser();
    }

    var userDet = await User.loadUserData();
    if (kDebugMode) {
      print(userDet.userId);
    }
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
