import 'package:dreamhrms/colors.dart';
import 'package:dreamhrms/widgets/Custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:localization/localization.dart';

import '../../widgets/animator_rotate.dart';
import '../../widgets/slider.dart';
import 'employee_details.dart';

class EmployeeList extends StatelessWidget {
  const EmployeeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: CustomText(
              text: "employees".i18n(),
              color: AppColors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600,
              textAlign: TextAlign.start),
        ),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: 8,
          itemBuilder: (context, index) {
            var ownerImg =
                "https://media.istockphoto.com/id/1318482009/photo/young-woman-ready-for-job-business-concept.jpg?s=612x612&w=0&k=20&c=Jc1NcoUMoM78AxPTh9EApaPU2kXh2evb499JgW99b0g=";
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: InkWell(
                onTap: (){
                  Get.to(()=>EmployeeDetails());
                },
                child: SlideANimator(
                   Container(
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        border: Border.all(
                          color: AppColors.grey.withOpacity(0.3),
                          // width: 1.0,
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Stack(
                                        children: [
                                          ClipOval(
                                              child: Image.network(
                                                ownerImg,
                                                fit: BoxFit.cover,
                                                width: 50.0,
                                                height: 50.0,
                                              )),
                                          Positioned(
                                              left: 37,top: 38,
                                              child:
                                          Container(
                                            width: 12,height: 12,
                                            decoration: BoxDecoration(
                                              color: AppColors.green,
                                              borderRadius: BorderRadius.all(Radius.circular(30)
                                            ),
                                              border: Border.all(
                                                color: AppColors.white, // Replace with desired border color
                                                width: 2, // Replace with desired border width
                                              ),
                                          )

                                          )
                                          )],
                                      ),
                                      SizedBox(width: 10,),
                                      SizedBox(
                                        width: Get.width*0.55,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            CustomText(
                                              text: "DGT0025".i18n(),
                                              color: AppColors.secondaryColor,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            SizedBox(height: 8),
                                            CustomText(
                                              text: "John Walker".i18n(),
                                              color: AppColors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            SizedBox(height: 8),
                                            CustomText(
                                              text: "UI Designer".i18n(),
                                              color: AppColors.grey,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  )

                                ],
                              ),
                              Spacer(),
                              InkWell(
                                  onTap: () {},
                                  child: Icon(Icons.more_vert_outlined,color: AppColors.grey,)),
                            ],
                          ),
                          SizedBox(
                            height: 5
                          ),
                          Divider(
                            color: AppColors.grey.withOpacity(0.10),
                            thickness: 2,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset("assets/icons/mail.svg"),
                              SizedBox(
                                width: 10,
                              ),
                              CustomText(text: "johnwalsker@hrms.com", color: AppColors.grey, fontSize: 13, fontWeight: FontWeight.w400)
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset("assets/icons/call.svg"),
                              SizedBox(
                                width: 10,
                              ),
                              CustomText(text: "9876543210", color: AppColors.grey, fontSize: 13, fontWeight: FontWeight.w400)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
