// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:rennan_portifolio/app/app_body_mobile.dart';
import 'package:rennan_portifolio/app/app_body_web.dart';
import 'package:rennan_portifolio/themes/colors/app_colors.dart';
import 'package:rennan_portifolio/utils/extensions_utils.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({Key? key}) : super(key: key);
  @override
  _AppScreenState createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen>
    with SingleTickerProviderStateMixin {
  late int indexSelected;
  late final _appScrollController;

  bool isDrawerOpen = false;
  late final _scaffoldKey;
  late final AnimationController _animationController;
  late final PageController _pageController;

  bool needConfigEnvironmentMobile = true;
  bool needConfigEnvironmentWeb = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    configEnvironment(context);
    if (context.isMobileLayout) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        primary: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.darkPrimaryColor.withOpacity(0.5),
          elevation: 1,
          shadowColor: AppColors.lightSecondary.withOpacity(.2),
          leading: IconButton(
            icon: AnimatedIcon(
              icon: AnimatedIcons.menu_close,
              progress: _animationController,
            ),
            onPressed: () {
              if (!isDrawerOpen) {
                _scaffoldKey.currentState?.openDrawer();
              } else {
                Navigator.pop(context);
              }
            },
          ),
          flexibleSpace: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
        ),
        body: AppBodyMobile(
          animationController: _animationController,
          scaffoldKey: _scaffoldKey,
          pageController: _pageController,
          onDrawerChanged: (onDrawerChanged) {
            isDrawerOpen = onDrawerChanged;
            setState(() {
              onDrawerChanged
                  ? _animationController.forward()
                  : _animationController.reverse();
            });
          },
        ),
      );
    } else {
      return AppBodyWeb(
        appScrollController: _appScrollController,
        indexSelected: indexSelected,
      );
    }
  }

  configEnvironment(BuildContext context) {
    if (context.isMobileLayout && needConfigEnvironmentMobile) {
      configMobileEnvironment();
    } else {
      if (needConfigEnvironmentWeb) configWebEnvironment();
    }
  }

  configMobileEnvironment() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _pageController = PageController();
    _scaffoldKey = GlobalKey<ScaffoldState>();
    needConfigEnvironmentMobile = false;
  }

  configWebEnvironment() {
    indexSelected = 0;
    _appScrollController = ScrollController(initialScrollOffset: 80);
    configListernerListview();
    needConfigEnvironmentWeb = false;
  }

  configListernerListview() {
    _appScrollController.addListener(() {
      if (_appScrollController.offset < 80) {
        _appScrollController.jumpTo(80);
      }
      // print("==> ${_appScrollController.offset}");
      final offset = _appScrollController.offset;
      int newIndex = 0;
      if (offset >= WidgetsOffset.home && offset < WidgetsOffset.projects) {
        newIndex = 0;
      } else if (offset >= WidgetsOffset.projects &&
          offset < WidgetsOffset.timeline) {
        newIndex = 1;
      } else if (offset >= WidgetsOffset.timeline &&
          offset < WidgetsOffset.aboutMe) {
        newIndex = 2;
      } else if (offset >= WidgetsOffset.aboutMe) {
        newIndex = 3;
      }
      if (indexSelected != newIndex) {
        setState(() {
          indexSelected = newIndex;
        });
      }
    });
  }
}
