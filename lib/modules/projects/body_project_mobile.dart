import 'package:flutter/material.dart';
import 'package:rennan_portifolio/data/model/project_section.dart';
import 'package:rennan_portifolio/modules/projects/widgets/tabBarProjectOptions.dart';
import 'package:rennan_portifolio/modules/projects/widgets/tabBarViewProjectOptions.dart';
import 'package:rennan_portifolio/themes/colors/app_colors.dart';

class BodyProjectMobile extends StatelessWidget {
  final List<ProjectSection> projectSections;
  const BodyProjectMobile({
    Key? key,
    required this.projectSections,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: projectSections.length,
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.darkPrimaryColor,
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: TabBarProjectOptions(
                  projectsSections: projectSections,
                ),
              ),
              Expanded(
                child: TabBarViewProjectOptions(
                  projectsSections: projectSections,
                  margin: const EdgeInsets.only(top: 20),
                  showCardMobile: true,
                  maxPerPage: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
