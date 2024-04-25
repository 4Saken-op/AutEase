import 'package:autease/src/features/social/constants/app_colors.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.color = const Color.fromARGB(255, 244, 166, 192),
    this.height = 50,
  });

  final VoidCallback? onPressed;
  final String label;
  final Color color;
  final double height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: onPressed == null ? Colors.transparent : color,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: AppColors.darkBlueColor,
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: (color == AppColors.lightBlueColor && onPressed != null)
                  ? AppColors.realWhiteColor
                  : AppColors.darkBlueColor,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
