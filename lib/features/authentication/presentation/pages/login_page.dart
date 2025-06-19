import 'package:e_commerce_ui/core/utils/assets/app_assets.dart';
import 'package:e_commerce_ui/core/utils/colors/app_colors.dart';
import 'package:e_commerce_ui/core/utils/constants/constants.dart';
import 'package:e_commerce_ui/core/utils/functions/cache_user.dart';
import 'package:e_commerce_ui/core/utils/functions/txt_field_validations.dart';
import 'package:e_commerce_ui/core/utils/screens/app_screens.dart';
import 'package:e_commerce_ui/features/authentication/data/data_sources/auth_remote_data_source.dart';
import 'package:e_commerce_ui/features/authentication/data/data_sources/auth_local_data_source.dart';
import 'package:e_commerce_ui/features/authentication/data/repos/user_repo_impl.dart';
import 'package:e_commerce_ui/features/authentication/presentation/widgets/custom_elevated_button.dart';
import 'package:e_commerce_ui/features/authentication/presentation/widgets/custom_txt_button.dart';
import 'package:e_commerce_ui/features/authentication/presentation/widgets/custom_txt_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  bool isEmailHasFocus = false;
  bool isPasswordHasFocus = false;

  AuthRemoteDataSource authRemoteDataSource = AuthRemoteDataSource(
    firebaseAuth: FirebaseAuth.instance,
    cacheUser: CacheUser(),
  );
  AuthLocalDataSource authLocalDataSource = AuthLocalDataSource(
    cacheUser: CacheUser(),
  );
  late AuthRepositoryImpl authRepository;

  @override
  void initState() {
    super.initState();
    authRepository = AuthRepositoryImpl(
      authRemoteDataSource,
      authLocalDataSource,
      CacheUser(),
    );

    initFocusNodes();
  }

  @override
  void dispose() {
    super.dispose();
    disposeFocusNodes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: logInFormKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SafeArea(child: const SizedBox(height: 120)),
              Center(child: Image.asset(AppAssets.logoImage)),
              const SizedBox(height: 140),
              MyTxtFormField(
                controller: emailTextEditingController,
                focusNode: emailFocusNode,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: AppColors.greyColor,
                ),
                label: "mail",
                hint: "enter your correct mail ",

                onValidate: (val) {
                  if (isEmailHasFocus) {
                    return validateEmailExpression(
                      emailTextEditingController.text,
                    );
                  }
                  return null;
                },
              ),

              MyTxtFormField(
                controller: passwordTextEditingController,
                focusNode: passwordFocusNode,
                keyboardType: TextInputType.visiblePassword,

                prefixIcon: Icon(
                  Icons.lock_outlined,
                  color: AppColors.greyColor,
                ),
                label: "password",
                hint: "enter strong password ",
                maxLength: 12,
                onValidate: (val) {
                  if (isPasswordHasFocus) {
                    return validatePassword(passwordTextEditingController.text);
                  }
                  return null;
                },
              ),

              MyElevatedButton(
                backgroundColor: WidgetStateProperty.all(AppColors.purpleColor),
                onPressed: () async {
                  final email = emailTextEditingController.text.trim();
                  final password = passwordTextEditingController.text.trim();

                  if (email.isEmpty || password.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      
                      SnackBar(
                        duration: const Duration(seconds: 3),
                        content: Text(
                          "Please enter both email and password correctly.",
                        ),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }

                  try {
                    await authRepository.signIn(
                      email: email,
                      password: password,
                    );

                    context.go(AppScreens.homeScreen);
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          e.toString().replaceFirst("Exception: ", ""),
                        ),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                child: Text(
                  "Log in",
                  style: TextStyle(color: AppColors.whiteColor, fontSize: 18),
                ),
              ),

              MyTxtButton(
                text: "Create an account",
                onPressed: () {
                  context.go(AppScreens.signUpScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  initFocusNodes() {
    emailFocusNode.addListener(() {
      if (emailFocusNode.hasFocus && !isEmailHasFocus) {
        setState(() {
          isEmailHasFocus = true;
        });
      }
    });

    passwordFocusNode.addListener(() {
      if (passwordFocusNode.hasFocus && !isPasswordHasFocus) {
        setState(() {
          isPasswordHasFocus = true;
        });
      }
    });
  }

  disposeFocusNodes() {
    emailFocusNode.dispose();
    passwordFocusNode.dispose();

    isEmailHasFocus = false;
    isPasswordHasFocus = false;
  }
}
