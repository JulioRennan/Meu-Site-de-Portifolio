import 'package:flutter/material.dart';
import 'package:rennan_portifolio/data/model/project_section.dart';
import 'package:rennan_portifolio/modules/projects/widgets/tabBarProjectOptions.dart';
import 'package:rennan_portifolio/modules/projects/widgets/tabBarViewProjectOptions.dart';
import 'package:rennan_portifolio/themes/colors/app_colors.dart';

class BodyProjectWeb extends StatefulWidget {
  final List<ProjectSection> projectSections;
  const BodyProjectWeb({
    Key? key,
    required this.projectSections,
  }) : super(key: key);

  @override
  State<BodyProjectWeb> createState() => _BodyProjectWebState();
}

class _BodyProjectWebState extends State<BodyProjectWeb> {
  int indexSelected = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.projectSections.length,
      child: Container(
        height: 1200,
        decoration: const BoxDecoration(
          color: AppColors.darkPrimaryColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: TabBarProjectOptions(
                projectsSections: widget.projectSections,
              ),
            ),
            Expanded(
              child: TabBarViewProjectOptions(
                projectsSections: widget.projectSections,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
