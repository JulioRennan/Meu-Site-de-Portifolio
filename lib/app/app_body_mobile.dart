import 'package:flutter/material.dart';
import '../modules/about_me/about_me_screen.dart';
import '../modules/home/home_screen.dart';
import '../modules/projects/project_screen.dart';
import '../modules/timeline/timeline_screen.dart';
import 'widgets/drawer_mobile/mobile_drawer.dart';

class AppBodyMobile extends StatelessWidget {
  final AnimationController animationController;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final PageController pageController;
  final void Function(bool)? onDrawerChanged;

  const AppBodyMobile({
    Key? key,
    required this.animationController,
    required this.scaffoldKey,
    required this.pageController,
    this.onDrawerChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      onDrawerChanged: onDrawerChanged,
      drawer: MobileDrawer(pageController: pageController),
      drawerScrimColor: Colors.transparent,
      body: PageView(
        controller: pageController,
        scrollDirection: Axis.vertical,
        children: const [
          HomeScreen(),
          ProjectScreen(),
          TimelineScreen(),
          AboutMeScreen()
        ],
      ),
    );
  }
}
