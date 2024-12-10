import '../constants/colors.dart';
import 'package:flutter/material.dart';
import '../constants/styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final double verticalPadding;
  final double horizontalPadding;
  final Icon? icon;

  const CustomButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.backgroundColor = Colors.green,
      this.textColor = Colors.white,
      this.fontSize = 16.0,
      this.verticalPadding = 18.0,
      this.horizontalPadding = 2.0,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: backgroundColor,
          shadowColor: tShadowColor,
          elevation: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[
            icon!,
            const SizedBox(width: 5.0),
          ],
          Text(
            text,
            style: TextStyles.custom(context: context, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
