import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

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

  static void showYesNoDialog(
    BuildContext context,
    String message,
    String positiveText,
    VoidCallback onPositive,
    String negativeText,
    VoidCallback onNegative,
  ) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text(message),
        actions: [
          TextButton(
            onPressed: onPositive,
            child: Text(
              positiveText,
              style: const TextStyle(color: AppColors.green),
            ),
          ),
          TextButton(
            onPressed: onNegative,
            child: Text(
              negativeText,
              style: const TextStyle(color: AppColors.red),
            ),
          ),
        ],
      ),
    );
  }
}
