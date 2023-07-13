import 'package:dreamhrms/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:localization/localization.dart';
import '../colors.dart';
import '../controller/signup_controller.dart';
import '../widgets/Custom_rich_text.dart';
import '../widgets/Custom_text.dart';
import '../widgets/common_button.dart';
import '../widgets/common_searchable_dropdown/MainCommonSearchableDropDown.dart';
import '../widgets/common_textformfield.dart';
import 'new_password_screen.dart';

class Signup extends StatelessWidget {
  Signup({Key? key}) : super(key: key);

  final signupController = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Form(
          key: signupController.formKey,
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: 100),
                  headerPart(),
                  SizedBox(height: 10),
                  bodyPart(),
                ],
              ),
              Positioned(
                bottom: 90,
                left: 0,
                right: 0,
                child: Row(
                  children: [
                    Expanded(
                      child: CommonButton(
                        text: "get_started".i18n(),
                        textColor: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        // textAlign: TextAlign.center,
                        onPressed: () {
                          print("opressed......");
                          Get.to(() => NewPasswordScreen());
                          // if(signupController.formKey.currentState!.validate()) {
                          //   print("condition true......");
                          // }
                          // Get.back();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: CustomRichText(
                      text: "already_account".i18n(),
                      color: AppColors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.center,
                      textSpan: "login".i18n(),
                      textSpanColor: AppColors.blue,
                      textSpanFontSize: 14,
                      textSpanFontWeight: FontWeight.w600,
                      textSpanTextAlign: TextAlign.center,
                      onPressed: () {
                        Get.to(() => Login());
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget headerPart() {
    return Center(
      child: Column(
        children: [
          Image.asset(
            "assets/images/logo_hr.png",
            fit: BoxFit.contain,
          ),
          SizedBox(height: 25),
          CustomText(
              text: "account_create".i18n(),
              color: AppColors.black,
              fontSize: 25,
              fontWeight: FontWeight.w700),
          SizedBox(height: 10),
          CustomText(
              text: "account_fields".i18n(),
              color: AppColors.grey,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget bodyPart() {
    return Container(
      height: Get.height * 0.55,
      child: Align(
        alignment: Alignment.centerLeft,
        child: ListView(
          shrinkWrap: true,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // SizedBox(height: 10),
            CustomRichText(
                textAlign: TextAlign.left,
                text: "first_name".i18n(),
                color: AppColors.black,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                textSpan: ' *',
                textSpanColor: AppColors.red),
            SizedBox(height: 10),
            CommonTextFormField(
              controller: signupController.firstName,
              isBlackColors: true,
              keyboardType: TextInputType.name,
              validator: (String? data) {
                if (data == "" || data == null) {
                  print("Empty data");
                  return "first_name_validator".i18n();
                } else {
                  return null;
                }
              },
            ),
            SizedBox(height: 10),
            CustomRichText(
                textAlign: TextAlign.left,
                text: "last_name".i18n(),
                color: AppColors.black,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                textSpan: ' *',
                textSpanColor: AppColors.red),
            SizedBox(height: 10),
            CommonTextFormField(
              controller: signupController.lastName,
              isBlackColors: true,
              keyboardType: TextInputType.name,
              validator: (String? data) {
                if (data == "" || data == null) {
                  return "last_name_validator".i18n();
                } else {
                  return null;
                }
              },
            ),
            SizedBox(height: 10),
            CustomRichText(
                textAlign: TextAlign.left,
                text: "email".i18n(),
                color: AppColors.black,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                textSpan: ' *',
                textSpanColor: AppColors.red),
            SizedBox(height: 10),
            CommonTextFormField(
              controller: signupController.emailAddress,
              isBlackColors: true,
              keyboardType: TextInputType.emailAddress,
              validator: (String? data) {
                if (data == "" || data == null) {
                  return "required_email".i18n();
                } else {
                  return null;
                }
              },
            ),
            SizedBox(height: 10),
            CustomRichText(
                textAlign: TextAlign.left,
                text: "job_title".i18n(),
                color: AppColors.black,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                textSpan: ' *',
                textSpanColor: AppColors.red),
            SizedBox(height: 10),
            CommonTextFormField(
              controller: signupController.jobTitle,
              isBlackColors: true,
              keyboardType: TextInputType.text,
              validator: (String? data) {
                if (data == "" || data == null) {
                  return "job_title_validator".i18n();
                } else {
                  return null;
                }
              },
            ),
            SizedBox(height: 10),
            CustomRichText(
                textAlign: TextAlign.left,
                text: "company_name".i18n(),
                color: AppColors.black,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                textSpan: ' *',
                textSpanColor: AppColors.red),
            SizedBox(height: 10),
            CommonTextFormField(
              controller: signupController.companyName,
              isBlackColors: true,
              keyboardType: TextInputType.text,
              validator: (String? data) {
                if (data == "" || data == null) {
                  return "company_name_validator".i18n();
                } else {
                  return null;
                }
              },
            ),
            SizedBox(height: 10),
            CustomRichText(
                textAlign: TextAlign.left,
                text: "phone_number".i18n(),
                color: AppColors.black,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                textSpan: ' *',
                textSpanColor: AppColors.red),
            SizedBox(height: 10),
            CommonTextFormField(
              controller: signupController.phoneNumber,
              isBlackColors: true,
              keyboardType: TextInputType.number,
              validator: (String? data) {
                if (data == "" || data == null) {
                  return "phone_number_validator".i18n();
                } else {
                  return null;
                }
              },
            ),
            SizedBox(height: 10),
            CustomRichText(
                textAlign: TextAlign.left,
                text: "emp_count".i18n(),
                color: AppColors.black,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                textSpan: ' *',
                textSpanColor: AppColors.red),
            SizedBox(height: 10),
            MainSearchableDropDown(
                title: 'country',
                hint: "emp_count_hint".i18n(),
                items: signupController.employeeCountList,
                controller: signupController.employeeCount,
                onChanged: (data) {
                  print("test data response $data");
                }),
            SizedBox(height: 10),
            CustomRichText(
                textAlign: TextAlign.left,
                text: "country".i18n(),
                color: AppColors.black,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                textSpan: ' *',
                textSpanColor: AppColors.red),
            SizedBox(height: 10),
            MainSearchableDropDown(
                title: 'country',
                hint: "country_hint".i18n(),
                items: signupController.countryList,
                controller: signupController.country,
                onChanged: (data) {
                  print("test data response $data");
                }),

          ],
        ),
      ),
    );
  }
}
