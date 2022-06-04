import 'package:flutter/material.dart';
import 'package:rennan_portifolio/modules/footer/body_footer_mobile.dart';
import 'package:rennan_portifolio/modules/footer/body_footer_web.dart';
import 'package:rennan_portifolio/utils/extensions_utils.dart';

class FooterScreen extends StatelessWidget {
  const FooterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (context.isMobileLayout) {
      return const BodyFooterMobile();
    }
    return const BodyFooterWeb();
  }
}
