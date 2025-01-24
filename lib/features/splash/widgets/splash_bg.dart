import 'package:flutter/material.dart';
import 'package:shopyneer/config/theme/colors.dart';
import 'package:shopyneer/core/utils/get_asset_path.dart';
import 'package:shopyneer/core/widgets/picture.dart';

class Splach_bg_vector extends StatelessWidget {
  const Splach_bg_vector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 0,
        left: 0,
        right: 0,
        bottom: 0,
        child: Picture(
          getAssetIcon("login_vector.svg"),
          fit: BoxFit.cover,
          color: primary,
        ));
  }
}
