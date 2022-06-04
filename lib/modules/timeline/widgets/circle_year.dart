import 'package:flutter/material.dart';
import 'package:rennan_portifolio/shared_widgets/animated_widgets/fade_container.dart';
import 'package:rennan_portifolio/themes/colors/app_colors.dart';
import 'dart:math' as math;

import 'package:rennan_portifolio/utils/extensions_utils.dart';

class CircleYear extends StatefulWidget {
  final AnimationController? animationController;
  final String year;
  final Duration? delayTextYear;
  final double diameter;
  final double strokeWidth;

  const CircleYear({
    Key? key,
    this.animationController,
    required this.year,
    this.delayTextYear,
    this.diameter = 160.0,
    this.strokeWidth = 10,
  }) : super(key: key);

  @override
  State<CircleYear> createState() => _CircleYearState();
}

class _CircleYearState extends State<CircleYear>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  final tween = Tween<double>(begin: 0.0, end: 24);
  late final Animation<double> drawCircleAnimation;

  late final Animation<int> textAnimation;

  @override
  void initState() {
    super.initState();
    controller = widget.animationController ??
        AnimationController(
          duration: const Duration(seconds: 2),
          vsync: this,
        )
      ..addListener(() {
        setState(() {});
      });
    drawCircleAnimation = tween
        .animate(CurvedAnimation(parent: controller, curve: Curves.decelerate));
  }

  @override
  void dispose() {
    if (widget.animationController == null) controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.diameter,
      height: widget.diameter,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: AppColors.darkPrimaryColor,
      ),
      child: CustomPaint(
        size: Size(widget.diameter, widget.diameter),
        painter: CirclePainter(
          degree: drawCircleAnimation.value * 15,
          diameter: widget.diameter,
          strokeWidth: widget.strokeWidth,
        ),
        child: FadeContainer(
          delay: widget.delayTextYear,
          child: Center(
            child: Text(
              widget.year,
              style: context.textTheme.headline5
                  ?.copyWith(color: AppColors.lightColor)
                  .responsive(context),
            ),
          ),
        ),
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  final double degree;
  final double diameter;
  final double strokeWidth;
  CirclePainter(
      {required this.degree,
      required this.diameter,
      required this.strokeWidth});
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = AppColors.secondaryColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    final center = Offset(size.width / 2, size.height / 2);
    double degToRad(double deg) => deg * (math.pi / 180.0);
    canvas.drawArc(
      Rect.fromCircle(
        center: center,
        radius: diameter / 2,
      ), // 5.
      degToRad(0), // 6.
      degToRad(degree), // 7.
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
