import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../colors.dart';
import 'Custom_text.dart';

class BackToScreen extends StatelessWidget {
  final String text;
  final bool arrowIcon;
  final VoidCallback onPressed;
  const BackToScreen(
      {Key? key,
      required this.text,
      required this.arrowIcon,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 44,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.grey.withOpacity(0.5),
            // width: 1.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                  visible: arrowIcon == true,
                  child: SvgPicture.asset("assets/icons/arrow_left.svg")),
              SizedBox(width: 10),
              CustomText(
                text: text,
                color: AppColors.grey,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
