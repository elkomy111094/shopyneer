import 'package:flutter/material.dart';
import 'package:size_config/size_config.dart';

import '../../config/theme/colors.dart';

class CustomDividerWidget extends StatelessWidget {
  const CustomDividerWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.h, bottom: 10.h),
      child: const Divider(
        color: grey4A,
        thickness: 0.1,
      ),
    );
  }
}
