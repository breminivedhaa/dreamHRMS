import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:page_transition/page_transition.dart';

import '../colors.dart';
import 'drawer.dart';
import 'login.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: Container(
          decoration: BoxDecoration(
              gradient: AppColors.primaryColor1,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AppBar(
              centerTitle: false,
              elevation: 0,
              leadingWidth: 20.0,
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(),
              leading: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.leftToRight,
                        child: HomeMainDrawer(),
                      ),
                    );
                  },
                  child: Icon(Icons.menu)),
              title: Padding(
                padding: const EdgeInsets.only(right: 40),
                child: Image.asset('assets/images/logo_white.png'),
              ),
              actions: [
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/notification1.svg'),
                    SizedBox(width: 8),
                    InkWell(
                      onTap: () {
                        Get.to(() => Login());
                      },
                      // child: Icon(Icons.logout)),
                      child: Container(
                        width: 38.0,
                        height: 38.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                "https://media.istockphoto.com/id/1318482009/photo/young-woman-ready-for-job-business-concept.jpg?s=612x612&w=0&k=20&c=Jc1NcoUMoM78AxPTh9EApaPU2kXh2evb499JgW99b0g=",
                              )),
                          border:
                          Border.all(color: AppColors.white, width: 3),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
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
