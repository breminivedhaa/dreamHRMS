import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:localization/localization.dart';

import '../colors.dart';
import '../widgets/common.dart';
import 'attendance/add_attendance.dart';
import 'department/deparment.dart';
import 'login.dart';

class HomeMainDrawer extends StatefulWidget {
  const HomeMainDrawer({Key? key}) : super(key: key);

  @override
  State<HomeMainDrawer> createState() => _HomeMainDrawerState();
}

class _HomeMainDrawerState extends State<HomeMainDrawer>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: AppColors.primaryColor1,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: AppBar(
                centerTitle: false,
                elevation: 0,
                leadingWidth: 20.0,
                backgroundColor: Colors.transparent,
                leading: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: SvgPicture.asset("assets/icons/cancel.svg")),
                title: Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: Image.asset('assets/images/logo_white.png'),
                ),
                actions: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/notification1.svg'),
                      SizedBox(width: 8),
                      InkWell(
                        onTap: () {
                          Get.to(() => Login());
                        },
                        // child: Icon(Icons.logout)),
                        child: Container(
                          width: 38.0,
                          height: 38.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  "https://media.istockphoto.com/id/1318482009/photo/young-woman-ready-for-job-business-concept.jpg?s=612x612&w=0&k=20&c=Jc1NcoUMoM78AxPTh9EApaPU2kXh2evb499JgW99b0g=",
                                )),
                            border:
                                Border.all(color: AppColors.white, width: 3),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          BackdropFilter(
            filter: ui.ImageFilter.blur(
              sigmaX: 2.0,
              sigmaY: 2.0,
            ),
            child: Container(
              color: Colors.white,
              width: Get.width * 0.80,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.grey.withOpacity(0.3)),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 15),
                                width: 38.0,
                                height: 38.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        "https://media.istockphoto.com/id/1318482009/photo/young-woman-ready-for-job-business-concept.jpg?s=612x612&w=0&k=20&c=Jc1NcoUMoM78AxPTh9EApaPU2kXh2evb499JgW99b0g=",
                                      )),
                                ),
                              ),
                              SizedBox(width: 5),
                              commonSingleDataDisplay(
                                title1: "Lesley Grauer",
                                text1: "UI/UX Team Leader",
                                titleFontSize: 14,
                                titleFontColor: AppColors.black,
                                titleFontWeight: FontWeight.w600,
                                textFontSize: 12,
                                textFontColor: AppColors.grey,
                                textFontWeight: FontWeight.w500,
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Icon(Icons.arrow_forward_ios_outlined,
                                    color: AppColors.grey),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    commonMenuDisplay(
                      image: "assets/icons/files.svg",
                      imageColor: AppColors.grey,
                      text: "Attendance",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey,
                      onPressed: () {
                        Get.to(() => AddAttendance());
                      },
                    ),
                    commonMenuDisplay(
                      image: "assets/icons/files.svg",
                      imageColor: AppColors.grey,
                      text: "Department",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey,
                      onPressed: () {
                        Get.back();
                        Get.to(() => Department());
                      },
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
