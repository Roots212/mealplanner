import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double? width;
  final String title;
  final bool showIcon;
  final Color? backgroundColor;
  final Color? textColor;
  VoidCallback? onPress;
  CustomButton({
    super.key,
    required this.title,
    this.onPress,
    this.width,
    this.showIcon = true,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onTap: onPress,
      child: Container(
        width: width ?? MediaQuery.sizeOf(context).width * 0.8,
        height: MediaQuery.sizeOf(context).height * 0.06,
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: textColor ?? Colors.black,
                  fontSize: 20,
                ),
              ),
              if (showIcon) ...[
                SizedBox(width: 10),
                Icon(Icons.arrow_forward_ios, color: Colors.black),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
