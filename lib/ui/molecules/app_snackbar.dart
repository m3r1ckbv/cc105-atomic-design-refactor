import 'package:flutter/material.dart';
import '../atoms/app_text.dart';

class AppSnackBar {
  static void snackBarAppear(BuildContext context, String message, [Color? bgColor]) {
     ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: AppText(message, style: AppTextStyle.normal),
          backgroundColor: bgColor,
        ),
      );
  }
} 