import 'package:e_commerce_ui/core/utils/assets/app_assets.dart';
import 'package:e_commerce_ui/core/utils/colors/app_colors.dart';
import 'package:e_commerce_ui/core/utils/styles/app_styles.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomBottomNavBar extends StatefulWidget {
   CustomBottomNavBar({super.key});
    int currentIndex = 0;


  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return   BottomNavigationBar(
      backgroundColor: AppColors.whiteColor,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            AppAssets.homeIcon,
            fit: BoxFit.fill,
            width: 30,
            height: 30,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage(AppAssets.categoriesIcon)),
          label: 'categories',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage(AppAssets.deliverIcon)),
          label: 'deliver',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage(AppAssets.cartIcon)),
          label: 'cart',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage(AppAssets.profileIcon)),
          label: 'profile',
        ),
      ],
      currentIndex:widget.currentIndex,
      selectedItemColor: AppColors.purpleColor,
      unselectedItemColor: AppColors.greyColor,
      onTap: (index) {
        if (index == 0) {
          setState(() {
            widget.currentIndex = index;
          });
        } 
        else {
          showDialog(
            context: context,
            builder:
                (context) => AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  backgroundColor: AppColors.whiteColor,
                  title: Text(
                    'Coming Soon!',
                    style: AppStyles.sans20Bold.copyWith(
                      color: AppColors.purpleColor,
                    ),
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(AppAssets.animationImage, height: 100),
                      SizedBox(height: 12),
                      Text(
                        'This section is still under construction. Stay tuned!',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: AppColors.greyColor),
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'OK',
                        style: TextStyle(color: AppColors.purpleColor),
                      ),
                    ),
                  ],
                ),
          );
        }
      },
    );
  }
  }
