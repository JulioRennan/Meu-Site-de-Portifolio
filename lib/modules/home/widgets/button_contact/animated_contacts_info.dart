import 'package:flutter/material.dart';
import 'package:rennan_portifolio/data/payloads/social_media_payload.dart';
import 'package:rennan_portifolio/shared_widgets/widgets/link_container.dart';
import 'package:rennan_portifolio/themes/colors/app_colors.dart';

class AnimatedContactInfo extends StatefulWidget {
  final bool isExpanded;
  const AnimatedContactInfo({
    Key? key,
    this.isExpanded = false,
  }) : super(key: key);

  @override
  _AnimatedContactInfoState createState() => _AnimatedContactInfoState();
}

class _AnimatedContactInfoState extends State<AnimatedContactInfo> {
  final duration = const Duration(milliseconds: 400);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: InversedCornerClipper(),
      child: AnimatedContainer(
        duration: duration,
        height: 55,
        width: widget.isExpanded ? listSocialMedias.length * 55 : 0,
        padding: const EdgeInsets.only(left: 30, right: 5, top: 5, bottom: 5),
        decoration: BoxDecoration(
          color: AppColors.secondaryColor.withOpacity(.3),
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(18),
          ),
        ),
        child: Stack(
          fit: StackFit.passthrough,
          children: List.generate(listSocialMedias.length, (index) {
            final socialMedia = listSocialMedias[index];
            return AnimatedPositioned(
              left: widget.isExpanded ? index * 45 : 0,
              duration: duration,
              child: LinkContainer(
                url: socialMedia.url,
                child: IconSocialMedia(socialMedia.imagePath),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class IconSocialMedia extends StatelessWidget {
  final String imagePath;
  const IconSocialMedia(
    this.imagePath, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      width: 35,
      color: AppColors.lightColor,
    );
  }
}

class InversedCornerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final controlPoint = Offset(35, size.height * 0.45);
    final endPoint = Offset(0, size.height);
    Path path = Path()
      ..moveTo(5, 0)
      ..quadraticBezierTo(
        controlPoint.dx,
        controlPoint.dy,
        endPoint.dx,
        endPoint.dy,
      )
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..lineTo(0, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
