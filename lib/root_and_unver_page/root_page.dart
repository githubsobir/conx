import 'dart:developer';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:conx/pages/active_orders/active_orders.dart';
import 'package:conx/pages/chat/chat.dart';
import 'package:conx/pages/main/main_page.dart';
import 'package:conx/pages/saved/saved.dart';
import 'package:conx/pages/search/search_all.dart';
import 'package:conx/widgets/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  Future getBoshFunc() async {
    // await widget.providerCheckInformation.getQaydVaraqa2();
    setState(() {});
  }

  int index = 0;

  // GlobalKey<NavigatorState> navigatorKey0012 = GlobalKey<NavigatorState>();
  ///
  dynamic selected;
  var heart = false;

  // var box = Hive.box("online");

  // Future getFirstAction() async {
  //   try {
  //     await Future.delayed(Duration.zero);
  //     box.delete("updateVersion");
  //     box.put("updateVersion", "1005");
  //   } catch (e) {
  //     throw Exception("Error update");
  //   }
  // }

  int currentIndex = 0;
  final List<IconData> icons = [
    Icons.add_home_outlined,
    CupertinoIcons.search,
    Icons.favorite_border,
    CupertinoIcons.chat_bubble_2,
  ];

  int animationWindowValue = 1;

  /// widget list
  final List<Widget> bottomBarPages = [
    MainPage(),
    SearchAll(),
    Saved(),
    Chat(),
    ActiveOrders()
  ];
  int _bottomNavIndex = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.colorBackground,
        elevation: 0,
        toolbarHeight: 1,
      ),
      // drawer: Drawer(),
      body: Container(child: bottomBarPages[_bottomNavIndex]),
      floatingActionButton: FloatingActionButton(
        shape:const CircleBorder(),
        elevation: 1,
        backgroundColor: _bottomNavIndex == 4 ?  AppColors.colorBackground : Colors.white,
        child: Icon(CupertinoIcons.globe,
            color: _bottomNavIndex == 4 ? Colors.white : Colors.grey),
        onPressed: () {

          _bottomNavIndex = 4;
          setState(() {});
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        backgroundColor: Colors.white,
        splashColor: Colors.white,
        borderColor: Colors.white,
        icons: icons,

        activeColor: AppColors.colorBackground,
        shadow: const Shadow(
            color: Colors.white,
            offset: Offset(
              0,
              0,
            ),
            blurRadius: 0),
        elevation: 0,
        activeIndex: _bottomNavIndex,
        inactiveColor: Colors.grey,
        iconSize: 30,
        // leftCornerRadius: 32,
        // rightCornerRadius: 32,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) => setState(() {
          log(index.toString());
          if (_bottomNavIndex != 4) {
            if (_bottomNavIndex > index) {
              // box.put("animationWindowValue", 0.7);
            } else {
              // box.put("animationWindowValue", -0.7);
            }
          } else {
            if (index > 1) {
              // box.put("animationWindowValue", 0.7);
            } else {
              // box.put("animationWindowValue", -0.7);
            }
          }

          _bottomNavIndex = index;
        }),
      ),
    );
  }
}
