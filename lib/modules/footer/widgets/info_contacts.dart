import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rennan_portifolio/data/payloads/social_media_payload.dart';
import 'package:rennan_portifolio/shared_widgets/widgets/link_container.dart';
import 'package:rennan_portifolio/themes/colors/app_colors.dart';
import 'package:rennan_portifolio/utils/extensions_utils.dart';

class InfoContacts extends StatefulWidget {
  const InfoContacts({Key? key}) : super(key: key);

  @override
  State<InfoContacts> createState() => _InfoContactsState();
}

class _InfoContactsState extends State<InfoContacts> {
  Timer? timerFloatingAnimation;
  late final List<double> positions;
  final defaultposition = 70;
  bool isFirst = true;

  @override
  void initState() {
    super.initState();
    positions = List.generate(listSocialMedias.length, (index) => 50);
    addPostFrame(callback: () {
      setStateSafety(() {
        isFirst = false;
      });
      Future.delayed(
        const Duration(seconds: 2),
      ).then((value) => startFloatingAnimation());
    });
  }

  @override
  void dispose() {
    timerFloatingAnimation?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.0 * listSocialMedias.length,
      height: 120,
      alignment: Alignment.center,
      child: Stack(
        children: [
          for (int i = 0; i < listSocialMedias.length; i++) ...[
            AnimatedPositioned(
              left: isFirst ? 0 : i * 70,
              duration: const Duration(milliseconds: 1200),
              top: positions[i],
              child: LinkContainer(
                url: listSocialMedias[i].url,
                child: Image.asset(
                  listSocialMedias[i].imagePath,
                  width: 50,
                  color: AppColors.lightSecondary,
                ),
              ),
            ),
          ]
        ],
      ),
    );
  }

  startFloatingAnimation() {
    int index = 0;
    final lenght = positions.length;
    timerFloatingAnimation =
        Timer.periodic(const Duration(milliseconds: 500), (_) async {
      try {
        final indexToFloating = index % lenght;
        setStateSafety(() {
          positions[indexToFloating] = 40;
        });
        await Future.delayed(
          const Duration(milliseconds: 500),
        );
        setStateSafety(() {
          positions[indexToFloating] = 50;
        });
        index++;
      } catch (_) {}
    });
  }
}
