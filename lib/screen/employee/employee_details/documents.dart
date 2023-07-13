import 'package:dreamhrms/screen/employee/documents/document_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:localization/localization.dart';

import '../../../colors.dart';
import '../../../widgets/Custom_text.dart';
import '../../../widgets/common.dart';
import '../../../widgets/common_widget_icon_button.dart';
import '../documents/documents_details.dart';

class Documents extends StatelessWidget {
  const Documents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "documents".i18n(),
                      color: AppColors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(
                      child: CommonIconButton(
                        icon: Icon(Icons.add, color: AppColors.white),
                        width: 36,
                        height: 36,
                        onPressed: () {
                          // Get.to(()=>MainScreen());
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "My Folders".i18n(),
                      color: AppColors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    CustomText(
                      text: "View All".i18n(),
                      color: AppColors.blue,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                getFolderList(),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "Recent Files".i18n(),
                      color: AppColors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    CustomText(
                      text: "View All".i18n(),
                      color: AppColors.blue,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                getDocumentList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  getFolderList() {
    return Container(
      height: Get.height * 0.13,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  width: Get.width * 0.43,
                  decoration: BoxDecoration(
                      color: AppColors.grey.withOpacity(0.1),
                      borderRadius: const BorderRadius.all(Radius.circular(8))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              "assets/images/file.png",
                              fit: BoxFit.contain,
                              width: 30,
                              height: 30,
                            ),
                            Icon(Icons.more_horiz, color: AppColors.grey)
                          ],
                        ),
                        SizedBox(height: 8),
                        CustomText(
                          textAlign: TextAlign.left,
                          text: "Personal".i18n(),
                          color: AppColors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              textAlign: TextAlign.left,
                              text: "100 Files".i18n(),
                              color: AppColors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                            CustomText(
                              textAlign: TextAlign.left,
                              text: "2 GB".i18n(),
                              color: AppColors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }

  getDocumentList() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 4,
        physics: ScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: InkWell(
              onTap: () {
                Get.to(() => DocumentDetails());
              },
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(
                      color: AppColors.grey.withOpacity(0.3),
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 38,
                        width: 38,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: index==0?
                          AssetImage("assets/images/pdf.png"):index==1?
                          AssetImage("assets/images/doc.png"):index==2?
                          AssetImage("assets/images/ppt.png"):
                          AssetImage("assets/images/xls.png")
                          ),
                            color: AppColors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: Get.width * 0.55,
                        child: commonSingleDataDisplay(
                            title1: "Richard Shared the Edit Access",
                            text1: "William",
                            titleFontSize: 14,
                            titleFontWeight: FontWeight.w600,
                            titleFontColor: AppColors.black,
                            textFontSize: 12,
                            textFontWeight: FontWeight.w400,
                            textFontColor: AppColors.grey),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.more_vert,
                          size: 20,
                          color: AppColors.grey,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
