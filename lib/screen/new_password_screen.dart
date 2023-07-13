import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:localization/localization.dart';

import '../colors.dart';
import '../controller/login_controller.dart';
import '../widgets/Custom_rich_text.dart';
import '../widgets/Custom_text.dart';
import '../widgets/common_button.dart';
import '../widgets/common_textformfield.dart';
import 'login.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Column(
          children: [
            SizedBox(height: 100),
            headerPart(),
            SizedBox(height: 40),
            bodyPart(),
          ],
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
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SizedBox(height: 10),
          CustomText(
            text: "domain_name".i18n(),
            color: AppColors.black,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: 10),
          CustomText(
            text: "SignupController.to.firstName",
            color: AppColors.grey,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: 20),

          Align(
            alignment: Alignment.centerLeft,
            child: CustomRichText(
                textAlign: TextAlign.center,
                text: "password".i18n(),
                color: AppColors.black,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                textSpan: ' *',
                textSpanColor: AppColors.red),
          ),
          SizedBox(height: 10),
          CommonTextFormField(
            controller: LoginController.to.password,
            // hintText: "mail_hint".i18n(),
            isBlackColors: true,
            password: true,
            keyboardType: TextInputType.emailAddress,
            validator: (String? data) {
              if (data == "" || data == null) {
                return "required_password".i18n();
              } else {
                return null;
              }
            },
          ),
          SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                child: CommonButton(
                  text: "get_started".i18n(),
                  textColor: AppColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  // textAlign: TextAlign.center,
                  onPressed: () {
                    Get.to(() => Login());
                    // if(signupController.formKey.currentState!.validate()) {
                    //   print("condition true......");
                    // }
                    // Get.back();
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
