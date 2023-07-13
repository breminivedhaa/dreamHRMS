import 'package:dreamhrms/screen/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../colors.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      print("future delayed....");
      Get.off(Login());
    });
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Stack(
          children: [centerLogoIcon(), bottomImage()],
        ),
      ),
    );
  }

  centerLogoIcon() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 300),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              "assets/images/logo.png",
              fit: BoxFit.contain,
              // width: 150,
              // height: 150,
            ),
          ),
        ],
      ),
    );
  }

  bottomImage() {
    return Positioned(
      bottom: 5,
      left: 0,
      right: 0,
      child: Image.asset(
        "assets/images/splash_background.png",
        fit: BoxFit.cover, // Adjust the fit as needed
      ),
    );
  }
}
