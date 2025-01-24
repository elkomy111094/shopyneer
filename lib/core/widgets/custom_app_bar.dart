import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:size_config/size_config.dart';

import '../../config/theme/colors.dart';
import '../../config/theme/styles_manager.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key,
      this.myColor,
      required this.routeName,
      this.toolBarHeight,
      this.actions,
      this.flexibleSpace,
      this.bottomWidget,
      this.systemUiOverlayStyle,
      this.leadingWidget,
      this.showUserName,
      this.showStartLevel,
      this.navigateToMapScreen,
      this.automaticallyImplyLeading = false,
      this.showAppIconAndName,
      this.showGoldenCrown,
      this.onCrownClicked,
      this.onBackPressed,
      this.subTitle});

  final Color? myColor;
  final String routeName;
  final String? subTitle;
  final double? toolBarHeight;
  final Widget? leadingWidget;
  final PreferredSize? bottomWidget;
  final SystemUiOverlayStyle? systemUiOverlayStyle;
  final List<Widget>? actions;
  final bool? automaticallyImplyLeading;
  final bool? showUserName;
  final bool? showStartLevel;
  final bool? showGoldenCrown;
  final bool? navigateToMapScreen;
  final bool? showAppIconAndName;
  final Widget? flexibleSpace;
  final VoidCallback? onCrownClicked;
  final void Function()? onBackPressed;

  @override
  Size get preferredSize => Size.fromHeight(toolBarHeight ?? 100.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 60.h,
      title: Row(
        children: [
          Text(
            routeName,
            style: getBoldPrimary16Style(),
          ),
          Gap(10.w),
          Text(
            subTitle ?? "",
            style: getBoldPrimary16Style(),
          ),
        ],
      ),
      leading: IconButton(
        onPressed: onBackPressed ??
            () {
              Navigator.of(context).pop();
            },
        icon: CircleAvatar(
          radius: 20.h,
          backgroundColor: Colors.grey.withOpacity(.2),
          child: Icon(
            Icons.arrow_back,
            color: Theme.of(context).primaryColor,
            size: 20.sp,
          ),
        ),
      ),
      centerTitle: false,
      systemOverlayStyle: systemUiOverlayStyle,
      actions: actions,
      bottom: bottomWidget,
      elevation: 0.5,
      flexibleSpace: flexibleSpace,
      automaticallyImplyLeading: automaticallyImplyLeading ?? false,
      backgroundColor: myColor ?? white,
    );
  }
}
