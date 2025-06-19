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
import 'package:e_commerce_ui/features/authentication/presentation/widgets/custom_txt.dart';
import 'package:e_commerce_ui/features/authentication/presentation/widgets/custom_txt_button.dart';
import 'package:e_commerce_ui/features/authentication/presentation/widgets/custom_txt_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();
  final TextEditingController confirmPasswordTextEditingController =
      TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();

  bool isEmailHasFocus = false;
  bool isPasswordHasFocus = false;
  bool isConfirmPasswordHasFocus = false;

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
          key: signUpFormKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SafeArea(child: const SizedBox(height: 120)),
              Center(child: Image.asset(AppAssets.logoImage)),
              const SizedBox(height: 80),
              MyTxtFormField(
                controller: emailTextEditingController,
                focusNode: emailFocusNode,
                keyboardType: TextInputType.emailAddress,
                label: "mail",
                hint: "enter your correct mail ",
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: AppColors.greyColor,
                ),
                onValidate: (val) {
                  if (isEmailHasFocus) {
                    return validateEmailExpression(val);
                  }
                  return null;
                },
              ),

              MyTxtFormField(
                controller: passwordTextEditingController,
                focusNode: passwordFocusNode,
                keyboardType: TextInputType.visiblePassword,
                label: "password",
                hint: "enter strong password ",

                prefixIcon: Icon(
                  Icons.lock_outlined,
                  color: AppColors.greyColor,
                ),
                maxLength: 12,
                onValidate: (val) {
                  if (isPasswordHasFocus) {
                    return validatePassword(val);
                  }
                  return null;
                },
              ),
              MyTxtFormField(
                controller: confirmPasswordTextEditingController,
                focusNode: confirmPasswordFocusNode,
                keyboardType: TextInputType.visiblePassword,

                label: "confirm password",
                hint: "rewrite same password ",
                maxLength: 12,
                prefixIcon: Icon(
                  Icons.lock_outlined,
                  color: AppColors.greyColor,
                ),

                onValidate: (val) {
                  if (isConfirmPasswordHasFocus) {
                    return validateConfirmPassword(
                      val,
                      passwordTextEditingController.text,
                    );
                  }
                  return null;
                },
              ),

              MyElevatedButton(
                backgroundColor: WidgetStateProperty.all(AppColors.purpleColor),
                onPressed: () async {
                  final email = emailTextEditingController.text.trim();
                  final password = passwordTextEditingController.text.trim();
                  final confirmPassword =
                      confirmPasswordTextEditingController.text.trim();

                  if (email.isEmpty ||
                      password.isEmpty ||
                      confirmPassword.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please fill in all fields."),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }

                  try {
                    await authRepository.signUp(
                      email: email,
                      password: password,
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Sign Up successful!"),
                        backgroundColor: AppColors.greenColor,
                      ),
                    );

                    context.go(AppScreens.loginScreen);
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
                  "Sign Up",
                  style: TextStyle(color: AppColors.whiteColor, fontSize: 18),
                ),
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  MyText(text: "have an account? ... "),
                  MyTxtButton(
                    text: "Login now",
                    onPressed: () {
                      context.go(AppScreens.loginScreen);
                    },
                  ),
                ],
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

    confirmPasswordFocusNode.addListener(() {
      if (confirmPasswordFocusNode.hasFocus && !isConfirmPasswordHasFocus) {
        setState(() {
          isConfirmPasswordHasFocus = true;
        });
      }
    });
  }

  disposeFocusNodes() {
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();

    isEmailHasFocus = false;
    isPasswordHasFocus = false;
    isConfirmPasswordHasFocus = false;
  }
}
