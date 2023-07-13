import 'package:dreamhrms/controller/employee_details_controller/time_sheet_controller.dart';
import 'package:dreamhrms/widgets/date_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:localization/localization.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../../colors.dart';
import '../../../widgets/Custom_text.dart';

class TimeSheet extends StatelessWidget {
  const TimeSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TimeSheetController.to.setDateFormat();
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
                CustomText(
                  text: "timesheet".i18n(),
                  color: AppColors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 20),
                Center(
                  child: InkWell(
                    onTap: (){
                      showDateDialog(context);
                    },
                    child: Container(
                      height: 45,
                      width: Get.width*0.60,
                      decoration: BoxDecoration(
                        border: Border.all(color:AppColors.lightGrey),
                          borderRadius: const BorderRadius.all(Radius.circular(5))
                      ),
                      child: Obx(()=>
                         Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.arrow_back_ios_outlined,color: AppColors.grey,size: 20),
                            Spacer(),
                            Icon(Icons.calendar_today_outlined,color: AppColors.blue,size: 20),
                            SizedBox(width: 8),
                            CustomText(text: TimeSheetController.to.attendanceDate,
                                color: AppColors.blue, fontSize: 16, fontWeight: FontWeight.w400),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios_outlined,color: AppColors.grey,size: 20),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                getListData()
              ],
            ),
          ),
        ),
      ),
    );
  }

  showDateDialog(BuildContext context){
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => Dialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(20.0))),
          child: Container(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20, horizontal: 10),
                child: Column(
                  children: [
                    Expanded(child: DatePicker()),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 10),
                        child: CustomText(
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            text: "DONE",
                            color: AppColors.blue,
                            fontSize: 15,
                            fontWeight: FontWeight.w700),
                      ),
                    )
                  ],
                ),
              )),
        ));
  }

  getListData() {
    return ListView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            Container(
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                          text: 'Monday',
                          color: AppColors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today_outlined,
                            color: AppColors.grey,
                            size: 12,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          CustomText(
                              text: '01 May 2023',
                              color: AppColors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                          SizedBox(
                            width: 10,
                          ),
                          SvgPicture.asset("assets/icons/break.svg"),
                          SizedBox(width: 3),
                          CustomText(
                              text: '1h',
                              color: AppColors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/clock.svg",
                        color: index / 2 == 1 ? AppColors.green : AppColors.red,
                      ),
                      SizedBox(width: 5),
                      CustomText(
                          text: "08h 15m",
                          color: AppColors.darkClrGreen,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.start),
                    ],
                  ),
                ],
              ),
            ),
            if (index == 2)
              for (int i = 0; i < 2; i++) getWeekOffList(),
          ],
        );
      },
    );
  }

  getWeekOffList() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 13),
      child: Container(
        height: 30,
        decoration: BoxDecoration(
          color: AppColors.yellow,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: "week_off".i18n(),
              color: AppColors.black,
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
            CustomText(
              text: ": 06 May 2023 Saturday",
              color: AppColors.grey,
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
      ),
    );
  }
}
