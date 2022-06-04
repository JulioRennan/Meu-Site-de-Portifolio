// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:rennan_portifolio/data/model/project_section.dart';
import 'package:rennan_portifolio/themes/colors/app_colors.dart';
import 'package:rennan_portifolio/utils/extensions_utils.dart';

class TabBarProjectOptions extends StatelessWidget {
  final List<ProjectSection> projectsSections;
  const TabBarProjectOptions({
    Key? key,
    required this.projectsSections,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorColor: AppColors.secondaryColor,
      labelStyle: context.textTheme.headline5.responsive(context),
      isScrollable: true,
      physics: const NeverScrollableScrollPhysics(),
      tabs: projectsSections.map((projectSection) {
        return Tab(
          text: projectSection.title,
        );
      }).toList(),
    );
  }
}
