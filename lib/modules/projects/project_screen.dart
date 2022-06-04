import 'package:flutter/material.dart';
import 'package:rennan_portifolio/modules/projects/body_project_mobile.dart';
import 'package:rennan_portifolio/modules/projects/body_project_web.dart';
import 'package:rennan_portifolio/utils/extensions_utils.dart';
import 'package:rennan_portifolio/data/payloads/projects_payload.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (context.isMobileLayout) {
      return BodyProjectMobile(
        projectSections: projectsPayload,
      );
    } else {
      return BodyProjectWeb(
        projectSections: projectsPayload,
      );
    }
  }
}
