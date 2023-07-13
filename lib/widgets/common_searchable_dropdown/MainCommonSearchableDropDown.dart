import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../colors.dart';
import 'commonSearchableDropDown.dart';

class MainSearchableDropDown extends StatefulWidget {
  final String title;
  final String? label;
  final String hint;
  final String? initialValue;
  final items;
  final double? order;
  final Function(dynamic) onChanged;
  final TextEditingController controller;
  final bool isRequired;
  MainSearchableDropDown({
    Key? key,
    required this.items,
    this.label,
    required this.title,
    required this.controller,
    this.initialValue,
    this.isRequired = false,
    this.order,
    required this.onChanged,
    required this.hint,
  }) : super(key: key);

  @override
  State<MainSearchableDropDown> createState() => _MainSearchableDropDownState();
}

class _MainSearchableDropDownState extends State<MainSearchableDropDown> {
  String validationControllerText = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.initialValue != null && widget.initialValue!.isNotEmpty) {
      setState(() {
        widget.controller.text = widget.initialValue!;
      });
    }

    setState(() {
      validationControllerText = "test";
    });
  }

  @override
  Widget build(BuildContext context) {
    //validationControllerText=widget.initialValue!;
    return FocusScope(
      canRequestFocus: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: Get.width,

            // color: AppColors.white,
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: DropdownFormField<Map<String, dynamic>>(
                  // label: "${widget.label}",
                  order: widget.order,
                  hint: widget.hint,
                  isRequired: widget.isRequired,
                  title: "${widget.title}",
                  initialValue: widget.controller.text == ""
                      ? widget.initialValue ?? ""
                      : widget.controller.text,
                  validator: (dynamic data) {
                    debugPrint("test validator $data");
                    if (data == null) {
                      setState(() {
                        if (widget.controller.text.isEmpty) {
                          validationControllerText = "";
                        } else {
                          validationControllerText = "test";
                        }
                      });
                    } else {
                      setState(() {
                        validationControllerText = "test";
                      });
                    }
                  },
                  onChanged: (dynamic data) {
                    if (data == "") {
                      // setState((){
                      //   validationControllerText="";
                      // });
                    } else {
                      setState(() {
                        validationControllerText = "${data['${widget.title}']}";
                      });
                      print("test data $data");
                      widget.onChanged(data);
                      widget.controller.text = data['${widget.title}'];
                    }
                  },
                  textController: widget.controller,
                  displayItemFn: (dynamic item) => Text(
                        (item ?? {})['${widget.title}'] ?? "",
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            overflow: TextOverflow.ellipsis,
                            color: AppColors.primaryColor),
                      ),
                  findFn: (dynamic str) async => widget.items,
                  selectedFn: (dynamic item1, dynamic item2) {
                    if (item1 != null && item2 != null) {
                      return item1['${widget.title}'] ==
                          item2['${widget.title}'];
                    }
                    return false;
                  },
                  filterFn: (dynamic item, str) =>
                      item['${widget.title}']
                          .toLowerCase()
                          .indexOf(str.toLowerCase()) >=
                      0,
                  dropdownItemFn: (dynamic item, int position, bool focused,
                          bool selected, Function() onTap, index) =>
                      InkWell(
                        onTap: onTap,
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 2, horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              gradient: position == index
                                  ? AppColors
                                      .primaryColor1 /*LinearGradient(
                                      colors: [
                                        AppColors.grey,
                                        AppColors.primaryColor,
                                      ],
                                      begin: const FractionalOffset(0.0, 0.0),
                                      end: const FractionalOffset(1.0, 0.0),
                                      stops: [0.0, 1.0],
                                      tileMode: TileMode.clamp)*/
                                  : null,
                              color: position == index
                                  ? AppColors.primaryColor
                                  : Colors.transparent),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 7),
                            child: Text(
                              "${item['${widget.title}']}",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: position == index
                                      ? AppColors.white
                                      : AppColors.primaryColor),
                            ),
                          ),
                        ),
                      )),
            ),
          ),
          widget.isRequired == true
              ? validationControllerText == ""
                  ? Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        "Please select ${widget.label?.toLowerCase()}",
                        style: TextStyle(fontSize: 12, color: Colors.red),
                      ),
                    )
                  : SizedBox()
              : SizedBox()
        ],
      ),
    );
  }
}
