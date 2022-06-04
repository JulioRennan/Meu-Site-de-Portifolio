// ignore_for_file: unnecessary_this, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

extension ThemeUtils on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  Size get screenSize => MediaQuery.of(this).size;
  bool get isMobileLayout => screenSize.width < 500;
}

extension TextStyleResponsiveUtils on TextStyle? {
  TextStyle? responsive(BuildContext context) {
    if (context.isMobileLayout && this?.fontSize != null) {
      return this?.copyWith(fontSize: (this!.fontSize! - 4.0));
    }
    return this;
  }
}

extension WidgetsUtils on State {
  setStateSafety(void Function() fn) {
    if (mounted) {
      setState(() => fn());
    }
  }

  addPostFrame({
    Duration? afterDelay,
    required void Function() callback,
  }) {
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      if (afterDelay != null) {
        Future.delayed(afterDelay).then((_) => callback());
      } else {
        callback();
      }
    });
  }
}

extension StringUtils on String {
  String trimAll() {
    return this
        .trim()
        .replaceAll("\n", "")
        .replaceAll("@n", "\n")
        .replaceAll("@t", " " * 4);
  }
}
