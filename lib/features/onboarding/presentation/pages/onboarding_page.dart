import 'package:e_commerce_ui/core/utils/colors/app_colors.dart';
import 'package:e_commerce_ui/features/onboarding/presentation/widgets/onboarding_page_body.dart';
import 'package:flutter/material.dart';
class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});
  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}
class _OnBoardingPageState extends State<OnBoardingPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: OnboardingPageBody(),
    );
  }
}
