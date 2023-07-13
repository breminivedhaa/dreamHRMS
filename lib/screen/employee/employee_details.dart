import 'package:dreamhrms/screen/employee/employee_list.dart';
import 'package:dreamhrms/screen/employee/employee_details/profile.dart';
import 'package:dreamhrms/screen/employee/employee_details/teams.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:localization/localization.dart';

import '../../colors.dart';
import '../../widgets/Custom_text.dart';
import '../../widgets/common.dart';
import 'employee_details/assets.dart';
import 'employee_details/documents.dart';
import 'employee_details/time_off.dart';
import 'employee_details/time_sheet.dart';

class EmployeeDetails extends StatelessWidget {
  const EmployeeDetails({Key? key}) : super(key: key);

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
            navBackButton(),
            SizedBox(width: 8),
            CustomText(
              text: "emp_details".i18n(),
              color: AppColors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Center(
                child: Container(
                  height: 92,
                  width: 92,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                            "https://media.istockphoto.com/id/1318482009/photo/young-woman-ready-for-job-business-concept.jpg?s=612x612&w=0&k=20&c=Jc1NcoUMoM78AxPTh9EApaPU2kXh2evb499JgW99b0g=",
                          ),
                          fit: BoxFit.cover),
                      color: AppColors.white,
                      border: Border.all(
                        color: AppColors.grey,
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(14))),
                ),
              ),

              SizedBox(height: 15),
              CustomText(
                text: "John Walker".i18n(),
                color: AppColors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 5),
              CustomText(
                text: "UI Designer".i18n(),
                color: AppColors.grey,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
          Positioned(
              left: Get.width*0.55,top: Get.height*0.11,
              child: Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  gradient: AppColors.primaryColor1,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: Icon(
                  Icons.camera_alt_outlined,
                  color: AppColors.white,
                  size: 18,
                ),
              )),
          tabList()
        ],
      ),
    );
  }
}

tabList() {
  return Padding(
    padding: EdgeInsets.only(top: Get.height * 0.22),
    child: DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.white,
          automaticallyImplyLeading: false,
          elevation: 0,
          flexibleSpace: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 10),
                child: TabBar(
                  isScrollable: true,
                  indicatorColor: AppColors.secondaryColor,
                  labelColor: AppColors.secondaryColor,
                  unselectedLabelColor: AppColors.grey,
                  tabs: [
                    Tab(text: "profile".i18n()),
                    Tab(text: "teams".i18n()),
                    Tab(text: "assets".i18n()),
                    Tab(text: "time_off".i18n()),
                    Tab(text: "documents".i18n()),
                    Tab(text: "timesheet".i18n()),
                  ],
                ),
              ),
              // Divider()
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Profile(),
            Teams(),
            Assets(),
            TimeOff(),
            Documents(),
            TimeSheet(),
          ],
        ),
      ),
    ),
  );
}
