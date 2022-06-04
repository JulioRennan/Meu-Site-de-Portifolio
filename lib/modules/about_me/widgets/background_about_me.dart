import 'package:flutter/material.dart';
import 'package:rennan_portifolio/themes/colors/app_colors.dart';
import 'package:rennan_portifolio/utils/manager_path.dart';

class BackgroundAboutMe extends StatelessWidget {
  const BackgroundAboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.darkPrimaryColor,
      child: const Opacity(
        opacity: .2,
        child: Image(
          height: 900,
          image: AssetImage(ManagerPath.backgroundAboutMe),
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
