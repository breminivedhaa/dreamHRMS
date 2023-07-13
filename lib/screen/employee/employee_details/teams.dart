import 'package:dreamhrms/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:localization/localization.dart';

import '../../../widgets/Custom_text.dart';

class Teams extends StatelessWidget {
  const Teams({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                  text: "teams".i18n(),
                  color: AppColors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
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
  getListData(){
    return  ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) {
          var ownerImg =
              "https://media.istockphoto.com/id/1318482009/photo/young-woman-ready-for-job-business-concept.jpg?s=612x612&w=0&k=20&c=Jc1NcoUMoM78AxPTh9EApaPU2kXh2evb499JgW99b0g=";
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(
                    color: AppColors.grey.withOpacity(0.3),
                    // width: 1.0,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                      width: Get.width*0.30,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                    ),
                    Spacer(),
                    Container(
                      height: 30,width: 60,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color:index/2==0?AppColors.lightGreen:AppColors.lightRed,
                          borderRadius:
                          const BorderRadius.all(Radius.circular(6))),
                      child:  CustomText(
                        text: index/2==0?"Present":"Absent",
                        color: index/2==0?AppColors.green:AppColors.red,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.center,
                      ),
                    ),

                  ],
                ),
              ),
            ),
          );
        });
  }
}
