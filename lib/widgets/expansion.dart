import 'package:dreamhrms/widgets/Custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../colors.dart';

class ExpansionTileWidget extends StatelessWidget {
  final CustomText title;
  final CustomText subTitle;
  final SvgPicture image;
  final Map expansionList;
  final VoidCallback editOnPressed;
  final VoidCallback ContainerOnClick;
  const ExpansionTileWidget(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.expansionList,
      required this.image,
      required this.editOnPressed,
      required this.ContainerOnClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: InkWell(
        // onTap: ,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.grey.withOpacity(0.5)),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: ExpansionTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      image,
                      SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [title, SizedBox(height: 5), subTitle],
                      ),
                    ],
                  ),
                  CircleAvatar(
                      radius: 18,
                      backgroundColor: AppColors.grey.withOpacity(0.1),
                      child: SvgPicture.asset("assets/icons/edit_out.svg"))
                ],
              ),
              iconColor: AppColors.grey,
              trailing: CircleAvatar(
                radius: 18,
                backgroundColor: AppColors.grey.withOpacity(0.1),
                child: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: AppColors.grey.withOpacity(0.8),
                  size: 30, // Custom icon for the collapsed state
                  // Additional properties for the icon
                ),
              ),
              children: <Widget>[
                Column(
                  children: <Widget>[
                    ListView.builder(
                      shrinkWrap: true, // Adjust this as per your requirements
                      itemCount: expansionList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 35),
                          child: InkWell(
                            onTap: ContainerOnClick,
                            child: Container(
                                margin: EdgeInsets.symmetric(vertical: 5),
                                decoration: BoxDecoration(
                                    color: AppColors.blue.withOpacity(0.1),
                                    border: Border.all(
                                        color: AppColors.blue.withOpacity(0.1)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                child: _buildList(context, index)),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildList(BuildContext context, int index) {
    return ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: "HR Manager",
            color: AppColors.black,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: 5),
          CustomText(
            text: "A",
            color: AppColors.grey,
            fontSize: 12,
            fontWeight: FontWeight.w300,
          ),
        ],
      ),
      trailing: InkWell(
        onTap: editOnPressed,
        child: CircleAvatar(
            radius: 18,
            backgroundColor: AppColors.grey.withOpacity(0.1),
            child: SvgPicture.asset("assets/icons/edit_out.svg")),
      ),
      // Additional properties for each list item
    );
  }
}
