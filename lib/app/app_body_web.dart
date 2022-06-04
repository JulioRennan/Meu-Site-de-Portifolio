import 'dart:ui';

import 'package:flutter/material.dart';
import '../modules/about_me/about_me_screen.dart';
import '../modules/footer/footer_screen.dart';
import '../modules/home/home_screen.dart';
import '../modules/projects/project_screen.dart';
import '../modules/timeline/timeline_screen.dart';
import 'widgets/nav_bar.dart';
import '../themes/colors/app_colors.dart';

class AppBodyWeb extends StatelessWidget {
  final ScrollController appScrollController;
  final int indexSelected;
  const AppBodyWeb(
      {Key? key,
      required this.appScrollController,
      required this.indexSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.darkPrimaryColor.withOpacity(0.5),
        elevation: 1,
        shadowColor: AppColors.lightSecondary.withOpacity(.2),
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
        title: NavBar(
          indexSelected: indexSelected,
          options: [
            NavItem(
              "Home",
              () => animateToChild(WidgetsOffset.home),
            ),
            NavItem(
              "Projetos",
              () => animateToChild(WidgetsOffset.projects),
            ),
            NavItem(
              "Linha do Tempo",
              () => animateToChild(WidgetsOffset.timeline),
            ),
            NavItem(
              "Sobre mim",
              () => animateToChild(WidgetsOffset.aboutMe),
            ),
          ],
        ),
      ),
      body: ListView(
        controller: appScrollController,
        children: const [
          HomeScreen(),
          ProjectScreen(),
          TimelineScreen(),
          AboutMeScreen(),
          FooterScreen()
        ],
      ),
    );
  }

  animateToChild(double offset) {
    appScrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }
}

class WidgetsOffset {
  static const home = 80.0;
  static const projects = 670.0;
  static const timeline = 1940.0;
  static const aboutMe = 4800.0;
}
