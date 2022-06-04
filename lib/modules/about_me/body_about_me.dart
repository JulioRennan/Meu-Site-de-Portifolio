import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:rennan_portifolio/themes/colors/app_colors.dart';
import 'package:rennan_portifolio/utils/extensions_utils.dart';
import 'widgets/background_about_me.dart';

class BodyAboutMe extends StatelessWidget {
  final String aboutMe;
  const BodyAboutMe({
    Key? key,
    required this.aboutMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundAboutMe(),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 100,
              left: 10,
              right: 10,
              bottom: 10,
            ),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 700),
              decoration: BoxDecoration(
                  color: AppColors.lightColor.withOpacity(.3),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 1,
                      color: Colors.black.withOpacity(.2),
                      offset: const Offset(0, 5),
                    )
                  ]),
              clipBehavior: Clip.antiAlias,
              child: BackdropFilter(
                filter: ImageFilter.blur(
                    sigmaX: 3.0, sigmaY: 3.0, tileMode: TileMode.mirror),
                child: Padding(
                  padding: EdgeInsets.all(
                    context.isMobileLayout ? 50 : 100,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Sobre mim",
                        style: context.textTheme.headline6?.copyWith(
                          color: AppColors.lightColor.withOpacity(.8),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        aboutMe.trimAll(),
                        style: context.textTheme.bodyText1
                            ?.copyWith(
                              color: AppColors.lightColor.withOpacity(.8),
                            )
                            .responsive(context),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
