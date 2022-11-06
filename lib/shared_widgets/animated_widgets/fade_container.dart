import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class FadeContainer extends StatefulWidget {
  final Widget child;
  final Duration? delay;
  final Duration? durationAnimation;
  final double? opacity;
  
  const FadeContainer({
    Key? key,
    required this.child,
    this.delay,
    this.durationAnimation,
    this.opacity,
  }) : super(key: key);

  @override
  _FadeContainerState createState() => _FadeContainerState();
}

class _FadeContainerState extends State<FadeContainer> {
  double opacity = 0;
  @override
  void initState() {
    super.initState();
    if (widget.opacity == null) {
      SchedulerBinding.instance?.addPostFrameCallback((_) {
        Future.delayed(widget.delay ?? const Duration(milliseconds: 200))
            .then((value) {
          if (!mounted) return;
          setState(() {
            opacity = 1;
          });
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: widget.opacity ?? opacity,
      duration: widget.durationAnimation ?? const Duration(milliseconds: 800),
      child: widget.child,
    );
  }
}
