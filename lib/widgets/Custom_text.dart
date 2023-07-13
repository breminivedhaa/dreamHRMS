import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final String? fontFamily;
  final TextAlign? textAlign;
  final VoidCallback? onPressed;
  CustomText({
    Key? key,
    required this.text,
    required this.color,
    required this.fontSize,
    required this.fontWeight,
    this.fontFamily,
    this.textAlign,  this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Text(
        text,
        textAlign: textAlign,
        style: TextStyle(
            color: color,
            fontWeight: fontWeight,
            fontSize: fontSize,
            fontFamily: fontFamily == null ? "Inter" : fontFamily),
      ),
    );
  }
}
