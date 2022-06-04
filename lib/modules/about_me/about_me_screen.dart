import 'package:flutter/material.dart';
import 'package:rennan_portifolio/data/payloads/about_me_payload.dart';
import 'package:rennan_portifolio/modules/about_me/body_about_me_mobile.dart';
import 'package:rennan_portifolio/modules/about_me/body_about_me.dart';
import 'package:rennan_portifolio/utils/extensions_utils.dart';

class AboutMeScreen extends StatelessWidget {
  const AboutMeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (context.isMobileLayout) {
      return const BodyAboutMeMobile(
        aboutMe: aboutMePayload,
      );
    } else {
      return const BodyAboutMe(
        aboutMe: aboutMePayload,
      );
    }
  }
}
