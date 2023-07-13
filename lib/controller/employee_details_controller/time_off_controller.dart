import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../colors.dart';

class TimeOffController extends GetxController {
  static TimeOffController get to => Get.put(TimeOffController());

  final _permissionButton=true.obs;

  get permissionButton => _permissionButton.value;

  set permissionButton(value) {
    _permissionButton.value = value;
  }

  final _leaveButton=false.obs;

  get leaveButton => _leaveButton.value;

  set leaveButton(value) {
    _leaveButton.value = value;
  }
}
