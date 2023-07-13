import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:localization/localization.dart';

import '../../../colors.dart';
import '../../../widgets/Custom_text.dart';
import '../../../widgets/common.dart';
import '../../../widgets/common_button.dart';
import '../../../widgets/stacket_image_widget.dart';
import 'documents_details.dart';

class DocumentsInformation extends StatelessWidget {
  const DocumentsInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Container(
            width: Get.width,
            height: Get.height,
            child: Stack(
              children: [
                Image.asset(
                  "assets/images/assets.png",
                  fit: BoxFit.fill,
                  width: Get.width,
                ),
                Positioned(
                  top: Get.height * 0.25,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 500,
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30))),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          CustomText(
                            text: "document_information".i18n(),
                            color: AppColors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(height: 20),
                          commonDataDisplay(
                              title1: "doc_name".i18n(),
                              text1: "Design Presentation",
                              title2: "created_on".i18n(),
                              text2: "08 Mar 2023, 6:45 PM",
                              titleFontSize1: 13,
                              titleFontSize2: 13,
                              textFontSize1: 14,
                              textFontSize2: 14),
                          SizedBox(height: 15),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: Get.width * 0.40,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                        text: "file_owner".i18n(),
                                        color: AppColors.grey,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                    SizedBox(height: 8),
                                    Row(
                                      // crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        ClipOval(
                                            child: Image.network(
                                          "https://media.istockphoto.com/id/1318482009/photo/young-woman-ready-for-job-business-concept.jpg?s=612x612&w=0&k=20&c=Jc1NcoUMoM78AxPTh9EApaPU2kXh2evb499JgW99b0g=",
                                          fit: BoxFit.cover,
                                          width: 38.0,
                                          height: 38.0,
                                        )),
                                        SizedBox(width: 10),
                                        Align(
                                          alignment: Alignment.center,
                                          child: CustomText(
                                              textAlign: TextAlign.center,
                                              text: "William",
                                              color: AppColors.grey,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                      text: "who_access".i18n(),
                                      color: AppColors.grey,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                  SizedBox(height: 8),
                                  buildExpandedBox(
                                    color: Colors.white,
                                    children: [
                                      buildStackedImages(
                                          direction: TextDirection.rtl,
                                          imgsize: 38,
                                          showCount: true),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          commonDataDisplay(
                              title1: "doc_size".i18n(),
                              text1: "2 MB",
                              title2: "view".i18n(),
                              text2: "15 members",
                              titleFontSize1: 13,
                              titleFontSize2: 13,
                              textFontSize1: 14,
                              textFontSize2: 14),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      children: [
                        SizedBox(
                          width: Get.width * 0.40,
                          child: CommonButton(
                            text: "view".i18n(),
                            iconText: true,
                            textColor: AppColors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            textAlign: TextAlign.center,
                            icons: Icons.remove_red_eye_outlined,
                            iconSize: 20,
                            onPressed: () {
                              // Get.to(()=>MainScreen());
                            },
                          ),
                        ),
                        SizedBox(width: 15),
                        SizedBox(
                          width: Get.width * 0.40,
                          child: CommonButton(
                            text: "download".i18n(),
                            iconText: true,
                            textColor: AppColors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            textAlign: TextAlign.center,
                            icons: Icons.file_download_outlined,
                            iconSize: 20,
                            onPressed: () {
                              // Get.to(()=>MainScreen());
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
