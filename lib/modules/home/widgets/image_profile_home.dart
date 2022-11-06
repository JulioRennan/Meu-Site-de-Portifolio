import 'package:flutter/material.dart';
import 'package:rennan_portifolio/utils/manager_path.dart';

class ImageProfileHome extends StatelessWidget {
  const ImageProfileHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ManagerPath.mainImagePerson,
      width: widthImage(context),
    );
  }

  double widthImage(BuildContext context) {
    double estimatedWidth = MediaQuery.of(context).size.width * 0.5;
    double maxWidth = 700;
    if (estimatedWidth < maxWidth) {
      return estimatedWidth;
    } else {
      return maxWidth;
    }
  }
}
