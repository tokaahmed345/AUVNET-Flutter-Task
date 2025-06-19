

import 'package:e_commerce_ui/core/utils/colors/app_colors.dart';
import 'package:e_commerce_ui/core/utils/styles/app_styles.dart';
import 'package:flutter/material.dart';

class ServicesComponent extends StatelessWidget {
  final String serviceImage;
  final String serviceBadgeText;
  final String serviceTitle;

  const ServicesComponent({
    super.key,
    required this.serviceImage,
    required this.serviceBadgeText,
    required this.serviceTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 24),
          decoration: BoxDecoration(
            color: AppColors.greyF5Color,
            borderRadius: BorderRadius.circular(10),
          ),

          child: Image.network(serviceImage),
        ),

        Container(
          padding: EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: AppColors.purpleColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            serviceBadgeText,
            style: AppStyles.sans20Bold.copyWith(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Text(

          serviceTitle,
          textAlign: TextAlign.center,
          style: AppStyles.sans20Bold.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
