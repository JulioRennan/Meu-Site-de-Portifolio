import 'package:flutter/material.dart';

class TextAnimation extends StatefulWidget {
  final Duration? duration;
  final TextStyle? style;
  final TextAlign? textAlign;
  final String text;
  const TextAnimation(this.text,
      {Key? key, this.duration, this.style, this.textAlign})
      : super(key: key);

  @override
  State<TextAnimation> createState() => _TextAnimationState();
}

class _TextAnimationState extends State<TextAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late final IntTween tween;
  late final Animation<int> writeAnimation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration ??
          Duration(
            milliseconds: 40 * widget.text.length,
          ),
    )..addListener(() => setState(() {}));
    tween = IntTween(begin: 0, end: widget.text.length);
    writeAnimation = tween.animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text.substring(0, writeAnimation.value),
      textAlign: widget.textAlign,
      style: widget.style,
    );
  }
}
