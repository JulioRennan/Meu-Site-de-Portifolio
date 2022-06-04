import 'package:flutter/material.dart';
import 'package:rennan_portifolio/data/model/timeline.dart';
import 'package:rennan_portifolio/modules/timeline/widgets/divider_animated.dart';
import 'package:rennan_portifolio/shared_widgets/animated_widgets/fade_container.dart';
import 'package:rennan_portifolio/themes/colors/app_colors.dart';
import 'package:rennan_portifolio/utils/extensions_utils.dart';
import 'circle_year.dart';

class TiletimelineMobile extends StatefulWidget {
  final Timeline timeline;
  final int index;
  final Duration delay;
  const TiletimelineMobile({
    Key? key,
    required this.timeline,
    required this.index,
    required this.delay,
  }) : super(key: key);

  @override
  State<TiletimelineMobile> createState() => _TiletimelineMobileState();
}

class _TiletimelineMobileState extends State<TiletimelineMobile>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  final spaceBetweenTextAndCircle = 30.0;
  bool canShowWidget = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    addPostFrame(
      afterDelay: widget.delay,
      callback: () {
        if (mounted) controller.forward();
        setStateSafety(() {
          canShowWidget = true;
        });
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 15,
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Positioned.fill(
                child: Center(
                  child: DividerAnimated(
                    color: AppColors.secondaryColor,
                    afterDelay:
                        widget.delay + const Duration(milliseconds: 1800),
                    height: 5,
                    width: context.screenSize.width,
                  ),
                ),
              ),
              Center(
                child: CircleYear(
                  animationController: controller,
                  diameter: 110,
                  strokeWidth: 5,
                  year: widget.timeline.year.toString(),
                  delayTextYear: widget.delay,
                ),
              ),
            ],
          ),
          SizedBox(
            height: spaceBetweenTextAndCircle,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: FadeContainer(
              delay: widget.delay,
              child: Text(
                widget.timeline.description.trimAll(),
                style: context.textTheme.bodyText1
                    ?.copyWith(color: AppColors.lightSecondary)
                    .responsive(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
