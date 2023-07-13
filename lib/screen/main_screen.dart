import 'package:dreamhrms/colors.dart';
import 'package:dreamhrms/screen/settings.dart';
import 'package:dreamhrms/widgets/Custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

import 'attendance.dart';
import 'department/add_department.dart';
import 'department/deparment.dart';
import 'drawer.dart';
import 'employee/employee_list.dart';
import 'home.dart';
import 'login.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  int currentTab = 0;
  final List<Widget> screens = [
    HomeScreen(),
    EmployeeList(),
    Attendance(),
    Settings(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomeScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => Department());
          },
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          child: Container(
            width: 60,
            height: 60,
            child: Icon(
              Icons.add,
              size: 40,
              color: Colors.white,
            ),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(
                      64, 190, 84, 1), // Replace with your desired color values
                  Color.fromRGBO(
                      0, 174, 235, 1), // Replace with your desired color values
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        //floating action button position to center

        bottomNavigationBar: BottomAppBar(
          notchMargin: 10,
          shape: CircularNotchedRectangle(),
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    setBottomUI(
                        name: "Home",
                        icon: "assets/icons/home.svg",
                        currentTab: currentTab,
                        count: 0,
                        onPressed: () {
                          setState(() {
                            currentScreen = HomeScreen();
                            currentTab = 0;
                          });
                        }),
                    setBottomUI(
                        name: "Employee",
                        icon: "assets/icons/users.svg",
                        currentTab: currentTab,
                        count: 1,
                        onPressed: () {
                          setState(() {
                            currentScreen = EmployeeList();
                            currentTab = 1;
                          });
                        }),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    setBottomUI(
                        name: "Attendance",
                        icon: "assets/icons/files.svg",
                        currentTab: currentTab,
                        count: 2,
                        onPressed: () {
                          setState(() {
                            currentScreen = Attendance();
                            currentTab = 2;
                          });
                        }),
                    setBottomUI(
                        name: "Setting",
                        icon: "assets/icons/userCircle.svg",
                        currentTab: currentTab,
                        count: 3,
                        onPressed: () {
                          setState(() {
                            currentScreen = Settings();
                            currentTab = 3;
                          });
                        }),
                  ],
                )
              ],
            ),
          ),
        ),
        body: PageStorage(bucket: bucket, child: currentScreen));
  }

  setBottomUI(
      {required String icon,
      required VoidCallback onPressed,
      required String name,
      required int currentTab,
      required int count}) {
    return MaterialButton(
        minWidth: 40,
        onPressed: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(icon,
                color: currentTab == count ? AppColors.blue : AppColors.grey),
            CustomText(
                text: name,
                color: currentTab == count ? AppColors.blue : AppColors.grey,
                fontSize: 12,
                fontWeight: FontWeight.w400)
          ],
        ));
  }

  Widget _getDrawer() {
    TextStyle drawerTextStyle = const TextStyle(
        color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold);
    List<Widget> options = [];

    List pages = [
      {'title': 'dashboard', 'route': '/home'},
      {'title': 'dashboard', 'route': '/home'},
      {'title': 'dashboard', 'route': '/home'},
    ];
    pages.forEach((page) {
      print(page);
      if (!page.containsKey('list')) {
        var opt = ListTile(
            title: Text(page['title'], style: drawerTextStyle),
            onTap: () {
              // openPage(page);
            });
        options.add(opt);
      } else {
        List<Widget> inneritem = [];
        page['list'].forEach((innerPage) {
          var innerOpt = ListTile(
              contentPadding: const EdgeInsets.only(left: 40),
              title: Text(innerPage['title'], style: drawerTextStyle),
              onTap: () {
                // openPage(innerPage);
              });
          inneritem.add(innerOpt);
        });

        var _controller = AnimationController(
            duration: const Duration(milliseconds: 200), vsync: this);
        Animatable<double> _easeInTween = CurveTween(curve: Curves.easeIn);
        Animatable<double> _halfTween = Tween<double>(begin: 0.0, end: 0.5);
        var _iconTurns = _controller.drive(_halfTween.chain(_easeInTween));

        var exOpt = ExpansionTile(
          trailing: RotationTransition(
            turns: _iconTurns,
            child: const Icon(
              // Icons.fingerprint
              Icons.expand_more,
              color: Colors.white,
            ),
          ),
          title: Text(page['title'], style: drawerTextStyle),
          children: inneritem,
        );
        options.add(exOpt);
      }
    });
    // }
    return Padding(
      padding: const EdgeInsets.only(top: 120),
      child: Drawer(
        child: ListView(
          children: [
            // DrawerHeader(
            //   child: Text('Drawer Header'),
            //   decoration: BoxDecoration(
            //     color: Colors.blue,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
