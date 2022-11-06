import 'package:flutter/material.dart';
import 'package:rennan_portifolio/themes/colors/app_colors.dart';
import 'package:rennan_portifolio/utils/extensions_utils.dart';

class TextHome extends StatelessWidget {
  final double? width;
  final profileName = "Julio Rennan";
  final title = "Programador Full Stack";
  final subtitle = '''
Sou programador a 3 anos, apaixonado em resolver 
problemas e desafios novos.
@nConheço várias tecnologias mas as que eu mais domino 
são: Flutter, Swift e TypeScript.''';
  const TextHome({Key? key, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            profileName,
            style: textTheme.headline4
                ?.copyWith(color: AppColors.secondaryColor)
                .responsive(context),
          ),
          Text(
            title,
            style: textTheme.headline4
                ?.copyWith(color: AppColors.lightSecondary)
                .responsive(context),
          ),
          Text(
            subtitle.trimAll(),
            style: textTheme.subtitle1
                ?.copyWith(color: AppColors.lightSecondary)
                .responsive(context),
          ),
        ],
      ),
    );
  }
}
