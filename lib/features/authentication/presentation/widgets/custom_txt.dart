import 'package:e_commerce_ui/core/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  const MyText({super.key, required this.text, this.fontSize, this.color, this.maxLines});
  final String? text;
  final double? fontSize;
  final Color? color;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only (left: 24.0),
      child: Text(
        text!,
        textAlign: TextAlign.center,
        maxLines: maxLines ?? 1,
        style: TextStyle(
          fontSize: fontSize ?? 18,
          color: AppColors.blueColor,
          
        
        ),
        
      ),
    );
  }
}
