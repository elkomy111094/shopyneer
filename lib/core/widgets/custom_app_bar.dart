import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopyneer/shared/theme/colors.dart';
import 'package:shopyneer/shared/theme/styles_manager.dart';
import 'package:size_config/size_config.dart';

class GeneralAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GeneralAppBar(
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
    return Container(
      height: 140.h,
      color: Color(0xffffffff),
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top), // status bar height
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 80.h,
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Leading (Back Button)
                        IconButton(
                          onPressed: onBackPressed ??
                              () => Navigator.of(context).pop(),
                          icon: CircleAvatar(
                            radius: 20.h,
                            backgroundColor: primary.withOpacity(.1),
                            child: Icon(
                              Icons.arrow_back,
                              color: primary,
                              size: 20.sp,
                            ),
                          ),
                        ),

                        // Title and Subtitle
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                routeName,
                                style: getBoldBlack16Style(),
                              ),
                              SizedBox(width: 10.w),
                              if (subTitle != null)
                                Text(
                                  subTitle ?? "",
                                  style: getBoldPrimary16Style(),
                                ),
                            ],
                          ),
                        ),

                        // Actions
                        if (actions != null && actions!.isNotEmpty)
                          Row(children: actions!)
                        else
                          SizedBox(
                              width: 40.w), // To balance spacing if no actions
                      ],
                    ),
                  ),
                  // Bottom Widget if needed
                  if (bottomWidget != null) bottomWidget!,
                ],
              ),
            ),
          ),
          Divider(
            color: greyFA,
          )
        ],
      ),
    );
  }
}
