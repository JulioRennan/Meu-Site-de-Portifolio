import 'package:flutter/material.dart';
import 'package:rennan_portifolio/modules/timeline/body_timeline_mobile.dart';
import 'package:rennan_portifolio/modules/timeline/body_timeline_web.dart';
import 'package:rennan_portifolio/utils/extensions_utils.dart';
import 'package:rennan_portifolio/data/payloads/timeline_payload.dart';

class TimelineScreen extends StatelessWidget {
  const TimelineScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    timelinesPayload;
    if (context.isMobileLayout) {
      return BodyTimelineMobile(
        timelines: timelinesPayload,
      );
    } else {
      return BodyTimelineWeb(
        timelines: timelinesPayload,
      );
    }
  }
}
