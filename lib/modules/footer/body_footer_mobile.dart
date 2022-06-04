import 'package:flutter/material.dart';
import 'package:rennan_portifolio/modules/footer/widgets/info_contacts.dart';
import 'package:rennan_portifolio/shared_widgets/animated_widgets/text_animation.dart';
import 'package:rennan_portifolio/themes/colors/app_colors.dart';
import 'package:rennan_portifolio/utils/extensions_utils.dart';

class BodyFooterMobile extends StatelessWidget {
  const BodyFooterMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      height: 150,
      color: AppColors.primaryColor,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: TextAnimation(
              "Desenhado por: Julio Rennan",
              style: context.textTheme.headline6?.copyWith(
                color: AppColors.lightColor,
              ),
            ),
          ),
          const Center(
            child: InfoContacts(),
          )
        ],
      ),
    );
  }
}
