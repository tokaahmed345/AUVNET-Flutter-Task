import 'package:e_commerce_ui/core/utils/assets/app_assets.dart';
import 'package:e_commerce_ui/core/utils/colors/app_colors.dart';
import 'package:e_commerce_ui/core/utils/styles/app_styles.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(
              0.1,
            ), // First shadow: 10% black opacity
            spreadRadius: 0, // Spread: 0
            blurRadius: 4, // Blur: 4
            offset: const Offset(-2, -2), // Position: X: -2, Y: -2
          ),
          BoxShadow(
            color: Colors.black.withOpacity(
           0.1,
            ), // Second shadow: 10% black opacity
            spreadRadius: 0, // Spread: 0
            blurRadius: 4, // Blur: 4
            offset: const Offset(2, 2), // Position: X: 2, Y: 2
          ),
        ],
      ),
      child: ListTile(
        titleAlignment: ListTileTitleAlignment.bottom,
        contentPadding: EdgeInsets.all(16),
        horizontalTitleGap: 6,
        leading: Image.asset(
          width: 80,
          height: 80,
          AppAssets.getcodePic,
          fit: BoxFit.cover,
        ),
        title: Text(
          'Got a code !',
          style:  AppStyles.sans20Bold.copyWith(
            fontSize: 16,
        )),
        subtitle: Text(
          'Add your code and save on your\norder',
          style:AppStyles.sans20Bold.copyWith(
            fontSize: 12,
            color: AppColors.greyColor,
          ),
        ),
      ),
    );
  }
}
