import 'package:e_commerce_ui/core/utils/constants/app_constants.dart';
import 'package:e_commerce_ui/core/utils/screens/app_screens.dart';
import 'package:e_commerce_ui/features/onboarding/presentation/widgets/custom_boarding_stack.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingPageBody extends StatefulWidget {
  const OnboardingPageBody({super.key});

  @override
  State<OnboardingPageBody> createState() => _OnboardingPageBodyState();
}

class _OnboardingPageBodyState extends State<OnboardingPageBody> {
  final PageController _pageController = PageController();
  int currentPage = 0;
 
  void nextPage() {
    if (currentPage < AppConstants.pages.length - 1) {
      _pageController.animateToPage(currentPage + 1,
          duration: Duration(microseconds: 400), curve: Curves.easeInOut);
    } else {
      context.go(AppScreens.loginScreen);
    }
  }
  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
          itemCount: AppConstants.pages.length,
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              currentPage = index;
            });
          },
          itemBuilder: (context, index) {
            final page = AppConstants.pages[index];
            return CustomBoardingStack(
                title: page['title']!,
                description: page['desc']!,
                onNext: nextPage);
          });
    
  }
}