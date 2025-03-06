import 'package:flutter/material.dart';

class SnackBarHelper {
  // Show a success SnackBar
  static void showSuccess(BuildContext context, String message) {
    showSnackBar(context, message, Colors.green);
  }

  // Show an error SnackBar
  static void showError(BuildContext context, String message) {
    showSnackBar(context, message, Colors.red);
  }

  // Private method to display SnackBar
  static void showSnackBar(BuildContext context, String message,
      [Color color = Colors.black]) {
    ScaffoldMessenger.of(context)
        .hideCurrentSnackBar(); // Avoid overlapping SnackBars
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
