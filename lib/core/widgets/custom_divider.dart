import 'package:flutter/material.dart';
import 'package:size_config/size_config.dart';

import '../../config/theme/colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
      ),
      child: const Divider(
        color: scaffoldBackgroundColor,
        height: 1,
        thickness: 1,
      ),
    );
  }
}
