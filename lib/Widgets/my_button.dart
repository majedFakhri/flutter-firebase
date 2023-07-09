import 'package:flutter/material.dart';

import '../core/utils/app_string.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.primaryColor,
    required this.child,
    required this.onPressed,
    this.minWid,
    this.minHeight,
    this.maxWid,
    this.maxHeight,
    this.elevation,
    this.textSize,
    required this.textColor,
  });

  final Color primaryColor;
  final Color textColor;
  final Widget child;

  final VoidCallback onPressed;
  final double? minWid;
  final double? minHeight;
  final double? maxWid;
  final double? maxHeight;
  final double? elevation;
  final double? textSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: textColor,
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        textStyle: TextStyle(
          fontSize: textSize ?? 25 * MediaQuery.of(context).textScaleFactor,
          fontFamily: AppStrings.appFont,
        ),
      ),
      child: child,
    );
  }
}
