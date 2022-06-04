import 'package:flutter/material.dart';
import 'package:rennan_portifolio/data/model/timeline.dart';
import 'package:rennan_portifolio/shared_widgets/animated_widgets/fade_container.dart';
import 'package:rennan_portifolio/themes/colors/app_colors.dart';
import 'package:rennan_portifolio/utils/extensions_utils.dart';

import 'circle_year.dart';

class Tiletimeline extends StatefulWidget {
  static const sizeTImeline = 210.0;
  final Timeline timeline;
  final int index;
  final Duration delay;
  const Tiletimeline({
    Key? key,
    required this.timeline,
    required this.index,
    required this.delay,
  }) : super(key: key);

  @override
  State<Tiletimeline> createState() => _TiletimelineState();
}

class _TiletimelineState extends State<Tiletimeline>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  final spaceBetweenTextAndCircle = 30.0;

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
        });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: context.screenSize.width < 1000 ? 0 : 50,
        vertical: 79,
      ),
      height: Tiletimeline.sizeTImeline,
      child: Row(
        children: [
          if (widget.index.isRightCircle) const Spacer(),
          if (widget.index.isLeftCircle) ...[
            CircleYear(
              animationController: controller,
              year: widget.timeline.year.toString(),
              delayTextYear: widget.delay,
            ),
            SizedBox(
              width: spaceBetweenTextAndCircle,
            )
          ],
          AnimatedContainer(
            duration: const Duration(seconds: 2),
            padding: const EdgeInsets.only(top: 10),
            width: context.screenSize.width < 1200 ? 520 : 700,
            child: FadeContainer(
              delay: widget.delay,
              child: Text(
                widget.timeline.description.trimAll(),
                style: context.textTheme.bodyText1
                    ?.copyWith(
                      color: AppColors.lightSecondary,
                    )
                    .responsive(context),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          if (widget.index.isRightCircle) ...[
            SizedBox(
              width: spaceBetweenTextAndCircle,
            ),
            CircleYear(
              animationController: controller,
              year: widget.timeline.year.toString(),
              delayTextYear: widget.delay,
            ),
          ],
          if (!widget.index.isRightCircle) const Spacer(),
        ],
      ),
    );
  }
}

extension on int {
  bool get isRightCircle {
    return this % 2 == 0;
  }

  bool get isLeftCircle {
    return !isRightCircle;
  }
}
