import 'package:flutter/material.dart';
import 'package:rennan_portifolio/shared_widgets/animated_widgets/fade_container.dart';

class OverlayContainer extends StatefulWidget {
  final Widget child;
  final Widget overlay;
  const OverlayContainer({
    Key? key,
    required this.child,
    required this.overlay,
  }) : super(key: key);

  @override
  State<OverlayContainer> createState() => _OverlayContainerState();
}

class _OverlayContainerState extends State<OverlayContainer> {
  bool canShowOverlay = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          canShowOverlay = !canShowOverlay;
        });
      },
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            canShowOverlay = true;
          });
        },
        onExit: (_) {
          setState(() {
            canShowOverlay = false;
          });
        },
        child: Stack(
          children: [
            widget.child,
            FadeContainer(
              child: widget.overlay,
              delay: Duration.zero,
              opacity: canShowOverlay ? 1 : 0,
              durationAnimation: const Duration(milliseconds: 300),
            )
          ],
        ),
      ),
    );
  }
}
