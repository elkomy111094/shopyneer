import 'package:flutter/material.dart';
import 'package:size_config/size_config.dart';

import '../../shared/theme/colors.dart';

class DotSeparator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                height: 1.h,
                width: double.infinity,
                color: greyFA,
              ),
            ),
            Seperator(size: 10.h), // دائرة صغيرة
            SizedBox(width: 10.w), // مسافة بين الدوائر
            Seperator(size: 20.h), // دائرة أكبر في المنتصف
            SizedBox(width: 10.w),
            Seperator(size: 10.w),
            Expanded(
              child: Container(
                height: 1.h,
                width: double.infinity,
                color: greyFA,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Seperator extends StatelessWidget {
  final double size;
  const Seperator({required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: primary,
        shape: BoxShape.circle,
      ),
    );
  }
}
