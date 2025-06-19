import 'package:e_commerce_ui/core/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTxtFormField extends StatelessWidget {
  const MyTxtFormField({
    super.key,
    this.label,
    this.hint,
    this.alignLabelWithHint,
    this.keyboardType,
    this.inputFormatters,
    this.isEnabled,
    this.onChanged,
    this.maxLength,
    this.padding,
    this.maxLines,
    this.suffixIcon,
    this.prefixIcon,
    this.controller,
    this.decoration,
    this.onValidate,
    this.focusNode,

  });

  final String? label;
  final String? hint;
  final bool? alignLabelWithHint;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool? isEnabled;
  final int? maxLength;
  final int? maxLines;
  final double? padding;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  final TextEditingController? controller;
  final InputDecoration? decoration;
  final Function(String)? onChanged;
  final FocusNode? focusNode;

  final String? Function(String?)? onValidate;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: padding ?? txtFieldHorizontalPadding,
        vertical: padding ?? txtFieldVerticalPadding,
      ),
      child: Directionality(
        textDirection: TextDirection.ltr,

        child: TextFormField(
          controller: controller,
          textAlign: TextAlign.start,
          
          keyboardType: keyboardType,
          enabled: isEnabled,
          maxLength: maxLength ?? 30,
          maxLines: 1,
          

          decoration: InputDecoration(
            labelText: label,
            hintText: hint,
            alignLabelWithHint: true,
            suffixIcon: suffixIcon,
            prefixIcon:prefixIcon ,
            floatingLabelAlignment: FloatingLabelAlignment.start,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(txtFieldRadius),
              borderSide: BorderSide(color: Colors.black),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red.shade900,
              ), // Your error color
            ),
            errorStyle: TextStyle(
              color:
                  Colors.red.shade900, // Set your desired error message color
              fontSize: 14,
            ),
          ),
          onChanged: onChanged,
          validator: onValidate,
          autovalidateMode: AutovalidateMode.onUserInteraction
          ,
          focusNode:  focusNode,
          
        ),
      ),
    );
  }
}
