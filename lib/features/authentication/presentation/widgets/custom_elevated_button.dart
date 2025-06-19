import 'package:e_commerce_ui/core/utils/constants/constants.dart';
import 'package:flutter/material.dart';

class MyElevatedButton extends StatelessWidget {
  const MyElevatedButton({
    super.key,
    this.height,
    this.width,
    this.padding,
    this.child,
    this.backgroundColor,
    this.onPressed,
  });

  final double? height;
  final double? width;
  final double? padding;
  final Widget? child;
  final WidgetStateProperty<Color?>? backgroundColor;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: buttonHorizontalPading, vertical: buttonVerticalPading),
      child: SizedBox(
        width: width ?? double.infinity,
        height: height ?? 60,
        child: ElevatedButton(
          style: ButtonStyle(
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(buttonRadius),
              ),
            ),

            backgroundColor:
                backgroundColor ?? WidgetStateProperty.all(Colors.white),
          ),

          onPressed: onPressed,
          child: child,
        ),
      ),
    );
  }
}
