import 'package:dreamhrms/widgets/Custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localization/localization.dart';

import '../../../colors.dart';
import '../../../widgets/Custom_rich_text.dart';
import '../../../widgets/back_to_screen.dart';
import '../../../widgets/common_button.dart';
import '../../../widgets/custom_dotted_border.dart';

class DocumentsScreen extends StatelessWidget {
  const DocumentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            buildDocumentInformation(),
            const SizedBox(
              height: 30,
            ),
            buildWorkExperience(),
            const SizedBox(
              height: 30,
            ),
            buildEducational(),
            SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: CommonButton(
                    text: "save_next".i18n(),
                    textColor: AppColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    // textAlign: TextAlign.center,
                    onPressed: () {
                      // Get.to(()=>MainScreen());
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            BackToScreen(
              text: "cancel".i18n(),
              arrowIcon: false,
              onPressed: () {
                Get.back();
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: AppColors.lightGrey,
                fixedSize: Size.fromHeight(44),
                shape: RoundedRectangleBorder(
                  borderRadius:  BorderRadius.circular(8.0),
                )
              ),
                onPressed: () {},
                child: CustomText(
                    text: 'Skip',
                    color: AppColors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  buildDocumentInformation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
            text: 'document_information'.i18n(),
            color: AppColors.blue,
            fontSize: 13,
            fontWeight: FontWeight.w400),
        const SizedBox(
          height: 25,
        ),
        CustomRichText(
          textAlign: TextAlign.left,
          text: "ID Proof",
          color: AppColors.black,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          textSpan: " *",
          textSpanColor: AppColors.red,
        ),
        SizedBox(height: 10),
        CustomDottedBorder(),
        const SizedBox(
          height: 20,
        ),
        CustomRichText(
          textAlign: TextAlign.left,
          text: "Address Proof",
          color: AppColors.black,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          textSpan: " *",
          textSpanColor: AppColors.red,
        ),
        SizedBox(height: 10),
        CustomDottedBorder(),
      ],
    );
  }

  buildWorkExperience() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
            text: 'Work Experience Certificate',
            color: AppColors.blue,
            fontSize: 13,
            fontWeight: FontWeight.w400),
        const SizedBox(
          height: 25,
        ),
        CustomRichText(
          textAlign: TextAlign.left,
          text: "Letter of Indent",
          color: AppColors.black,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          textSpan: " *",
          textSpanColor: AppColors.red,
        ),
        SizedBox(height: 10),
        CustomDottedBorder(),
        const SizedBox(
          height: 20,
        ),
        CustomRichText(
          textAlign: TextAlign.left,
          text: "Experience Certificate",
          color: AppColors.black,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          textSpan: " *",
          textSpanColor: AppColors.red,
        ),
        SizedBox(height: 10),
        CustomDottedBorder(),
      ],
    );
  }

  buildEducational() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
            text: 'Educational Certificate',
            color: AppColors.blue,
            fontSize: 13,
            fontWeight: FontWeight.w400),
        const SizedBox(
          height: 25,
        ),
        CustomRichText(
          textAlign: TextAlign.left,
          text: "Letter of Certificate/Diploma/Degrees",
          color: AppColors.black,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          textSpan: " *",
          textSpanColor: AppColors.red,
        ),
        SizedBox(height: 10),
        CustomDottedBorder(),
        const SizedBox(
          height: 20,
        ),
        CustomRichText(
          textAlign: TextAlign.left,
          text: "Experience Course Completion",
          color: AppColors.black,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          textSpan: " *",
          textSpanColor: AppColors.red,
        ),
        SizedBox(height: 10),
        CustomDottedBorder(),
      ],
    );
  }
}
