import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get to => Get.put(SignupController());

  final formKey = GlobalKey<FormState>();

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController emailAddress = TextEditingController();
  TextEditingController jobTitle = TextEditingController();
  TextEditingController jobName = TextEditingController();
  TextEditingController companyName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController employeeCount = TextEditingController();
  TextEditingController country = TextEditingController();

  final _employeeCountList = [].obs;

  get employeeCountList => _employeeCountList.value;

  set employeeCountList(value) {
    _employeeCountList.value = value;
  }

  final _countryList = [].obs;

  get countryList => _countryList.value;

  set countryList(value) {
    _countryList.value = value;
  }
}
