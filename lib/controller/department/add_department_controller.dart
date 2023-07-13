import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddDepartmentController extends GetxController{
  static AddDepartmentController get to => Get.put(AddDepartmentController());

  final formKey = GlobalKey<FormState>();

  TextEditingController deptNameController = TextEditingController();
  TextEditingController positionController = TextEditingController();
  TextEditingController GradeController = TextEditingController();
  TextEditingController DescriptionController = TextEditingController();
}