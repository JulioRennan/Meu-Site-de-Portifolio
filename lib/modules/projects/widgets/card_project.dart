import 'package:flutter/material.dart';
import 'package:rennan_portifolio/data/model/project.dart';
import 'package:rennan_portifolio/data/model/tech.dart';
import 'package:rennan_portifolio/shared_widgets/animated_widgets/fade_container.dart';
import 'package:rennan_portifolio/shared_widgets/widgets/link_container.dart';
import 'package:rennan_portifolio/shared_widgets/widgets/overlay_container.dart';
import 'package:rennan_portifolio/themes/colors/app_colors.dart';
import 'package:rennan_portifolio/utils/manager_path.dart';
import 'package:rennan_portifolio/utils/extensions_utils.dart';

class CardProject extends StatelessWidget {
  final Project project;
  final double height;
  final int index;
  const CardProject({
    Key? key,
    required this.height,
    required this.index,
    required this.project,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeContainer(
        delay: Duration(milliseconds: 700 * index),
        child: Container(
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: AppColors.lightSecondary.withOpacity(.1),
          ),
          margin: const EdgeInsets.symmetric(
            horizontal: 50,
          ),
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              //Image project and repository overlay
              OverlayContainer(
                child: Container(
                  width: 300,
                  height: 300,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryColor.withOpacity(.4),
                        offset: const Offset(0, 4),
                        blurRadius: 4,
                      )
                    ],
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
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
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
                        bottom: 20,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: LinkContainer(
                            url: "",
                            child: Image.asset(
                              ManagerPath.iconGit,
                              color: AppColors.lightColor,
                              width: 40,
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
                            size: 40,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              //Right info: title, description and techs.
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Title
                      Text(
                        project.title,
                        style: context.textTheme.headline5
                            ?.copyWith(color: AppColors.secondaryColor),
                      ),
                      // Description
                      Expanded(
                        child: SingleChildScrollView(
                          child: SizedBox(
                            width: double.infinity,
                            child: Text(
                              project.description.trimAll(),
                              style: context.textTheme.bodyText2?.copyWith(
                                color: AppColors.lightColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Techs space
                      ...[
                        Text(
                          "Techs Utilizadas",
                          style: context.textTheme.headline5?.copyWith(
                            color: AppColors.secondaryColor,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Row(
                          children: [
                            for (Tech tech in project.techs) ...[
                              Image.asset(
                                tech.imagePath,
                                width: 30,
                                color: AppColors.lightColor,
                              ),
                              const SizedBox(
                                width: 10,
                              )
                            ]
                          ],
                        )
                      ]
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  double sizeImageProject(BuildContext context) {
    if (context.isMobileLayout) {
      return 100;
    } else {
      return 300;
    }
  }
}
