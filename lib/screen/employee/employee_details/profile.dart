import 'package:dreamhrms/widgets/Custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:localization/localization.dart';

import '../../../colors.dart';
import '../../../widgets/common.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "profile".i18n(),
                  color: AppColors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 20),
                employeeInformation(),
                SizedBox(height: 20),
                personalInformation(),
                SizedBox(height: 20),
                emergencyContact(),
                SizedBox(height: 20),
                dependenceInformation(),
                SizedBox(height: 20),
                educationInformation(),
                SizedBox(height: 20),
                workInformation(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  employeeInformation() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: "emp_information".i18n(),
              color: AppColors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            SvgPicture.asset("assets/icons/edit.svg"),
          ],
        ),
        SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(
                color: AppColors.grey.withOpacity(0.3),
                // width: 1.0,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(14))),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                commonDataDisplay(
                    title1: "emp_id".i18n(),
                    text1: "FT-001".i18n(),
                    title2: "department".i18n(),
                    text2: "UI/UX"),
                commonDataDisplay(
                    title1: "dob".i18n(),
                    text1: "25 May 2000".i18n(),
                    title2: "line_manager".i18n(),
                    text2: "John Smith"),
                commonDataDisplay(
                    title1: "mail".i18n(),
                    text1: "richard@example.com".i18n(),
                    title2: "phone_number".i18n(),
                    text2: "9879879876"),
                commonSingleDataDisplay(
                    title1: "marital_status".i18n(),
                    text1: "-".i18n(),
                    titleFontSize: 11,
                    textFontSize: 13),
              ],
            ),
          ),
        )
      ],
    );
  }

  educationInformation() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: "education_information".i18n(),
              color: AppColors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            SvgPicture.asset("assets/icons/edit.svg"),
          ],
        ),
        SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(
                color: AppColors.grey.withOpacity(0.3),
                // width: 1.0,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(14))),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                    text: "Master of Business Administration",
                    color: AppColors.secondaryColor,
                    fontSize: 11,
                    fontWeight: FontWeight.w400),
                SizedBox(height: 10),
                CustomText(
                    text: "Massachusetts Institute of Technology",
                    color: AppColors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
                SizedBox(height: 10),
                Row(
                  children: [
                    SvgPicture.asset("assets/icons/book.svg"),
                    SizedBox(width: 5),
                    CustomText(
                        text: "3.51 GPA",
                        color: AppColors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                    SizedBox(width: 15),
                    SvgPicture.asset("assets/icons/calendar.svg"),
                    SizedBox(width: 5),
                    CustomText(
                        text: "Jul 2020 - March 2022",
                        color: AppColors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  workInformation() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: "work_history".i18n(),
              color: AppColors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            SvgPicture.asset("assets/icons/edit.svg"),
          ],
        ),
        SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(
                color: AppColors.grey.withOpacity(0.3),
                // width: 1.0,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(14))),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                    text: "Lead Designer",
                    color: AppColors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
                SizedBox(height: 10),
                CustomText(
                    text: "Dreamguy's Technologies Pvt, Ltd,.",
                    color: AppColors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
                SizedBox(height: 10),
                Row(
                  children: [
                    SvgPicture.asset("assets/icons/calendar.svg"),
                    SizedBox(width: 5),
                    CustomText(
                        text: "Jul 2020 - March 2022",
                        color: AppColors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                    SizedBox(width: 15),
                    SvgPicture.asset("assets/icons/location.svg"),
                    SizedBox(width: 5),
                    CustomText(
                        text: "Coimbatore",
                        color: AppColors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  dependenceInformation() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: "depend_information".i18n(),
              color: AppColors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            SvgPicture.asset("assets/icons/edit.svg"),
          ],
        ),
        SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(
                color: AppColors.grey.withOpacity(0.3),
                // width: 1.0,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(14))),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                    text: "depend_1".i18n(),
                    color: AppColors.blue,
                    fontSize: 11,
                    fontWeight: FontWeight.w400),
                SizedBox(height: 10),
                commonDataDisplay(
                    title1: "name".i18n(),
                    text1: "Mike Litrous".i18n(),
                    title2: "relationship".i18n(),
                    text2: "Father"),
                commonDataDisplay(
                    title1: "mail".i18n(),
                    text1: "richard@example.com".i18n(),
                    title2: "phone_number".i18n(),
                    text2: "9879879876"),
              ],
            ),
          ),
        )
      ],
    );
  }

  emergencyContact() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: "emergency_contact".i18n(),
              color: AppColors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            SvgPicture.asset("assets/icons/edit.svg"),
          ],
        ),
        SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(
                color: AppColors.grey.withOpacity(0.3),
                // width: 1.0,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(14))),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                    text: "primary".i18n(),
                    color: AppColors.blue,
                    fontSize: 11,
                    fontWeight: FontWeight.w400),
                SizedBox(height: 10),
                commonDataDisplay(
                    title1: "name".i18n(),
                    text1: "Mike Litrous".i18n(),
                    title2: "relationship".i18n(),
                    text2: "Father"),
                commonDataDisplay(
                    title1: "mail".i18n(),
                    text1: "richard@example.com".i18n(),
                    title2: "phone_number".i18n(),
                    text2: "9879879876"),
              ],
            ),
          ),
        )
      ],
    );
  }

  personalInformation() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: "personal_information".i18n(),
              color: AppColors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            SvgPicture.asset("assets/icons/edit.svg"),
          ],
        ),
        SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(
                color: AppColors.grey.withOpacity(0.3),
                // width: 1.0,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(14))),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                commonDataDisplay(
                    title1: "grade".i18n(),
                    text1: "A".i18n(),
                    title2: "shift".i18n(),
                    text2: "Morning"),
                commonDataDisplay(
                    title1: "shift_time".i18n(),
                    text1: "06:00am - 02:00pm".i18n(),
                    title2: "emp_type".i18n(),
                    text2: "Full Time"),
                commonDataDisplay(
                    title1: "status".i18n(),
                    text1: "Active".i18n(),
                    title2: "blood".i18n(),
                    text2: "B+"),
                commonDataDisplay(
                    title1: "marital_status".i18n(),
                    text1: "Single".i18n(),
                    title2: "nationality".i18n(),
                    text2: "Indian"),
                commonSingleDataDisplay(
                  title1: "address".i18n(),
                  text1: "Cbe".i18n(),
                  titleFontSize: 11,
                  textFontSize: 13,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
