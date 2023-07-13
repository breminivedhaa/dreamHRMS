import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../colors.dart';
import '../../widgets/Custom_text.dart';

class AddAttendance extends StatefulWidget {
  const AddAttendance({Key? key}) : super(key: key);

  @override
  State<AddAttendance> createState() => _AddAttendanceState();
}

class _AddAttendanceState extends State<AddAttendance> {

  TabController? tabController;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
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
                text: "Add Employees",
                color: AppColors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
          bottom: TabBar(
            controller: tabController,
            onTap: (value){
              setState(() {
              });
            },
              isScrollable: true,
              unselectedLabelColor: AppColors.grey,
              labelColor: Colors.blue,
              tabs: [
            Tab(
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/person.svg', color: tabController?.index == 0 ? Colors.blue : AppColors.grey,),
                  Text("Personal")
                ],
              ),
            ),
            Tab(
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/userCircle.svg'),
                  Text("Employee")
                ],
              ),
            ),
            Tab(
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/users.svg'),
                  Text("Dependency")
                ],
              ),
            ),
            Tab(
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/education.svg'),
                  Text("Educational")
                ],
              ),
            ),
            Tab(
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/files.svg'),
                  Text("Documents")
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }

  navBackButton() {
    return InkWell(
        onTap: () {
          Get.back();
        },
        child: Icon(Icons.arrow_back_ios_new_outlined, color: AppColors.black));
  }
}
