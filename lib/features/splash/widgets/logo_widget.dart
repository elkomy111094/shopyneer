import 'package:flutter/material.dart';
import 'package:shopyneer/core/utils/get_asset_path.dart';
import 'package:shopyneer/core/widgets/picture.dart';
import 'package:size_config/size_config.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: Padding(
        padding: EdgeInsets.all(50.h),
        child: Picture(
          getAssetImage("logo_without_bg.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
