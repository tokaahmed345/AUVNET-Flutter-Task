import 'package:e_commerce_ui/core/utils/assets/app_assets.dart';
import 'package:e_commerce_ui/core/utils/colors/app_colors.dart';
import 'package:e_commerce_ui/core/utils/styles/app_styles.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String userName;
  final String address;

  const CustomContainer({
    super.key,
    required this.userName,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(26),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        gradient: LinearGradient(
          colors: [AppColors.purpleColor, AppColors.yellowColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Delivering to',
                  style: AppStyles.sans20Bold.copyWith(fontSize: 12),
                ),
                Text(
                  address,
                  style: AppStyles.sans20Bold.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Hi $userName! ', style: AppStyles.whiteRubik30Bold),
              ],
            ),
            CircleAvatar(radius: 45, child: Image.asset(AppAssets.profilePic)),
          ],
        ),
      ),
    );
  }
}
