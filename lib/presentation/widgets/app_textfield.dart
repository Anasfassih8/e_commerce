import 'package:e_commerce/core/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.controller,
    required this.onChange,
    this.hint,
    this.suffixIcon,
    this.prefixIcon,
    this.style,
    this.keyboardType,
    this.isReadOnly,
    this.obscureText,
    this.width,
    this.height,
  });
  final TextEditingController controller;
  final Function(String)? onChange;
  final String? hint;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextStyle? style;
  final TextInputType? keyboardType;
  final bool? isReadOnly;
  final bool? obscureText;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50,
      width: width ?? double.infinity,
      child: TextFormField(
        controller: controller,
        //
        onChanged: onChange,
        //
        decoration: InputDecoration(
          hintText: hint,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
        ),

        //
        style: style ?? TextStyle(fontSize: 14, color: AppColors.black),
        keyboardType: keyboardType ?? TextInputType.text,
        readOnly: isReadOnly ?? false,
        obscureText: obscureText ?? false,
      ),
    );
  }
}