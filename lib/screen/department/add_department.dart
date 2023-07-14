import 'package:dotted_border/dotted_border.dart';
import 'package:dreamhrms/controller/department/add_department_controller.dart';
import 'package:dreamhrms/widgets/custom_dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:localization/localization.dart';

import '../../colors.dart';
import '../../widgets/Custom_rich_text.dart';
import '../../widgets/Custom_text.dart';
import '../../widgets/back_to_screen.dart';
import '../../widgets/common.dart';
import '../../widgets/common_button.dart';
import '../../widgets/common_textformfield.dart';
import '../main_screen.dart';

class AddDepartment extends StatelessWidget {
  final String option;
  const AddDepartment({Key? key, required this.option}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            navBackButton(),
            SizedBox(width: 8),
            CustomText(
              text: option == "Add" ? "add_dept".i18n() : "edit_dept".i18n(),
              color: AppColors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomRichText(
                  textAlign: TextAlign.left,
                  text: "department_name".i18n(),
                  color: AppColors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  textSpan: ' *',
                  textSpanColor: AppColors.red),
              SizedBox(height: 10),
              CommonTextFormField(
                controller: AddDepartmentController.to.deptNameController,
                isBlackColors: true,
                keyboardType: TextInputType.name,
                validator: (String? data) {
                  if (data == "" || data == null) {
                    print("Empty data");
                    return "dept_name_validator".i18n();
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 20),
              CustomRichText(
                  textAlign: TextAlign.left,
                  text: "position".i18n(),
                  color: AppColors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  textSpan: '(Leave this empty for Department)',
                  textSpanColor: AppColors.grey),
              SizedBox(height: 10),
              CommonTextFormField(
                controller: AddDepartmentController.to.positionController,
                isBlackColors: true,
                keyboardType: TextInputType.name,
                validator: (String? data) {
                  if (data == "" || data == null) {
                    print("Empty data");
                    return "position_validator".i18n();
                  } else {
                    return null;
                  }
                },

              ),
              SizedBox(height: 20),
              CustomRichText(
                textAlign: TextAlign.left,
                text: "grade".i18n(),
                color: AppColors.black,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: 10),
              CommonTextFormField(
                controller: AddDepartmentController.to.positionController,
                isBlackColors: true,
                keyboardType: TextInputType.name,
                // validator: (String? data) {
                //   if (data == "" || data == null) {
                //     print("Empty data");
                //     return "position_validator".i18n();
                //   } else {
                //     return null;
                //   }
                // },
              ),
              SizedBox(height: 20),
              CustomRichText(
                textAlign: TextAlign.left,
                text: "grade".i18n(),
                color: AppColors.black,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: 10),
              CommonTextFormField(
                controller: AddDepartmentController.to.positionController,
                isBlackColors: true,
                keyboardType: TextInputType.name,

                // validator: (String? data) {
                //   if (data == "" || data == null) {
                //     print("Empty data");
                //     return "position_validator".i18n();
                //   } else {
                //     return null;
                //   }
                // },
              ),
              SizedBox(height: 20),
              CustomRichText(
                textAlign: TextAlign.left,
                text: "description".i18n(),
                color: AppColors.black,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: 10),
              CommonTextFormField(
                controller: AddDepartmentController.to.positionController,
                isBlackColors: true,
                maxlines: 3,
                keyboardType: TextInputType.name,
                // validator: (String? data) {
                //   if (data == "" || data == null) {
                //     print("Empty data");
                //     return "position_validator".i18n();
                //   } else {
                //     return null;
                //   }
                // },
              ),
              SizedBox(height: 20),
              CustomRichText(
                textAlign: TextAlign.left,
                text: "dept_icon".i18n(),
                color: AppColors.black,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                textSpan: " *",
                textSpanColor: AppColors.red,
              ),
              SizedBox(height: 10),
              CustomDottedBorder(),
              SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: CommonButton(
                      text: "save_next".i18n(),
                      textColor: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      // textAlign: TextAlign.center,
                      onPressed: () {
                        // Get.to(()=>MainScreen());
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              BackToScreen(
                text: "cancel".i18n(),
                arrowIcon: false,
                onPressed: () {
                  Get.back();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
