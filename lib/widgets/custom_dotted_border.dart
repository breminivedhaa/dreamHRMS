import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

import '../colors.dart';
import 'Custom_rich_text.dart';
import 'Custom_text.dart';

class CustomDottedBorder extends StatelessWidget {
  const CustomDottedBorder({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: Colors.grey.withOpacity(0.5), //color of dotted/dash line
      strokeWidth: 2, //thickness of dash/dots
      dashPattern: [10, 6],
      //dash patterns, 10 is dash width, 6 is space width
      child: Container(
        //inner container
        height: 80, //height of inner container
        width: double
            .infinity, //width to 100% match to parent container.
        // color:Colors.yellow
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomRichText(
                textAlign: TextAlign.center,
                text: "Drop your files here or".i18n(),
                color: AppColors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                textSpan: 'Browse',
                textSpanColor: AppColors.blue),
            SizedBox(height: 10),
            CustomText(
              text: "Maximum size: 50MB",
              color: AppColors.grey,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
