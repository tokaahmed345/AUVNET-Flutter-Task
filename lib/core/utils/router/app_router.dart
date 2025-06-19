import 'package:e_commerce_ui/core/utils/screens/app_screens.dart';
import 'package:e_commerce_ui/features/authentication/presentation/pages/login_page.dart';
import 'package:e_commerce_ui/features/authentication/presentation/pages/sign_up_page.dart';
import 'package:e_commerce_ui/features/home/presentation/pages/home_page.dart';
import 'package:e_commerce_ui/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: AppScreens.onboarding,
        builder: (context, state) {
          return  const  OnBoardingPage();
        },
      ),
      GoRoute(
        path: AppScreens.loginScreen,
        builder: (context, state) {
          return const LoginPage();
        },
      ),
      GoRoute(
        path: AppScreens.signUpScreen,
        builder: (context, state) {
          return const SignUpPage();
        },
      ),
      GoRoute(
        path: AppScreens.homeScreen,
        builder: (context, state) {
          return const HomePage() ;
        },
      ),
    ],
  );
}
