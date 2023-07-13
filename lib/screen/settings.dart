import 'package:dreamhrms/controller/settings_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:localization/localization.dart';

import '../colors.dart';
import '../widgets/Custom_rich_text.dart';
import '../widgets/Custom_text.dart';
import '../widgets/common.dart';
import '../widgets/common_searchable_dropdown/MainCommonSearchableDropDown.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        // leading: Icon(Icons.arrow_back_ios_new_outlined,color: AppColors.black),
        title: Row(
          children: [
            // navBackButton(),
            SizedBox(width: 8),
            CustomText(
              text: "settings".i18n(),
              color: AppColors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomRichText(
                  textAlign: TextAlign.left,
                  text: "settings_title".i18n(),
                  color: AppColors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  textSpan: ' *',
                  textSpanColor: AppColors.red),
              SizedBox(height: 10),
              MainSearchableDropDown(
                  title: 'branch',
                  hint: "branch_hint".i18n(),
                  items: SettingsController.to.branchList,
                  controller: SettingsController.to.branch,
                  onChanged: (data) {
                    print("test data response $data");
                  }),
              getList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget getList() {
    return Column(
      children: [
        widgets(image:"assets/icons/notes.svg",
            title:"company_setting".i18n(),
            text:"Loreum ipsum dolor sit ament, consectetur"
        ),
        widgets(image:"assets/icons/notification.svg",
            title:"notification_setting".i18n(),
            text:"Loreum ipsum dolor sit ament, consectetur"
        ),
        widgets(image:"assets/icons/out.svg",
            title:"leave_setting".i18n(),
            text:"Loreum ipsum dolor sit ament, consectetur"
        ), widgets(image:"assets/icons/thumbsUp.svg",
            title:"approval_setting".i18n(),
            text:"Loreum ipsum dolor sit ament, consectetur"
        ), widgets(image:"assets/icons/trash.svg",
            title:"delete_setting".i18n(),
            text:"Loreum ipsum dolor sit ament, consectetur"
        ),
      ],
    );
  }

  Widget widgets({required String image, required String title, required text}){
    return  Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.lightGrey),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 38,
            width: 38,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: AppColors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8)),
            child: SvgPicture.asset(
              image,
              width: 17,height: 17,
            ),
          ),//
          commonSingleDataDisplay(
            title1: title,
            text1: text,
            titleFontSize: 14,
            textFontSize: 12,
            textFontColor:AppColors.grey,
            titleFontColor:AppColors.black,
            titleFontWeight:FontWeight.w600,
            textFontWeight:FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
