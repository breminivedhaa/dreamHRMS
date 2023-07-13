import 'package:dreamhrms/screen/employee/asset_details/asset_info.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

import '../../colors.dart';
import '../../widgets/Custom_text.dart';
import '../../widgets/common.dart';
import 'asset_details/activity.dart';
import 'asset_details/asset_history.dart';
import 'asset_details/attachment.dart';

class AssetsDetails extends StatelessWidget {
  const AssetsDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        // leading: Icon(Icons.arrow_back_ios_new_outlined,color: AppColors.black),
        title: Row(
          children: [
            navBackButton(),
            SizedBox(width: 8),
            CustomText(
              text: "assets_details".i18n(),
              color: AppColors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
      body: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.white,
            automaticallyImplyLeading: false,
            elevation: 0,
            flexibleSpace: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: TabBar(
                    isScrollable: true,
                    indicatorColor: AppColors.secondaryColor,
                    labelColor: AppColors.secondaryColor,
                    unselectedLabelColor: AppColors.grey,
                    tabs: [
                      Tab(text: "assets_info".i18n()),
                      Tab(text: "asset_history".i18n()),
                      Tab(text: "attachment".i18n()),
                      Tab(text: "activity".i18n()),
                    ],
                  ),
                ),
                // Divider()
              ],
            ),
          ),
          body: TabBarView(
            children: [
              AssetsInfo(),
              AssetsHistory(),
              Attachment(),
              Activity(),
              //  slide1()
            ],
          ),
        ),
      ),
    );
  }
}
