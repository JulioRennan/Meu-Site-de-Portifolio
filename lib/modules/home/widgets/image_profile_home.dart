import 'package:flutter/material.dart';
import 'package:rennan_portifolio/utils/manager_path.dart';

class ImageProfileHome extends StatelessWidget {
  const ImageProfileHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) {
        return const LinearGradient(
          begin: Alignment.center,
          end: Alignment.centerLeft,
          colors: [Colors.white, Colors.transparent],
        ).createShader(Rect.fromLTRB(
          0,
          0,
          rect.width * .5,
          rect.height * .85,
        ));
      },
      blendMode: BlendMode.dstIn,
      child: Image.asset(
        ManagerPath.mainImagePerson,
        width: widthImage(context),
      ),
    );
  }

  double widthImage(BuildContext context) {
    double estimatedWidth = MediaQuery.of(context).size.width * 0.5;
    double maxWidth = 600;
    if (estimatedWidth < maxWidth) {
      return estimatedWidth;
    } else {
      return maxWidth;
    }
  }
}
