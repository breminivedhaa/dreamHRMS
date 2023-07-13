import 'package:dreamhrms/screen/login.dart';
import 'package:dreamhrms/screen/set_password.dart';
import 'package:dreamhrms/screen/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:localization/localization.dart';

import '../colors.dart';
import '../controller/login_controller.dart';
import '../widgets/Custom_rich_text.dart';
import '../widgets/Custom_text.dart';
import '../widgets/back_to_screen.dart';
import '../widgets/common_button.dart';
import '../widgets/common_textformfield.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Column(
          children: [
            SizedBox(height: 100),
            headerPart(),
            SizedBox(height: 30),
            bodyPart(context),
          ],
        ),
      ),
    );
  }

  Widget bodyPart(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: CustomRichText(
              textAlign: TextAlign.center,
              text: "email".i18n(),
              color: AppColors.black,
              fontSize: 12,
              fontWeight: FontWeight.w400, textSpan: ' *',textSpanColor: AppColors.red,
            ),
          ),
          SizedBox(height: 10),
          CommonTextFormField(
            controller: LoginController.to.userEmail,
            // hintText: "mail_hint".i18n(),
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
          SizedBox(height: 25),
          Row(
            children: [
              Expanded(
                child: CommonButton(
                  text: "password_reset_sendlink".i18n(),
                  textColor: AppColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  // textAlign: TextAlign.center,
                  onPressed: () {
                    _showAlert(context);
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          BackToScreen(
            text: "back_to_login".i18n(),
            arrowIcon: true,
            onPressed: () {
              Get.off(Login());
            },
          )
        ],
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
          SizedBox(height: 30),
          CustomText(
              text: "forgot_password".i18n(),
              color: AppColors.black,
              fontSize: 25,
              fontWeight: FontWeight.w700),
          SizedBox(height: 10),
          CustomText(
              text: "forgot_password_message".i18n(),
              color: AppColors.grey,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.center),
        ],
      ),
    );
  }

  void _showAlert(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => Dialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: _buildPopupDialog(context),
            ));
  }

  Widget _buildPopupDialog(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width * 0.99,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: const BorderRadius.all(Radius.circular(18))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset("assets/icons/mail_blue.svg"),
          SizedBox(height: 10),
          CustomText(
              text: "check_mail".i18n(),
              color: AppColors.black,
              fontSize: 20,
              fontWeight: FontWeight.w700),
          SizedBox(height: 20),
          CustomText(
              text: "mail_send_message".i18n(),
              color: AppColors.grey,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.center),
          SizedBox(height: 10),
          CustomText(
              text: "your mail ID",
              color: AppColors.black,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.center),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: CommonButton(
                  text: "close".i18n(),
                  textColor: AppColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  // textAlign: TextAlign.center,
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          BackToScreen(
            text: "back_to_login".i18n(),
            arrowIcon: true,
            onPressed: () {
              Get.off(Login());
            },
          ),
          SizedBox(height: 15),
          CustomRichText(
            text: "not_receive_mail".i18n(),
            color: AppColors.grey,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            textAlign: TextAlign.center,
            textSpan: "resend_mail".i18n(),
            textSpanColor: AppColors.blue,
            textSpanFontSize: 14,
            textSpanFontWeight: FontWeight.w600,
            textSpanTextAlign: TextAlign.center,
            onPressed: () {
              Get.to(() => SetPassword());
            },
          ),
        ],
      ),
    );
  }

}
