import 'package:flutter/material.dart';
import 'package:my_travel_friend/theme/app_font.dart';

class Button extends StatelessWidget {
  final String? text;
  final VoidCallback? onTap;
  final double width;
  final double height;
  final Color? backgroundColor;
  final Color contentColor;
  final double borderRadius;
  final Widget? icon; // optional

  const Button({
    super.key,
    this.text,
    required this.onTap,
    required this.width,
    required this.height,
    this.backgroundColor, // 기본 메인 색
    required this.contentColor,
    required this.borderRadius,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null)
              Padding(
                padding: const EdgeInsets.only(right: 6.0),
                child: IconTheme(
                  data: IconThemeData(color: contentColor),
                  child: icon!,
                ),
              ),

            if (text != null)
              Text(text!, style: AppFont.regular.copyWith(color: contentColor)),
          ],
        ),
      ),
    );
  }
}
