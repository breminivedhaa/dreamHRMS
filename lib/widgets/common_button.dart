import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final String? fontFamily;
  final TextAlign? textAlign;
  final VoidCallback onPressed;
  final bool? iconText;
  final IconData? icons;
  final double? iconSize;
  CommonButton(
      {Key? key,
      required this.text,
      required this.textColor,
      required this.fontSize,
      required this.fontWeight,
      this.fontFamily,
      this.textAlign,
      required this.onPressed,
      this.icons,
      this.iconText,
      this.iconSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          gradient: AppColors.primaryColor1,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [],
        ),
        child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              onPrimary: Colors.transparent,
              shadowColor: Colors.transparent,
              elevation: 0,
            ),
            child: iconText == true
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(icons, color: textColor, size: iconSize),
                      SizedBox(width: 5),
                      Text(
                        text,
                        textAlign: textAlign,
                        style: TextStyle(
                            color: textColor,
                            fontWeight: fontWeight,
                            fontSize: fontSize,
                            fontFamily:
                                fontFamily == null ? "Inter" : fontFamily),
                      ),
                    ],
                  )
                : Text(
                    text,
                    textAlign: textAlign,
                    style: TextStyle(
                        color: textColor,
                        fontWeight: fontWeight,
                        fontSize: fontSize,
                        fontFamily: fontFamily == null ? "Inter" : fontFamily),
                  )),
      ),
    );
  }
}
