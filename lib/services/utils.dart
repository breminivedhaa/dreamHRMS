import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

class UtilService {

  void showToast(BuildContext? context, String? toastType, {required String message}) {
    if (context != null) {
      final scaffold = ScaffoldMessenger.of(context);
      scaffold.showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: TextStyle(
                fontSize: 15,
                color: AppColors.white,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500),
          ),
          backgroundColor:
          toastType == "success" ? AppColors.green : AppColors.red,
        ),
      );
    }
  }


}