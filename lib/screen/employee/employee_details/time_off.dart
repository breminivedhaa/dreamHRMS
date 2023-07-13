import 'package:dreamhrms/controller/employee_details_controller/time_off_controller.dart';
import 'package:dreamhrms/model/leave_model.dart';
import 'package:dreamhrms/widgets/Custom_rich_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:localization/localization.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../colors.dart';
import '../../../widgets/Custom_text.dart';
import '../../../widgets/common.dart';
import '../../../widgets/common_button.dart';
import '../../../widgets/common_widget_icon_button.dart';
import '../../../widgets/progress_indicator.dart';
import '../../../widgets/stacket_image_widget.dart';

class TimeOff extends StatefulWidget {
  const TimeOff({Key? key}) : super(key: key);

  @override
  State<TimeOff> createState() => _TimeOffState();
}

class _TimeOffState extends State<TimeOff> {
  LeaveModel? leaveModel;

  List<LeaveModel> leave = [
    LeaveModel(
        leaveType: "Casual Leave",
        fromTo: "Applied from 15 mar to 18 mar",
        date: "08.05.2023",
        time: "12:00 PM",
        status: "Accepted"),
    LeaveModel(
        leaveType: "Casual Leave",
        fromTo: "Applied from 15 mar to 18 mar",
        date: "08.05.2023",
        time: "12:00 PM",
        status: "Accepted")
  ];

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
                      text: "time_off".i18n(),
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
                Center(
                  child: Container(
                    child: CircularPercentIndicator(
                      radius: 90,
                      animation: true,
                      animationDuration: 1000,
                      lineWidth: 8,
                      percent: 0.60,
                      center: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                              text: "8",
                              color: AppColors.black,
                              fontSize: 35,
                              fontWeight: FontWeight.w700),
                          CustomText(
                              text: "Absent Leave",
                              color: AppColors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w500)
                        ],
                      ),
                      circularStrokeCap: CircularStrokeCap.butt,
                      backgroundColor: Color(0xffE5ECF6),
                      progressColor: AppColors.blue, //
                    ),
                  ),
                ),
                SizedBox(height: 20),
                leaveCount(
                  image1: "assets/icons/annual.svg",
                  title1: "annual_leave".i18n(),
                  text1: "10/12",
                  image2: "assets/icons/sick.svg",
                  title2: "sick_leave".i18n(),
                  text2: "2/5",
                ),
                SizedBox(height: 20),
                leaveCount(
                  image1: "assets/icons/vacation.svg",
                  title1: "vacation_leave".i18n(),
                  text1: "10/12",
                  image2: "assets/icons/takeOff.svg",
                  title2: "com_off_leave".i18n(),
                  text2: "2/5",
                ),
                SizedBox(height: 25),
                CustomText(
                    text: "leave_history".i18n(),
                    color: AppColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    textAlign: TextAlign.start),
                SizedBox(height: 20),
                Obx(
                  () => Container(
                    // color: Colors.red,
                    decoration: BoxDecoration(
                      color: AppColors.lightWhite.withOpacity(0.9),
                      // border: Border.all(
                      //   color: AppColors.red.withOpacity(0.5),
                      //   // width: 1.0,
                      // ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              TimeOffController.to.leaveButton =
                                  !TimeOffController.to.leaveButton;
                              TimeOffController.to.permissionButton = false;

                              print(
                                  'permission ${TimeOffController.to.permissionButton} leave ${TimeOffController.to.leaveButton}');
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              primary: TimeOffController.to.leaveButton == true
                                  ? AppColors.blue
                                  : AppColors.lightWhite.withOpacity(0.9),
                            ),
                            child: CustomText(
                              text: "leave".i18n(),
                              color: TimeOffController.to.leaveButton == true
                                  ? AppColors.white
                                  : AppColors.darkGreen,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              TimeOffController.to.permissionButton =
                                  !TimeOffController.to.permissionButton;
                              TimeOffController.to.leaveButton = false;
                              print(
                                  'permission ${TimeOffController.to.permissionButton} leave ${TimeOffController.to.leaveButton}');
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              primary:
                                  TimeOffController.to.permissionButton == true
                                      ? AppColors.blue
                                      : AppColors.lightWhite,
                            ),
                            child: CustomText(
                              text: "permission".i18n(),
                              color:
                                  TimeOffController.to.permissionButton == true
                                      ? AppColors.white
                                      : AppColors.darkGreen,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                leaveDetails()
              ],
            ),
          ),
        ),
      ),
    );
  }

  leaveCount(
      {required String image1,
      required String title1,
      required String text1,
      required String image2,
      required String title2,
      required String text2}) {
    return Row(
      children: [
        SizedBox(
          width: Get.width * 0.44,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(image1),
              SizedBox(width: 10),
              commonSingleDataDisplay(
                  title1: title1,
                  text1: text1,
                  titleFontSize: 13,
                  titleFontWeight: FontWeight.w400,
                  textFontSize: 14,
                  textFontWeight: FontWeight.w600,
                  textFontColor: AppColors.black),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(image2),
            SizedBox(width: 10),
            commonSingleDataDisplay(
                title1: title2,
                text1: text2,
                titleFontSize: 13,
                titleFontWeight: FontWeight.w400,
                textFontSize: 14,
                textFontWeight: FontWeight.w600,
                textFontColor: AppColors.black),
          ],
        ),
      ],
    );
  }

  leaveDetails() {
    return ListView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: leave.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.only(bottom: 15),
          padding: EdgeInsets.all(15),
          width: Get.width,
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.lightGrey),
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: Get.width * 0.50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomRichText(
                      textAlign: TextAlign.left,
                      // textSpanTextAlign: TextAlign.left,
                      text: leave[index].leaveType,
                      color: AppColors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      textSpan: leave[index].fromTo,
                      textSpanColor: AppColors.grey,
                      textSpanFontSize: 14,
                      textSpanFontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomRichText(
                      textAlign: TextAlign.left,
                      textSpanTextAlign: TextAlign.left,
                      text: leave[index].date,
                      color: AppColors.grey.withOpacity(0.5),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      textSpan: leave[index].time,
                      textSpanColor: AppColors.grey.withOpacity(0.5),
                      textSpanFontSize: 12,
                      textSpanFontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
              Container(
                height: 30,
                width: 80,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColors.lightGreen,
                    borderRadius: const BorderRadius.all(Radius.circular(6))),
                child: CustomText(
                  text: leave[index].status,
                  color: AppColors.green,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
