import 'package:flutter/material.dart';

import '../../core/utils/theme/app_colors.dart';

class NoteInputField extends StatelessWidget {
  const NoteInputField({
    super.key, required this.hint, required this.fontSize, required this.controller, required this.fontWeight,
  });

  final String hint;
  final double fontSize;
  final FontWeight fontWeight;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: AppColors.white
      ),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hint,
        hintStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: AppColors.white70
        ),
      ),
      keyboardType: TextInputType.multiline,
      maxLines: null,
    );
  }
}
