
import 'package:e_commerce_ui/core/helper/custom_clipper.dart';
import 'package:e_commerce_ui/core/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';

class CustomClipPath extends StatelessWidget {
  const CustomClipPath({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CrescentTopLeftClipper(),
      child: Container(
        height: 240,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            stops: [0, .8],
            tileMode: TileMode.mirror,
            colors: [
        AppColors.firstGrediantPurpleColor,
        AppColors.secondGredientYellowColor,],
            begin: Alignment.topLeft,
            end: Alignment.topRight,
          ),
        ),
      ),
    );
  }
}

