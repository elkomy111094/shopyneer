import 'package:flutter/material.dart';
import 'package:shopyneer/core/utils/get_asset_path.dart';
import 'package:shopyneer/core/widgets/picture.dart';
import 'package:shopyneer/shared/theme/styles_manager.dart';
import 'package:size_config/size_config.dart';

class NoConnectionWidget extends StatelessWidget {
  const NoConnectionWidget({super.key, this.title, this.subTitle});
  final String? title;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Picture(getAssetIcon("no_connection.svg")),
        Text(
          title ?? "",
          style: getBoldBlack20Style(),
        ),
        SizedBox(
          height: 20.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 70.w),
          child: Text(
            subTitle ?? "",
            textAlign: TextAlign.center,
            style: getRegularBlack16Style(),
          ),
        ),
      ],
    );
  }
}
