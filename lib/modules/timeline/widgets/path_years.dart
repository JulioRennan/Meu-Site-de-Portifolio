import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:path_drawing/path_drawing.dart';
import 'package:rennan_portifolio/modules/timeline/widgets/tile_timeline.dart';
import 'package:rennan_portifolio/themes/colors/app_colors.dart';

class PathYears extends StatefulWidget {
  final double width;
  final Duration delay;
  final bool cancelAnimation;
  const PathYears({
    Key? key,
    required this.width,
    required this.delay,
    this.cancelAnimation = false,
  }) : super(key: key);

  @override
  State<PathYears> createState() => _PathYearsState();
}

class _PathYearsState extends State<PathYears> {
  late double widthOverlay;
  @override
  void initState() {
    super.initState();
    widthOverlay = widget.width;
    if (widget.cancelAnimation) {
      widthOverlay = 0;
    } else {
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        Future.delayed(widget.delay).then(((_) {
          if (!mounted) return;
          setState(() {
            widthOverlay = 0;
          });
        }));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Tiletimeline.sizeTImeline + 70,
      child: Stack(
        children: [
          CustomPaint(
            painter: DashedPaint(),
            size: Size(widget.width, Tiletimeline.sizeTImeline + 60),
          ),
          Positioned(
            left: 0,
            child: AnimatedContainer(
              width: widthOverlay,
              height: Tiletimeline.sizeTImeline + 70,
              color: AppColors.darkPrimaryColor,
              duration: const Duration(
                seconds: 4,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DashedPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = AppColors.secondaryColor
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke;

    var controlPoint1 = Offset(
      size.width * .10,
      size.height,
    );
    var controlPoint2 = Offset(
      size.width,
      size.height,
    );

    var endPoint = Offset(
      size.width,
      0,
    ); //pontos da reta x= valor máximo e y = 0

    var path = Path();

    path.moveTo(0, size.height);
    path.cubicTo(
      controlPoint1.dx,
      controlPoint1.dy,
      controlPoint2.dx,
      controlPoint2.dy,
      endPoint.dx,
      endPoint.dy,
    );
    canvas.drawPath(
        dashPath(
          path,
          dashArray: CircularIntervalList<double>(<double>[15.0, 10.5]),
        ),
        paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
