import 'package:flutter/material.dart';
import 'package:note_app/src/core/utils/theme/app_colors.dart';

class UiUtils {
  static void showSnackBarMess(
    BuildContext context,
    String message, {
    Color foregroundColor = AppColors.white,
    Color backgroundColor = AppColors.darkGray,
    IconData? icon,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor,
        content: ListTile(
          title: Text(message),
          titleTextStyle: TextStyle(
            color: foregroundColor,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          leading: icon != null
              ? Icon(
                  icon,
                  size: 24,
                  color: foregroundColor,
                )
              : null,
        ),
      ),
    );
  }
}
