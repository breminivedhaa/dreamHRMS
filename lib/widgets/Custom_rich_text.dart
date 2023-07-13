import 'package:dreamhrms/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  final String text;
  final String? textSpan;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final String? fontFamily;
  final TextAlign textAlign;
  final Color? textSpanColor;
  final double? textSpanFontSize;
  final FontWeight? textSpanFontWeight;
  final String? textSpanFontFamily;
  final TextAlign? textSpanTextAlign;
  final VoidCallback? onPressed;
  CustomRichText({
    Key? key,
    required this.text,
    required this.color,
    required this.fontSize,
    required this.fontWeight,
    this.fontFamily,
    required this.textAlign,
     this.textSpan,
     this.textSpanColor,
     this.textSpanFontSize,
     this.textSpanFontWeight,
    this.textSpanFontFamily,
    this.textSpanTextAlign, this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: RichText(
        textAlign: textAlign,
        text: TextSpan(
            children: [
          TextSpan(
            text: text,
            style: TextStyle(
                color: color,
                fontWeight: fontWeight,
                fontSize: fontSize,
                fontFamily: fontFamily == null ? "Inter" : fontFamily),
          ),
          TextSpan(
            text: " $textSpan",
            style: TextStyle(
                color: textSpanColor,
                fontWeight: textSpanFontWeight,
                fontSize: textSpanFontSize,
                fontFamily: textSpanFontFamily == null ? "Inter" : textSpanFontFamily),
          ),
        ]),
      ),
    );
  }
}
