import 'package:e_commerce_ui/core/utils/colors/app_colors.dart';
import 'package:e_commerce_ui/core/utils/styles/app_styles.dart';
import 'package:flutter/material.dart';

class ShortcutsComponent extends StatelessWidget {
  final String shortcutImage;
  final String shortcutName;

  const ShortcutsComponent({
    super.key,
    required this.shortcutImage,
    required this.shortcutName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 65,
          height: 65,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.lightOrangeColor,
          ),
          child: Image.asset(shortcutImage),
        ),

        Text(
          shortcutName,
          style:AppStyles.sans20Bold.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppColors.grey33Color,
          ),
        ),
      ],
    );
  }
}
