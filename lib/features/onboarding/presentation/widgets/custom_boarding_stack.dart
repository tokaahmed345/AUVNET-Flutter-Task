import 'package:e_commerce_ui/core/utils/assets/app_assets.dart';
import 'package:e_commerce_ui/core/utils/colors/app_colors.dart';
import 'package:e_commerce_ui/core/utils/screens/app_screens.dart';
import 'package:e_commerce_ui/core/utils/styles/app_styles.dart';
import 'package:e_commerce_ui/features/onboarding/presentation/widgets/custom_clip_path.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBoardingStack extends StatelessWidget {
  const CustomBoardingStack({
    super.key,
    required this.title,
    required this.description,
    required this.onNext,
  });
  final String title;
  final String description;
  final VoidCallback onNext;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomClipPath(),
        Positioned(
          bottom: 0,
          left: 100,
          right: 0,
          child: Container(
            height: 220,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.topLeft,
                colors: [AppColors.mintGreenColor, AppColors.whiteColor],
                stops: [0.0, 1.0],
              ),
            ),
          ),
        ),
        //h
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                  const Spacer(flex: 5),

              Image.asset(AppAssets.logoImage),
              const SizedBox(height: 20),
              Text(title, style: AppStyles.rubik28W500),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  style: AppStyles.greyRubik14W400,
                ),
              ),
              const Spacer(flex: 3),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0 ),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => context.go(AppScreens.loginScreen),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size.fromWidth(double.infinity),
                      backgroundColor: AppColors.purpleColor,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text('Get Started', style: AppStyles.whiteRubik20),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              GestureDetector(
                onTap: onNext,
                child: Text('next', style: AppStyles.greyRubik14W400),
              ),
              Spacer(flex: 2),
            ],
          ),
        ),
      ],
    );
  }
}
