import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:rennan_portifolio/modules/timeline/widgets/divider_animated.dart';
import 'package:rennan_portifolio/shared_widgets/animated_widgets/fade_container.dart';
import 'package:rennan_portifolio/themes/colors/app_colors.dart';

import 'mobile_llist_tile.dart';

enum PageScreen { home, projects, timeline, aboutme }

class MobileDrawer extends StatelessWidget {
  final PageController pageController;
  const MobileDrawer({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Drawer(
        backgroundColor: AppColors.darkPrimaryColor.withOpacity(.2),
        elevation: 0,
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
            child: SafeArea(
              child: FadeContainer(
                child: Column(children: [
                  MobileListTile(
                    title: "Home",
                    iconData: Icons.home,
                    onTap: () => jumpToScreen(PageScreen.home),
                  ),
                  drawerDivider,
                  MobileListTile(
                    title: "Projetos",
                    iconData: Icons.code,
                    onTap: () => jumpToScreen(PageScreen.projects),
                  ),
                  drawerDivider,
                  MobileListTile(
                    title: "Linha do tempo",
                    iconData: Icons.timeline,
                    onTap: () => jumpToScreen(PageScreen.timeline),
                  ),
                  drawerDivider,
                  MobileListTile(
                    title: "Sobre mim",
                    iconData: Icons.directions_run,
                    onTap: () => jumpToScreen(PageScreen.aboutme),
                  ),
                  drawerDivider
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  jumpToScreen(PageScreen page) {
    pageController.animateToPage(
      page.index,
      duration: const Duration(milliseconds: 700),
      curve: Curves.decelerate,
    );
  }

  Widget get drawerDivider {
    return const Align(
      alignment: Alignment.centerRight,
      child: DividerAnimated(
        afterDelay: Duration(milliseconds: 500),
        height: 1,
        color: AppColors.secondaryColor,
        width: 110,
      ),
    );
  }
}
