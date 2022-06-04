import 'package:flutter/material.dart';
import 'package:rennan_portifolio/modules/about_me/body_about_me.dart';
import 'package:rennan_portifolio/modules/footer/footer_screen.dart';
import 'package:rennan_portifolio/themes/colors/app_colors.dart';

class BodyAboutMeMobile extends StatelessWidget {
  final String aboutMe;
  const BodyAboutMeMobile({
    Key? key,
    required this.aboutMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      child: ListView(
        shrinkWrap: true,
        children:  [
          BodyAboutMe(
            aboutMe: aboutMe,
          ),
          const FooterScreen(),
        ],
      ),
    );
  }
}
