import 'package:flutter/material.dart';

class CustomSnackBar {
  static void showCenter({
    required BuildContext context,
    required String message,
    Color backgroundColor =Colors.white,
    Duration duration = const Duration(seconds: 2),
  }) {


    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
            
            )),
        behavior: SnackBarBehavior.floating,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 50,
        ),
        duration: duration,
      ),
    );
  }
}
