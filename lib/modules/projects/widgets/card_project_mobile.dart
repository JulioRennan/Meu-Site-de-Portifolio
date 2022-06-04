import 'package:flutter/material.dart';
import 'package:rennan_portifolio/data/model/project.dart';
import 'package:rennan_portifolio/shared_widgets/animated_widgets/fade_container.dart';
import 'package:rennan_portifolio/shared_widgets/animated_widgets/text_animation.dart';
import 'package:rennan_portifolio/shared_widgets/widgets/link_container.dart';
import 'package:rennan_portifolio/shared_widgets/widgets/overlay_container.dart';
import 'package:rennan_portifolio/themes/colors/app_colors.dart';
import 'package:rennan_portifolio/utils/manager_path.dart';
import 'package:rennan_portifolio/utils/extensions_utils.dart';

class CardProjectMobile extends StatelessWidget {
  final Project project;
  final double height;
  final int? index;
  const CardProjectMobile({
    Key? key,
    required this.height,
    required this.project,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeContainer(
      delay: index != null ? Duration(milliseconds: 700 * index!) : null,
      child: Container(
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.lightSecondary.withOpacity(.1),
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                OverlayContainer(
                  child: Container(
                    width: 120,
                    height: 120,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.darkPrimaryColor,
                    ),
                    child: project.urlImageRepo != null
                        ? Image.network(
                            ManagerPath.deffaultImageProject,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            ManagerPath.deffaultImageProject,
                            fit: BoxFit.cover,
                          ),
                  ),
                  overlay: Stack(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              AppColors.secondaryColor,
                              AppColors.secondaryColor.withOpacity(.2),
                            ],
                          ),
                        ),
                      ),
                      if (project.statusRepo == StatusRepo.public)
                        Positioned.fill(
                          bottom: 10,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: LinkContainer(
                              url: "",
                              child: Image.asset(
                                ManagerPath.iconGit,
                                color: AppColors.lightColor,
                                width: 20,
                              ),
                            ),
                          ),
                        )
                      else
                        const Positioned.fill(
                          bottom: 20,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Icon(
                              Icons.lock_outline,
                              size: 20,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                for (int i = 0; i < project.techs.length; i++) ...[
                  FadeContainer(
                    delay: Duration(milliseconds: 600 + 300 * i),
                    child: Image.asset(
                      project.techs[i].imagePath,
                      width: 30,
                      color: AppColors.lightColor,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ]
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextAnimation(
                      project.title.trimAll(),
                      duration: const Duration(seconds: 2),
                      style: context.textTheme.headline5
                          ?.copyWith(color: AppColors.secondaryColor)
                          .responsive(context),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      project.description.trimAll(),
                      style: context.textTheme.bodyText2?.copyWith(
                        color: AppColors.lightColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
