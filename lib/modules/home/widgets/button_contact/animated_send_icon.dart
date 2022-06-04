import 'package:flutter/material.dart';

class AnimatedSendIcon extends StatefulWidget {
  final AnimationController animationController;
  final bool isExpanded;
  const AnimatedSendIcon(
      {Key? key, required this.animationController, required this.isExpanded})
      : super(key: key);

  @override
  _AnimatedSendIconState createState() => _AnimatedSendIconState();
}

class _AnimatedSendIconState extends State<AnimatedSendIcon>
    with SingleTickerProviderStateMixin {
  late final CurveTween _rotationAnimation;
  @override
  void initState() {
    super.initState();
    _rotationAnimation = CurveTween(curve: Curves.decelerate);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, anim) => RotationTransition(
        turns: _rotationAnimation.animate(widget.animationController),
        child: ScaleTransition(scale: anim, child: child),
      ),
      child: !widget.isExpanded
          ? const Icon(Icons.send_sharp, key: ValueKey(1))
          : const Icon(Icons.close, key: ValueKey(2)),
    );
  }
}
