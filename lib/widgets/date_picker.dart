import 'package:dreamhrms/controller/employee_details_controller/time_sheet_controller.dart';
import 'package:dreamhrms/screen/employee/employee_details/time_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../colors.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  String? _dateCount;
  String? _range;

  @override
  void initState() {
    _dateCount = '';
    _range = '';
    super.initState();
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        TimeSheetController.to.attendanceStartDate =
            "${DateFormat.y().format(args.value.startDate).toString()}-${DateFormat.M().format(args.value.startDate).toString()}-"
            "${DateFormat.d().format(args.value.startDate ?? args.value.startDate).toString()}";
        TimeSheetController.to.attendanceEndDate =
        "${DateFormat.y().format(args.value.endDate ?? args.value.startDate).toString()}-${DateFormat.M().format(args.value.endDate ?? args.value.startDate).toString()}-"
            "${DateFormat.d().format(args.value.endDate ?? args.value.startDate).toString()}";
        TimeSheetController.to.attendanceDate =
            DateFormat.d().format(args.value.startDate).toString() +
                " " +
                DateFormat.LLL().format(args.value.startDate).toString() +
                ' - ' +
                DateFormat.d()
                    .format(args.value.endDate ?? args.value.startDate)
                    .toString() +
                " " +
                DateFormat.LLL()
                    .format(args.value.endDate ?? args.value.startDate)
                    .toString() +
                " " +
                DateFormat.y()
                    .format(args.value.endDate ?? args.value.endDate ?? args.value.startDate)
                    .toString();

      } else if (args.value is DateTime) {
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> startDateComponents = TimeSheetController.to.attendanceStartDate.split("-");
    List<String> endDateComponents = TimeSheetController.to.attendanceEndDate.split("-");
    print("Start Date & End Date ${TimeSheetController.to.attendanceStartDate} - ${TimeSheetController.to.attendanceEndDate}");
    return Scaffold(
      body: Column(
        children: [
          SfDateRangePicker(
            onSelectionChanged: _onSelectionChanged,
            selectionMode: DateRangePickerSelectionMode.range,
            confirmText: "OK",
            cancelText: "OK",
            // Function()? onCancel,   dynamic Function(Object?)? onSubmit,
            initialSelectedRange: PickerDateRange(
                DateTime(int.parse(startDateComponents[0]),int.parse(startDateComponents[1]), int.parse(startDateComponents[2])),
                DateTime(int.parse(endDateComponents[0]),int.parse(endDateComponents[1]), int.parse(endDateComponents[2]))
                // DateTime(2023, 6, 01),
                // DateTime(DateTime.now().year, DateTime.now().month, 01),
                // DateTime.tryParse("2023-07-01 00:00:00.000"),
                // DateTime.now()),
          ),
          )],
      ),
    );
  }
}
