import 'package:flutter/material.dart';

import '../../core/utils/theme/app_colors.dart';

class AuthInputField extends StatelessWidget {
  const AuthInputField(
      {super.key,
      this.hint,
      this.iconData,
      this.foregroundColor = AppColors.white,
      this.fillColor = AppColors.whiteOpacity1,
      this.hintColor = AppColors.white70,
      this.obscureText = false,
      this.controller,
      this.validator, this.inputType});

  final String? hint;
  final IconData? iconData;
  final Color foregroundColor;
  final Color fillColor;
  final Color hintColor;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      style: TextStyle(color: foregroundColor),
      obscureText: obscureText,
      keyboardType: inputType,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: hintColor),
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
        prefixIcon: Icon(iconData, color: foregroundColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
