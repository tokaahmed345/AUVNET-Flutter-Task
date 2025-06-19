import 'package:e_commerce_ui/core/utils/colors/app_colors.dart';
import 'package:e_commerce_ui/core/utils/constants/constants.dart';
import 'package:e_commerce_ui/features/authentication/presentation/widgets/custom_txt.dart';
import 'package:flutter/material.dart';

class MyTxtButton extends StatelessWidget {
  const MyTxtButton({
    super.key,
    this.height,
    this.width,
    this.padding,
    this.onPressed,
    this.text,
    this.fontSize,
    this.fontColor,
    this.isEnabled,
  });

  final double? height;
  final double? width;
  final double? padding;
  final Function()? onPressed;

  final String? text;
  final double? fontSize;
  final Color? fontColor;

  final bool? isEnabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 00.00,
        vertical: txtFieldVerticalPadding,
      ),
      child: TextButton(
        onPressed: onPressed,
        child: MyText(text: text, color: AppColors.blueColor),
      ),
    );
  }
}
