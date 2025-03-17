import 'package:flutter/material.dart';
import 'package:shopyneer/core/utils/get_asset_path.dart';
import 'package:shopyneer/core/widgets/picture.dart';
import 'package:shopyneer/shared/theme/styles_manager.dart';
import 'package:size_config/size_config.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({super.key, this.title, this.externalWidget});
  final String? title;
  final Widget? externalWidget;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FittedBox(
          child: Picture(
            getAssetIcon("nodata.svg"),
            height: 200.h,
            width: 200.h,
          ),
        ),
        Text(
          title ?? "",
          style: getBoldBlack20Style(),
        ),
        externalWidget ?? const SizedBox(),
      ],
    );
  }
}
