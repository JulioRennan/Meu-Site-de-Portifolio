// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

import 'package:flutter/material.dart';

class LinkContainer extends StatelessWidget {
  final Widget child;
  final String url;
  const LinkContainer({
    Key? key,
    required this.url,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        js.context.callMethod('open', [url]);
      },
      child: child,
    );
  }
}
