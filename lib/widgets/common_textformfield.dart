import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_icons/line_icons.dart';

import 'package:flutter_svg/svg.dart';
import '../colors.dart';

class CommonTextFormField extends StatefulWidget {
  const CommonTextFormField(
      {Key? key,
      this.validator,
      this.lableText,
      this.hintText,
      this.password = false,
      this.maxLength,
      this.keyboardType,
      this.controller,
      this.phoneCode = false,
      this.errorText,
      this.maxlines = 1,
      this.enable = true,
      this.inputFormatters,
      this.isBlackColors = false,
      this.order,
      this.width = 230,
      this.isDatePicker = false,
      this.onClear,
      this.child,
      this.onTap,
      this.onChanged})
      : super(key: key);

  final String? lableText;
  final String? hintText;
  final String? errorText;
  final bool? password;
  final double width;
  final bool? isDatePicker;
  final int? maxLength;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final bool? phoneCode;
  final int? maxlines;
  final Widget? child;

  final bool isBlackColors;
  final Function()? onTap;
  final Function()? onClear;

  final Function(dynamic)? onChanged;

  final bool enable;
  final double? order;

  @override
  State<CommonTextFormField> createState() => _CommonTextFormFieldState();
}

class _CommonTextFormFieldState extends State<CommonTextFormField> {
  bool passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: widget.width==""||widget.width==null?230:widget.width,
      child: GestureDetector(
        onTap: () {
          if (widget.isDatePicker == true) {
            // widget.onTap();
           widget.onTap;
          }
        },
        child: TextFormField(
          onTap: () {
            widget.onTap;
          },
          onChanged: (data) {
            // widget.onChanged!(data);
          },
          readOnly: widget.isDatePicker == true ? true : false,
          inputFormatters: widget.inputFormatters,
          cursorColor: AppColors.black,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          enabled: widget.enable,
          maxLength: widget.maxLength,
          maxLines: widget.maxlines,
          validator: widget.validator,
          style: TextStyle(color: AppColors.black, fontWeight: FontWeight.w400),
          decoration: InputDecoration(
            labelText: widget.lableText,
            counterStyle: TextStyle(color: AppColors.black),
            alignLabelWithHint: true,
            hintText: widget.hintText,
            isDense: true, // Added this
            contentPadding: widget.maxlines == 1
                ? EdgeInsets.all(8)
                : EdgeInsets.only(top: 30, left: 8), // Added this
            hintStyle:
                TextStyle(color: AppColors.black.withAlpha(150), fontSize: 13),
            labelStyle:
                TextStyle(color: AppColors.black.withAlpha(200), fontSize: 13),
            errorText: widget.errorText,
            suffixIcon: widget.isDatePicker == true
                ? FocusScope(
                    canRequestFocus: false,
                    child: Container(
                      width: 20,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              widget.onTap!();
                            },
                            child: Icon(LineIcons.calendar,
                                color: AppColors.black),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          InkWell(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              widget.controller!.clear();
                              widget.onClear!();
                            },
                            child: Icon(Icons.close, color: AppColors.black),
                          ),
                        ],
                      ),
                    ),
                  )
                : widget.password == true
                    ? FocusScope(
                        canRequestFocus: false,
                        child: InkWell(
                          onTap: () {
                            setState(
                              () {
                                passwordVisible = !passwordVisible;
                              },
                            );
                          },
                          child: Icon(
                              !passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: AppColors.grey),
                        ),
                      )
                    : FocusScope(
                        canRequestFocus: false,
                        child: const SizedBox(
                          height: 20,
                          width: 0,
                        )),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: AppColors.lightGrey, width: 1.7),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.black, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.lightGrey, width: 1),
            ),

            fillColor: AppColors.black,
          ),
          obscureText: widget.password == true ? !passwordVisible : false,
        ),
      ),
    );
  }
}
