import 'package:dreamhrms/widgets/expansion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:localization/localization.dart';

import '../../colors.dart';
import '../../widgets/Custom_text.dart';
import '../../widgets/common.dart';
import '../../widgets/stacket_image_widget.dart';
import 'add_department.dart';

class Department extends StatelessWidget {
  const Department({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                navBackButton(),
                SizedBox(width: 8),
                CustomText(
                  text: "department".i18n(),
                  color: AppColors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: InkWell(
                onTap: () {
                  Get.to(() => AddDepartment(option: 'Add'));
                },
                child: Container(
                  height: 36,
                  width: 36,
                  decoration: BoxDecoration(
                      color: AppColors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Icon(Icons.add, color: AppColors.white),
                ),
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                color: AppColors.blue.withOpacity(0.12),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: CustomText(
                    text: "comp_name".i18n(),
                    color: AppColors.blue,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  Map data = {
                    "data": {
                      "title": "HR Manager",
                      "sub_title": "A",
                    },
                    "data": {
                      "title": "HR Manager",
                      "sub_title": "A",
                    },
                  };
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ExpansionTileWidget(
                            title: CustomText(
                              text: "Yesterday",
                              color: AppColors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                            subTitle: CustomText(
                              text: "Yesterday",
                              color: AppColors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                            image:
                                SvgPicture.asset("assets/icons/management.svg"),
                            expansionList: data,
                            editOnPressed: () {
                              Get.to(() => AddDepartment(option: 'Edit'));
                            },
                            ContainerOnClick: () {
                              _buildPopupDialog(context);
                            }),
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }

  void _showAlert(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => Dialog(
              alignment: Alignment.bottomCenter,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              // child: _buildPopupDialog(context),
              child: Text("data"),
            ));
  }

  _buildPopupDialog(BuildContext context) {
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            height: 260,
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Center(
                    child: Container(
                      width: 75,
                      height: 4,
                      decoration: BoxDecoration(
                          color: AppColors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),
                  ),
                  SizedBox(height: 10),
                  CustomText(
                      text: "hr_dept".i18n(),
                      color: AppColors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                  SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: Get.width * 0.40,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                                text: "employees".i18n(),
                                color: AppColors.grey,
                                fontSize: 13,
                                fontWeight: FontWeight.w400),
                            SizedBox(height: 8),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                      ),
                      SizedBox(width: 20),
                      commonSingleDataDisplay(
                        title1: "head_dept".i18n(),
                        text1: "Dreamguys Technology",
                        titleFontSize: 13,
                        titleFontColor: AppColors.grey,
                        titleFontWeight: FontWeight.w400,
                        textFontSize: 14,
                        textFontColor: AppColors.black,
                        textFontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: Get.width * 0.40,
                        child: commonSingleDataDisplay(
                          title1: "head_dept".i18n(),
                          text1: "Dreamguys Technology",
                          titleFontSize: 13,
                          titleFontColor: AppColors.grey,
                          titleFontWeight: FontWeight.w400,
                          textFontSize: 14,
                          textFontColor: AppColors.black,
                          textFontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 20),
                      Column(
                        children: [
                          CustomText(
                            text: "position",
                            color: AppColors.grey,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                          SizedBox(height: 10),
                          positionToggle()
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  positionToggle() {
    return FlutterSwitch(
      height: 25,
      width: 50,
      // toggleSize: 26,
      // showOnOff: true,
      valueFontSize: 11,
      activeColor: AppColors.lightGrey,
      activeTextColor: AppColors.grey,
      inactiveColor: AppColors.lightGrey,
      inactiveTextColor: AppColors.grey,
      // switchBorder: Border.all(
      //   color: AppColors.primaryColor
      // ),
      value: false,
      // value: ProvisionController.to.comparableProvisionModules[ProvisionController.to.modules[mainIndex]['_id']]['sub_module'][subModulesList[index]['_id']]['read'],
      onToggle: (val) {
        // StaffCreationController.to.updateReadToProvisionedSubModules(
        //     moduleId:ProvisionController.to.modules[mainIndex]['_id'],
        //     subModuleId: subModulesList[index]['_id']
        // );
      },
    );
  }
}
