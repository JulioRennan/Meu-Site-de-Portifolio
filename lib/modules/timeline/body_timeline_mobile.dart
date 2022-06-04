import 'package:flutter/material.dart';
import 'package:rennan_portifolio/data/model/timeline.dart';
import 'package:rennan_portifolio/themes/colors/app_colors.dart';
import 'package:rennan_portifolio/utils/extensions_utils.dart';
import 'widgets/tile_timeline_mobile.dart';

class BodyTimelineMobile extends StatefulWidget {
  final List<Timeline> timelines;
  const BodyTimelineMobile({
    Key? key,
    required this.timelines,
  }) : super(key: key);

  @override
  State<BodyTimelineMobile> createState() => _BodyTimelineMobileState();
}

class _BodyTimelineMobileState extends State<BodyTimelineMobile>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  late final List<GlobalKey> keysTimelines;
  @override
  void initState() {
    super.initState();
    keysTimelines = List.generate(widget.timelines.length, (_) => GlobalKey());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.darkPrimaryColor,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(
                  top: 30,
                  bottom: 10,
                ),
                width: double.infinity,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.secondaryColor,
                    width: 5,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: List.generate(
                    widget.timelines.length,
                    (index) {
                      final timeline = widget.timelines[index];
                      final delay = Duration(seconds: (3 * index) - 1);
                      return TiletimelineMobile(
                        key: keysTimelines[index],
                        timeline: timeline,
                        index: index,
                        delay: delay,
                      );
                    },
                  ),
                ),
              ),
              Positioned.fill(
                top: 0,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    color: AppColors.darkPrimaryColor,
                    child: Text(
                      "Linha do tempo",
                      style: context.textTheme.headline5
                          ?.copyWith(color: AppColors.lightColor)
                          .responsive(context),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
