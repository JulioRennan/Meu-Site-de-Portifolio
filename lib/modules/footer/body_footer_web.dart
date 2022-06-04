import 'package:flutter/material.dart';
import 'package:rennan_portifolio/modules/footer/widgets/info_contacts.dart';
import 'package:rennan_portifolio/shared_widgets/animated_widgets/text_animation.dart';
import 'package:rennan_portifolio/themes/colors/app_colors.dart';
import 'package:rennan_portifolio/utils/extensions_utils.dart';
import 'package:rennan_portifolio/utils/manager_routes.dart';

class BodyFooterWeb extends StatelessWidget {
  const BodyFooterWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 50,
      ),
      width: double.infinity,
      height: 150,
      color: AppColors.darkPrimaryColor,
      child: Row(
        children: [
          TextAnimation(
            "Desenhado por: Julio Rennan",
            style: context.textTheme.headline6
                ?.copyWith(color: AppColors.lightColor)
                .responsive(context),
          ),
          const Spacer(),
          if (!ManagerRoutes.hideContacts) const InfoContacts()
        ],
      ),
    );
  }
}
