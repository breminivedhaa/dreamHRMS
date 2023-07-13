import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TimeSheetController extends GetxController{
  static TimeSheetController get to => Get.put(TimeSheetController());

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

  }
  final  _attendanceDate="".obs;

  get attendanceDate => _attendanceDate.value;

  set attendanceDate(value) {
    _attendanceDate.value = value;
  }

  final  _attendanceStartDate="".obs;

  get attendanceStartDate => _attendanceStartDate.value;

  set attendanceStartDate(value) {
    _attendanceStartDate.value = value;
  }

  final  _attendanceEndDate="".obs;

  get attendanceEndDate => _attendanceEndDate.value;

  set attendanceEndDate(value) {
    _attendanceEndDate.value = value;
  }

  setDateFormat(){
    print(DateTime(DateTime.now().year, DateTime.now().month, 01),);
    attendanceStartDate="${DateFormat.y().format(DateTime.now())}-${DateFormat.M().format(DateTime.now())}-01";
    attendanceEndDate="${DateFormat.y().format(DateTime.now())}-${DateFormat.M().format(DateTime.now())}-${DateFormat.d().format(DateTime.now())}";
    attendanceDate="01 ${DateFormat.LLL().format(DateTime.now())} -"
        " ${DateFormat.d().format(DateTime.now())} ${DateFormat.LLL().format(DateTime.now())} ${DateFormat.y().format(DateTime.now())} ";
  print("attendance date $attendanceStartDate");
  }


}