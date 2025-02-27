
import 'package:appifylab/core/const/app_colors.dart';
import 'package:flutter/material.dart';

class CircularBackButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color? iconColor; // Optional parameter for icon color
  final Color? backgroundColor; // Optional parameter for background color

  const CircularBackButton({
    super.key,
    required this.onPressed,
    this.iconColor, // Allow customization
    this.backgroundColor, // Allow customization
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 48, // Adjust height
        width: 48, // Adjust width
        decoration: BoxDecoration(
          color: backgroundColor ??
              AppColors.primaryColor, // Default or custom background color
          shape: BoxShape.circle, // Makes the container circular
        ),
        child: Center(
          child: Icon(
            Icons.arrow_back_ios_new, // Back arrow icon
            color: iconColor ?? Colors.black, // Default or custom icon color
            size: 16, // Icon size
          ),
        ),
      ),
    );
  }
}
