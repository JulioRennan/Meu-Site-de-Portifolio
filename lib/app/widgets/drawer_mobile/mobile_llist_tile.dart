import 'package:flutter/material.dart';
import 'package:rennan_portifolio/utils/extensions_utils.dart';

import '../../../themes/colors/app_colors.dart';

class MobileListTile extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  final IconData iconData;
  const MobileListTile({
    Key? key,
    this.onTap,
    required this.title,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      leading: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Icon(iconData),
      ),
      contentPadding: EdgeInsets.zero,
      iconColor: AppColors.lightSecondary,
      title: Text(
        title,
        style: context.textTheme.button
            ?.copyWith(color: AppColors.lightColor)
            .responsive(context),
      ),
      onTap: onTap,
    );
  }
}
