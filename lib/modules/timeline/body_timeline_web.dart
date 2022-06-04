import 'package:flutter/material.dart';
import 'package:rennan_portifolio/data/model/timeline.dart';
import 'package:rennan_portifolio/modules/timeline/widgets/path_years.dart';
import 'package:rennan_portifolio/modules/timeline/widgets/tile_timeline.dart';
import 'package:rennan_portifolio/themes/colors/app_colors.dart';
import 'package:rennan_portifolio/utils/extensions_utils.dart';
import 'dart:math' as math;

class BodyTimelineWeb extends StatefulWidget {
  final List<Timeline> timelines;
  const BodyTimelineWeb({Key? key, required this.timelines}) : super(key: key);

  @override
  State<BodyTimelineWeb> createState() => _BodyTimelineWebState();
}

class _BodyTimelineWebState extends State<BodyTimelineWeb>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.darkPrimaryColor,
      child: Stack(
        children: [
          for (int i = 0; i < widget.timelines.length - 1; i++)
            if (i % 2 == 0)
              Positioned(
                left: offsetPostionLeft,
                top: offsetPositionTopByIndex(i),
                child: PathYears(
                  width: widthPath,
                  delay: delayByIndex(i) + const Duration(seconds: 2),
                ),
              )
            else
              Positioned(
                left: 50 + 160,
                top: offsetPositionTopByIndex(i),
                child: Transform(
                  //Wrap your widget with the Transform widget
                  alignment: Alignment.center, //Default is left
                  transform: Matrix4.rotationY(math.pi), //
                  child: PathYears(
                    width: widthPath,
                    delay: delayByIndex(i) + const Duration(seconds: 2),
                  ),
                ),
              ),
          Container(
            margin: const EdgeInsets.only(
              top: 100,
              left: 50,
              right: 50,
              bottom: 50,
            ),
            padding: const EdgeInsets.all(50),
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.secondaryColor,
                width: 10,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              children: List.generate(
                widget.timelines.length,
                (index) {
                  final timeline = widget.timelines[index];
                  final delay = delayByIndex(index);
                  return Tiletimeline(
                    timeline: timeline,
                    index: index,
                    delay: delay,
                  );
                },
              ),
            ),
          ),
          Positioned.fill(
            top: 70,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                color: AppColors.darkPrimaryColor,
                child: Text(
                  "Linha do tempo",
                  style: context.textTheme.headline4
                      ?.copyWith(color: AppColors.lightColor)
                      .responsive(context),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  double get widthPath {
    return context.screenSize.width - 100 - 100 - 20 - 100 - 160.0;
  }

  Duration delayByIndex(int index) {
    return Duration(seconds: (4 * index) - 1);
  }

  double get offsetPostionLeft {
    return 70 + 160;
  }

  double offsetPositionTopByIndex(int index) {
    const sizeTimeLine = Tiletimeline.sizeTImeline;
    return (110.0 + 40.0 + sizeTimeLine) + ((sizeTimeLine + 80 + 80) * index);
  }
}
