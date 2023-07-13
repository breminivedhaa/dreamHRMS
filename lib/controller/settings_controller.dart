import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController{
  static SettingsController get to => Get.put(SettingsController());


  TextEditingController branch = TextEditingController();

  final _branchList=[].obs;

  get branchList => _branchList.value;

  set branchList(value) {
    _branchList.value = value;
  }
}