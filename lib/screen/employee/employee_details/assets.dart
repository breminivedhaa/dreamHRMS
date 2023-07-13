import 'package:dreamhrms/screen/employee/asset_details/asset_info.dart';
import 'package:dreamhrms/screen/employee/assets_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:localization/localization.dart';

import '../../../colors.dart';
import '../../../widgets/Custom_text.dart';

class Assets extends StatelessWidget {
  const Assets({Key? key}) : super(key: key);

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
                CustomText(
                  text: "assets".i18n(),
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

  getListData() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) {
          var ownerImg =
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQyx2HIw5F6Yw-a6-5k6Qo9NM1A8GsXOCapnQ&usqp=CAU";
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: InkWell(
              onTap: (){
                Get.to(()=>AssetsDetails());
              },
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
                      Image.network(
                        ownerImg,
                        fit: BoxFit.cover,
                        width: 58.0,
                        height: 58.0,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: Get.width * 0.55,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "ASSET00001",
                              color: AppColors.secondaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                            SizedBox(height: 8),
                            CustomText(
                              text: "keyboard",
                              color: AppColors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.calendar_today_outlined, size: 13,color: AppColors.grey),
                                SizedBox(width: 8),
                                CustomText(
                                  text: "04 May 2023",
                                  color: AppColors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 20,
                          color: AppColors.grey,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
