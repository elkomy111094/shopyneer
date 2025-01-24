import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shopyneer/config/theme/colors.dart';
import 'package:shopyneer/core/utils/get_asset_path.dart';
import 'package:shopyneer/core/widgets/picture.dart';
import 'package:size_config/size_config.dart';

class MainViewContainer extends StatefulWidget {
  MainViewContainer({
    super.key,
    required this.mainWidget,
    required this.appBarHeight,
    required this.cardHeight,
    this.position,
    this.titleWidget,
    required this.cardWidth,
  });
  Widget mainWidget;
  double appBarHeight;
  double cardHeight;
  double cardWidth;
  double? position;
  Widget? titleWidget;

  @override
  State<MainViewContainer> createState() => _MainViewContainerState();
}

class _MainViewContainerState extends State<MainViewContainer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                color: primary,
              )),
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Picture(
                getAssetIcon("login_vector.svg"),
                fit: BoxFit.cover,
              )),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(child: widget.titleWidget!),
                Gap(20.h),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20.h),
                          topLeft: Radius.circular(20.h))),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.h, right: 20.h),
                    child: widget.mainWidget,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
