import 'package:flutter/material.dart';
import 'package:rennan_portifolio/utils/extensions_utils.dart';

class DividerAnimated extends StatefulWidget {
  final double? height;
  final double? width;
  final Color? color;
  final Duration? afterDelay;

  const DividerAnimated(
      {Key? key, this.width, this.height, this.color, this.afterDelay})
      : super(key: key);

  @override
  State<DividerAnimated> createState() => _DividerAnimatedState();
}

class _DividerAnimatedState extends State<DividerAnimated> {
  double? width = 0;
  @override
  void initState() {
    super.initState();
    addPostFrame(
      afterDelay: widget.afterDelay,
      callback: () {
        setStateSafety(() => width = widget.width);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: width,
      height: widget.height,
      color: widget.color,
      curve: Curves.decelerate,
      duration: const Duration(seconds: 1),
    );
  }
}
