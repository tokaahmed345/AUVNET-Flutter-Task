import 'package:e_commerce_ui/core/utils/assets/app_assets.dart';
import 'package:e_commerce_ui/core/utils/colors/app_colors.dart';
import 'package:e_commerce_ui/core/utils/styles/app_styles.dart';
import 'package:flutter/material.dart';

class PopularRestaurantsComponent extends StatelessWidget {
  final String restRestaurantLogo;
  final String restRestaurantName;
  final String restRestaurantDuration;

  const PopularRestaurantsComponent({
    super.key,
    required this.restRestaurantLogo,
    required this.restRestaurantName,
    required this.restRestaurantDuration,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 80,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.whiteColor,
            border: Border.all(color: AppColors.greyD95Color),
          ),
          clipBehavior: Clip.antiAlias,
          child: restRestaurantLogo.isNotEmpty
              ? Image.network(
                  restRestaurantLogo,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.error, color: Colors.red),
                )
              : const Icon(Icons.restaurant, color: Colors.grey),
        ),
        const SizedBox(height: 6),
        Text(
          restRestaurantName,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppStyles.sans20Bold.copyWith(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: AppColors.grey33Color,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageIcon(
              AssetImage(AppAssets.clockIcon),
              size: 14,
              color: AppColors.greyColor,
            ),
            const SizedBox(width: 4),
            Text(
              restRestaurantDuration,
              style: AppStyles.sans20Bold.copyWith(
                color: AppColors.greyColor.withOpacity(0.6),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
