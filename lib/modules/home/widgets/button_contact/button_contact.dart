import 'package:flutter/material.dart';
import 'package:rennan_portifolio/shared_widgets/animated_widgets/fade_container.dart';
import 'package:rennan_portifolio/themes/colors/app_colors.dart';
import 'package:rennan_portifolio/utils/extensions_utils.dart';

import 'animated_contacts_info.dart';
import 'animated_send_icon.dart';

class ButtonContact extends StatefulWidget {
  const ButtonContact({Key? key}) : super(key: key);

  @override
  _ButtonContactState createState() => _ButtonContactState();
}

class _ButtonContactState extends State<ButtonContact>
    with SingleTickerProviderStateMixin {
  final double widthButton = 180;
  final durationContainer = const Duration(milliseconds: 200);
  double? width;
  double radiusButton = 5;

  bool showText = true;
  bool isExpanded = false;
  late final AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    width = widthButton;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  bool first = true;
  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return SizedBox(
      width: 300,
      child: Stack(
        children: [
          Material(
            color: Colors.transparent,
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.circular(radiusButton),
            child: InkWell(
              splashColor: AppColors.secondaryColor,
              onTap: () {
                setState(() {
                  if (showText) {
                    fowardAnimation();
                  } else {
                    reverseAnimation();
                  }
                });
              },
              child: AnimatedContainer(
                width: width,
                height: 50,
                duration: durationContainer,
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor.withOpacity(.3),
                  borderRadius: BorderRadius.circular(radiusButton),
                ),
                child: !showText
                    ? AnimatedSendIcon(
                        animationController: _animationController,
                        isExpanded: isExpanded,
                      )
                    : Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: AnimatedSendIcon(
                              animationController: _animationController,
                              isExpanded: isExpanded,
                            ),
                          ),
                          Flexible(
                            flex: 5,
                            child: FadeContainer(
                              child: Text(
                                "Entre em contato",
                                style: textTheme.button
                                    ?.copyWith(color: AppColors.lightSecondary),
                                maxLines: 2,
                                overflow: TextOverflow.fade,
                              ),
                            ),
                          )
                        ],
                      ),
              ),
            ),
          ),
          Positioned(
            left: 35,
            child: AnimatedContactInfo(
              isExpanded: isExpanded,
            ),
          )
        ],
      ),
    );
  }

  fowardAnimation() {
    radiusButton = 100;
    width = 50;
    showText = false;
    isExpanded = true;
    _animationController.forward(from: 0);
  }

  reverseAnimation() {
    radiusButton = 5;
    width = widthButton;
    showText = true;
    isExpanded = false;
    _animationController.forward(from: 0);
  }
}
