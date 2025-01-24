import 'dart:developer';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:shopyneer/config/theme/styles_manager.dart';
import 'package:size_config/size_config.dart';

const List<Job> _list = [
  Job('وصل حديثا', Icons.developer_mode),
  Job('الأقل سعر', Icons.design_services),
  Job('الأعلي سعر', Icons.account_balance),
  Job('الأكثر مبيعا', Icons.school),
];

class SimpleDropdown extends StatelessWidget {
  const SimpleDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomDropdown<Job>(
      hintText: 'ترتيب حسب ...',
      decoration: CustomDropdownDecoration(
          closedFillColor: Colors.black,
          hintStyle: getMediumWhite12Style(),
          headerStyle: getMediumWhite12Style(),
          closedSuffixIcon: Icon(
            Icons.arrow_downward_outlined,
            color: Colors.white,
          ),
          closedBorderRadius: BorderRadius.circular(10.h)),
      items: _list,
      onChanged: (value) {
        log('changing value to: $value');
      },
    );
  }
}

class Job {
  final String name;
  final IconData icon;
  const Job(this.name, this.icon);

  @override
  String toString() {
    return name;
  }
}
