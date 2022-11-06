import 'package:flutter/material.dart';
import 'package:rennan_portifolio/themes/colors/app_colors.dart';
import 'package:rennan_portifolio/utils/extensions_utils.dart';

// ignore: must_be_immutable
class NavBar extends StatefulWidget {
  final List<NavItem> options;
  final int indexSelected;
  late bool isFirst;
  NavBar({
    Key? key,
    required this.options,
    this.indexSelected = 0,
  })  : isFirst = true,
        super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  late List<GlobalKey> listKeys;
  final double marginHorizontal = 20.0;
  double underLineWidth = 0;
  double positionLeftUnderline = 0;
  bool canAnimate = true;

  @override
  void initState() {
    super.initState();
    listKeys = List.generate(widget.options.length, (_) => GlobalKey());
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isFirst) {
      WidgetsBinding.instance
          .addPostFrameCallback((_) => animateUndelinePosition());
    }

    return Stack(
      children: [
        Row(
          children: List<Widget>.generate(widget.options.length, (index) {
            final navItem = widget.options[index];
            return Container(
              margin: EdgeInsets.symmetric(
                horizontal: marginHorizontal,
              ),
              child: InkWell(
                child: Text(
                  navItem.title,
                  key: listKeys[index],
                  style: styleNav,
                ),
                onTap: () {
                  navItem.onTap();
                },
              ),
            );
          }).toList(),
        ),
        AnimatedPositioned(
          duration: const Duration(
            milliseconds: 500,
          ),
          curve: Curves.decelerate,
          left: positionLeftUnderline,
          bottom: 0,
          child: AnimatedContainer(
            duration: const Duration(
              milliseconds: 300,
            ),
            height: 2,
            width: underLineWidth,
            color: AppColors.secondaryColor,
          ),
        )
      ],
    );
  }

  void animateUndelinePosition() {
    if (!mounted) return;
    widget.isFirst = false;
    setState(() {
      positionLeftUnderline += underLineWidth / 2;
      underLineWidth = 10;
    });
    Future.delayed(const Duration(milliseconds: 350)).then((value) {
      if (!mounted) return;
      setState(() {
        recalculateUnderLineWidth();
        recalculatePositionUndeline();
      });
    });
  }

  void recalculateUnderLineWidth() {
    final navItem = widget.options[widget.indexSelected];
    final width = sizeText(navItem.title).width;
    underLineWidth = width + 20;
  }

  void recalculatePositionUndeline() {
    double offset = marginHorizontal;
    for (int i = 0; i < widget.indexSelected; i++) {
      final navItem = widget.options[i];
      offset += sizeText(navItem.title).width + (marginHorizontal * 2);
    }
    positionLeftUnderline = offset - 10;
  }

  Size sizeText(String text) {
    TextPainter textPainter = TextPainter(
        text: TextSpan(
          text: text,
          style: styleNav,
        ),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(
        minWidth: 0,
        maxWidth: double.infinity,
      );
    return textPainter.size;
  }

  TextStyle? get styleNav {
    return context.textTheme.button?.copyWith(
      color: AppColors.lightColor,
    );
  }
}

class NavItem {
  String title;
  Function onTap;
  NavItem(this.title, this.onTap);
}
