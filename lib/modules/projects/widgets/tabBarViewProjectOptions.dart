// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:rennan_portifolio/data/model/project.dart';
import 'package:rennan_portifolio/data/model/project_section.dart';
import 'package:rennan_portifolio/modules/projects/widgets/card_project.dart';
import 'package:rennan_portifolio/modules/projects/widgets/card_project_mobile.dart';
import 'package:rennan_portifolio/utils/extensions_utils.dart';

class TabBarViewProjectOptions extends StatelessWidget {
  final List<ProjectSection> projectsSections;
  final cardHeight = 330.0;
  final int maxPerPage;
  final EdgeInsets? margin;
  final bool showCardMobile;
  const TabBarViewProjectOptions({
    Key? key,
    required this.projectsSections,
    this.maxPerPage = 3,
    this.showCardMobile = false,
    EdgeInsets? margin,
  })  : margin = margin ?? const EdgeInsets.symmetric(vertical: 50),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
        children: projectsSections.map((projectSection) {
      if (context.isMobileLayout) {
        return ListView.builder(
          itemCount: projectSection.projects.length,
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: CardProjectMobile(
                project: projectSection.projects[index],
                height: cardHeight,
              ),
            );
          }),
        );
      }
      return PageView(
        controller: PageController(viewportFraction: 0.85),
        scrollDirection: Axis.horizontal,
        children: projectGroupByMaxPerPage(projectSection.projects)
            .map((groupProjects) {
          return Container(
            padding: margin,
            height: heightPageProjects(projectSection.projects.length),
            child: ListView(
              children: [
                for (int i = 0; i < groupProjects.length; i++) ...[
                  if (showCardMobile)
                    CardProjectMobile(
                      project: groupProjects[i],
                      height: cardHeight,
                      index: i,
                    )
                  else
                    SingleChildScrollView(
                      child: CardProject(
                        project: groupProjects[i],
                        height: cardHeight,
                        index: i,
                      ),
                    ),
                  const SizedBox(
                    height: 20,
                  )
                ]
              ],
            ),
          );
        }).toList(),
      );
    }).toList());
  }

  double heightPageProjects(int quantityOfProjects) {
    final height = quantityOfProjects * cardHeight;
    if (cardHeight * maxPerPage > height) {
      return cardHeight * maxPerPage;
    }
    return height;
  }

  List<List<Project>> projectGroupByMaxPerPage(List<Project> projects) {
    final List<List<Project>> groupByThree = [];
    final List<Project> aux = [];
    for (int i = 0; i < projects.length; i++) {
      aux.add(projects[i]);
      if (i % maxPerPage == maxPerPage - 1) {
        groupByThree.add([...aux]);
        aux.clear();
      }
    }
    groupByThree.add([...aux]);
    return groupByThree;
  }
}
