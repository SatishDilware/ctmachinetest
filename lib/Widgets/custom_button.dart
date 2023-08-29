import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.buttonText,
      required this.onTapFunction,
      this.buttonHeight = 55,
      required this.buttonColor,
      this.buttonTextColor, required this.radius //= const Color(0xff9B9DAF),
      });
  final String buttonText;
  final Color? buttonTextColor;
  final double radius;
  final VoidCallback onTapFunction;
  final double buttonHeight;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      onPressed: onTapFunction,
      height: buttonHeight,
      color: buttonColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              buttonText,
              style: TextStyle(
                  color: buttonTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5),
            ),
          ],
        ),
      ),
    );
  }
}
