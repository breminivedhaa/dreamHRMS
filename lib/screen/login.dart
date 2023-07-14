import 'package:dreamhrms/controller/login_controller.dart';
import 'package:dreamhrms/screen/sign_up.dart';
import 'package:dreamhrms/widgets/common_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:localization/localization.dart';

import '../colors.dart';
import '../widgets/Custom_rich_text.dart';
import '../widgets/Custom_text.dart';
import '../widgets/common_textformfield.dart';
import 'forgot_password.dart';
import 'main_screen.dart';

// import 'package:localization/localization.dart';
class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   LoginController.to.loginInit();
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: 70),
                loginHeader(),
                SizedBox(height: 30),
                loginBody(),
                SizedBox(height: 30),
                loginBottom(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CustomRichText(
                  text: "no_account".i18n(),
                  color: AppColors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.center,
                  textSpan: "sign_up".i18n(),
                  textSpanColor: AppColors.blue,
                  textSpanFontSize: 14,
                  textSpanFontWeight: FontWeight.w600,
                  textSpanTextAlign: TextAlign.center,
                  onPressed: () {
                    Get.to(() => Signup());
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget loginHeader() {
    return Center(
      child: Column(
        children: [
          Image.asset(
            "assets/images/logo_hr.png",
            fit: BoxFit.contain,
          ),
          SizedBox(height: 15),
          CustomText(
              text: "welcome".i18n(),
              color: AppColors.black,
              fontSize: 25,
              fontWeight: FontWeight.w700),
          SizedBox(height: 10),
          CustomText(
              text: "login_message".i18n(),
              color: AppColors.grey,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget loginBody() {
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
                fontWeight: FontWeight.w400,
                textSpan: ' *',
                textSpanColor: AppColors.red),
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
          SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: CustomRichText(
                textAlign: TextAlign.center,
                text: "password".i18n(),
                color: AppColors.black,
                fontSize: 12,
                fontWeight: FontWeight.w400,
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
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  rememberToggle(),
                  SizedBox(width: 5),
                  CustomText(
                      text: "remember_me".i18n(),
                      color: AppColors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Rubik"),
                ],
              ),
              CustomText(
                  text: "forgot_password?".i18n(),
                  color: AppColors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Rubik",
                  onPressed: () {
                    Get.to(() => ForgotPassword());
                  }),
            ],
          ),
          SizedBox(height: 25),
          Row(
            children: [
              Expanded(
                child: CommonButton(
                  text: "login".i18n(),
                  textColor: AppColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  // textAlign: TextAlign.center,
                  onPressed: () {
                    LoginController.to.login();
                    // Get.to(() => Encrypt());
                    // Get.to(() => MainScreen());
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget rememberToggle() {
    return FlutterSwitch(
      height: 25,
      width: 50,
      // toggleSize: 26,
      // showOnOff: true,
      valueFontSize: 11,
      activeColor: AppColors.lightGrey,
      activeTextColor: AppColors.grey,
      inactiveColor: AppColors.lightGrey,
      inactiveTextColor: AppColors.grey,
      // switchBorder: Border.all(
      //   color: AppColors.primaryColor
      // ),
      value: false,
      // value: ProvisionController.to.comparableProvisionModules[ProvisionController.to.modules[mainIndex]['_id']]['sub_module'][subModulesList[index]['_id']]['read'],
      onToggle: (val) {
        // StaffCreationController.to.updateReadToProvisionedSubModules(
        //     moduleId:ProvisionController.to.modules[mainIndex]['_id'],
        //     subModuleId: subModulesList[index]['_id']
        // );
      },
    );
  }

  Widget loginBottom() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Divider(color: AppColors.grey.withOpacity(0.5))),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: CustomText(
                  text: "continue_other_login".i18n(),
                  color: AppColors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.center),
            ),
            Expanded(child: Divider(color: AppColors.grey.withOpacity(0.5))),
          ],
        ),
        SizedBox(height: 20),
        otherLogin(image: "assets/images/google.png", text: "google".i18n()),
        otherLogin(image: "assets/images/octa.png", text: "octa".i18n()),
        otherLogin(
            image: "assets/images/microsoft.png", text: "microsoft".i18n()),
      ],
    );
  }

  otherLogin({required String image, required String text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.grey.withOpacity(0.5),
            // width: 1.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                fit: BoxFit.contain,
              ),
              SizedBox(width: 10),
              CustomText(
                text: text,
                color: AppColors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Future<String> encryptMessage(String message, String key) async {
//    Sodium.init();
//    if (Sodium.isInitialized) {
//      final key = Sodium.cryptoSecretBoxKeygen();
//      final nonce = Sodium.randombytesBuf(Sodium.cryptoSecretBoxNonceBytes);
//      final message = 'Hello, World!';
//
//      final encrypted = Sodium.cryptoSecretBoxEasy(message.codeUnits, nonce, key);
//
//
//        _encryptedMessage = Sodium.bin2hex(encrypted);
//
//    }
// }

// Future<String> decryptMessage(String encryptedMessage, String key) async {
//   final encryptedBytes = base64.decode(encryptedMessage);
//   final keyBytes = utf8.encode(key);
//
//   final decrypted = await Sodium.cryptoSecretBoxOpenEasy(
//     encryptedBytes,
//     Uint8List(24), // The nonce used during encryption
//     keyBytes,
//   );
//
//   return utf8.decode(decrypted);
// }