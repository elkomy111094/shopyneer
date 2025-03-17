import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:shopyneer/core/utils/get_asset_path.dart';
import 'package:shopyneer/shared/theme/colors.dart';
import 'package:size_config/size_config.dart';

import '../../../core/widgets/picture.dart';

class ProfileMainWidget extends StatelessWidget {
  final String title;
  final String iconPath;
  final Color color;
  final void Function()? onTap;
  final bool isLogout;
  final bool showArrow;

  const ProfileMainWidget({
    super.key,
    required this.title,
    required this.iconPath,
    required this.color,
    this.onTap,
    this.isLogout = false,
    this.showArrow = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: DottedBorder(
        color: greyEE, // Border color
        strokeWidth: 1, // Width of the border
        dashPattern: const [
          3,
          3
        ], // Length of the dash and space between dashes
        borderType: BorderType.RRect, // Rounded border
        radius: const Radius.circular(10), // Rounded corners radius
        child: ListTile(
          leading: Picture(
            getAssetIcon(iconPath),
            width: 30.h,
            height: 30.h,
            color: isLogout ? Colors.red : color,
          ),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: isLogout ? Colors.red : Colors.black,
            ),
          ),
          trailing: isLogout || !showArrow
              ? null
              : Icon(
                  Localizations.localeOf(context).languageCode == "en"
                      ? Icons.keyboard_arrow_right_sharp
                      : Icons.keyboard_arrow_left_sharp,
                  color: Colors.purple,
                  size: 20,
                ),
          onTap: onTap,
        ),
      ),
    );
  }
}
