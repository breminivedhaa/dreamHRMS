import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

import '../../../colors.dart';
import '../../../widgets/Custom_text.dart';


class DependencyScreen extends StatefulWidget {
  const DependencyScreen({super.key});

  @override
  State<DependencyScreen> createState() => _DependencyScreenState();
}

class _DependencyScreenState extends State<DependencyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CustomText(
              text: 'basic_information'.i18n(),
              color: AppColors.blue,
              fontSize: 13,
              fontWeight: FontWeight.w400),
        ],
      ),
    );
  }
}
