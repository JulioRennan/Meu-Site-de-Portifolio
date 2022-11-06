import 'package:flutter/material.dart';
import 'package:rennan_portifolio/themes/colors/app_colors.dart';
import 'package:rennan_portifolio/utils/manager_path.dart';
import 'package:rennan_portifolio/utils/extensions_utils.dart';
import 'package:rennan_portifolio/utils/manager_routes.dart';
import 'widgets/button_contact/button_contact.dart';
import 'widgets/image_profile_home.dart';
import 'widgets/text_home.dart';

class BodyHomeWeb extends StatelessWidget {
  const BodyHomeWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.darkPrimaryColor,
      height: calcHeightHome(context),
      child: ShaderMask(
        shaderCallback: (rect) {
          return const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black, Colors.transparent],
          ).createShader(Rect.fromLTRB(
            0,
            rect.height * 0.96,
            0,
            rect.height,
          ));
        },
        blendMode: BlendMode.dstIn,
        child: Stack(
          children: [
            if (context.screenSize.width > 1000)
              const Positioned(
                top: -60,
                right: 0,
                child: ImageProfileHome(),
              )
            else
              AnimatedPositioned(
                duration: const Duration(milliseconds: 800),
                top: calcTopPostionImageProfile(context),
                right: calcRightPostionImageProfile(context),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 800),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: isCircular(context)
                        ? BoxShape.circle
                        : BoxShape.rectangle,
                    border: isCircular(context)
                        ? Border.all(
                            color: AppColors.secondaryColor,
                            width: 2,
                          )
                        : null,
                    boxShadow: const [
                      BoxShadow(
                        color: AppColors.darkPrimaryColor,
                      )
                    ],
                  ),
                  width: calcSizeWidthImage(context),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: isCircular(context)
                          ? BoxShape.circle
                          : BoxShape.rectangle,
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(ManagerPath.mainImagePerson),
                  ),
                ),
              ),
            Positioned.fill(
              top: 220,
              left: calcWidthPostionTexthome(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextHome(width: calcwidthTextHome(context)),
                  const SizedBox(
                    height: 20,
                  ),
                  if (!ManagerApp.hideContacts) const ButtonContact(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  double calcHeightHome(BuildContext context) {
    if (context.isMobileLayout) {
      return 620;
    } else {
      return 750;
    }
  }

  double calcwidthTextHome(BuildContext context) {
    final width = context.screenSize.width;
    if (context.isMobileLayout) {
      return width * 0.99;
    } else {
      return width * 0.5;
    }
  }

  double calcWidthPostionTexthome(BuildContext context) {
    final width = context.screenSize.width;

    if (context.isMobileLayout) {
      return width * 0.05;
    } else {
      return 80;
    }
  }

  double calcTopPostionImageProfile(BuildContext context) {
    final width = context.screenSize.width;
    if (width >= 980) {
      return 80;
    } else if (width >= 500) {
      return 200;
    } else {
      return 100;
    }
  }

  double calcRightPostionImageProfile(BuildContext context) {
    final width = context.screenSize.width;
    if (width >= 980) {
      return 0;
    } else if (width >= 500) {
      return 20;
    } else {
      return 10;
    }
  }

  double calcSizeWidthImage(BuildContext context) {
    final width = context.screenSize.width;
    if (width >= 980) {
      return 500;
    } else if (width >= 700) {
      return 280;
    } else if (width >= 500) {
      return 180;
    } else {
      return 130;
    }
  }

  bool isCircular(BuildContext context) {
    final width = context.screenSize.width;
    return !(width >= 980);
  }
}
