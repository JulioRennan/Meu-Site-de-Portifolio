import 'package:flutter/material.dart';
import 'package:rennan_portifolio/utils/manager_path.dart';

class BackgroundHome extends StatelessWidget {
  const BackgroundHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Opacity(
      opacity: 0.2,
      child: Image(
        image: AssetImage(ManagerPath.backgroundHome),
        fit: BoxFit.cover,
        height: 800,
        width: double.infinity,
      ),
    );
  }
}
