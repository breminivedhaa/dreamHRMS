import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../colors.dart';
import 'Custom_text.dart';

navBackButton() {
  return InkWell(
      onTap: () {
        Get.back();
      },
      child: Icon(Icons.arrow_back_ios_new_outlined, color: AppColors.black));
}

commonDataDisplay(
    {required String title1,
    required String text1,
    double? titleFontSize1,
    double? textFontSize1,
    required String title2,
    required String text2,
    double? titleFontSize2,
    double? textFontSize2}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 5),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: Get.width * 0.40,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                  text: title1,
                  color: AppColors.grey,
                  fontSize: titleFontSize1 == null ? 11 : titleFontSize1,
                  fontWeight: FontWeight.w400),
              SizedBox(height: 5),
              CustomText(
                  text: text1,
                  color: AppColors.black,
                  fontSize: textFontSize1 == null ? 13 : textFontSize1,
                  fontWeight: FontWeight.w500),
            ],
          ),
        ),
        SizedBox(width: 10),
        SizedBox(
          width: Get.width * 0.40,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                  text: title2,
                  color: AppColors.grey,
                  fontSize: titleFontSize2 == null ? 11 : titleFontSize2,
                  fontWeight: FontWeight.w400),
              SizedBox(height: 5),
              CustomText(
                  text: text2,
                  color: AppColors.black,
                  fontSize: textFontSize2 == null ? 13 : textFontSize2,
                  fontWeight: FontWeight.w500),
            ],
          ),
        ),
      ],
    ),
  );
}

commonSingleDataDisplay(
    {required String title1,
    required String text1,
    required double titleFontSize,
    required double textFontSize,
    Color? textFontColor,
    FontWeight? titleFontWeight,
    FontWeight? textFontWeight,
    Color? titleFontColor}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 5),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
                text: title1,
                color: titleFontColor == null ? AppColors.grey : titleFontColor,
                fontSize: titleFontSize,
                fontWeight: titleFontWeight == null
                    ? FontWeight.w400
                    : titleFontWeight),
            SizedBox(height: 5),
            CustomText(
                text: text1,
                color: textFontColor == null ? AppColors.black : textFontColor,
                fontSize: textFontSize,
                fontWeight:
                    textFontWeight == null ? FontWeight.w500 : textFontWeight),
          ],
        ),
      ],
    ),
  );
}

commonMenuDisplay(
    {required String image,
    required String text,
    required double fontSize,
    required FontWeight fontWeight,
    required Color color,
    required Color imageColor,
    required VoidCallback onPressed}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: InkWell(
      onTap: onPressed,
      child: Row(
        children: [
          SvgPicture.asset(image, color: imageColor),
          SizedBox(width: 5),
          CustomText(
            text: text,
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ],
      ),
    ),
  );
}
