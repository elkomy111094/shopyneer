import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shopyneer/config/navigation/nav.dart';
import 'package:shopyneer/config/theme/colors.dart';
import 'package:shopyneer/config/theme/styles_manager.dart';
import 'package:shopyneer/core/utils/get_asset_path.dart';
import 'package:shopyneer/core/widgets/picture.dart';
import 'package:shopyneer/features/home/widgets/grid_view_item.dart';
import 'package:size_config/size_config.dart';

import '../../core/widgets/custom_app_bar.dart';

class SearchResaultPage extends StatefulWidget {
  String searchWord;

  SearchResaultPage({super.key, required this.searchWord});

  @override
  State<SearchResaultPage> createState() => _SearchResaultPageState();
}

class _SearchResaultPageState extends State<SearchResaultPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: greyFA,
        body: Column(
          children: [
            CustomAppBar(
              routeName: "نتائج البحث عن",
              subTitle: widget.searchWord,
              onBackPressed: () {
                Navigator.of(context).pop();
              },
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10.h),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 40.h,
                          width: 40.h,
                          child: Card(
                            color: primary.withOpacity(.1),
                            child: Padding(
                              padding: EdgeInsets.all(10.h),
                              child: Picture(
                                getAssetIcon("search_icon.svg"),
                                width: 40.h,
                                height: 40.h,
                                color: primary,
                              ),
                            ),
                          ),
                        ),
                        Gap(10.w),
                        Text(
                          "15",
                          style: getBoldPrimary16Style(),
                        ),
                        Gap(10.w),
                        Text(
                          "منتج",
                          style: getBoldBlack16Style(),
                        ),
                        Divider(
                          color: greyFA,
                          height: 20.h,
                        ),
                      ],
                    ),
                    Gap(10.h),
                    Gap(10.h),
                    Container(
                      height: 60.h,
                      color: greyFA,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 10.w),
                        children: [
                          Gap(10.w),
                          Container(
                            height: 30.h,
                            child: Card(
                              color: primary.withOpacity(.1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.h)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 20.h,
                                      height: 20.h,
                                      child: Picture(
                                        getAssetIcon("money.svg"),
                                        width: 20.h,
                                        height: 20.h,
                                        color: Colors.black,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Gap(5.w),
                                    Text(
                                      "السعر",
                                      style: getRegularBlack14Style(),
                                    ),
                                    Gap(10.w),
                                    Icon(
                                      Icons.arrow_downward_outlined,
                                      size: 12.sp,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Gap(10.w),
                          Container(
                            height: 30.h,
                            child: Card(
                              color: primary.withOpacity(.1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.h)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 20.h,
                                      height: 20.h,
                                      child: Picture(
                                        getAssetIcon("category.svg"),
                                        width: 30.h,
                                        height: 30.h,
                                        color: Colors.black,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Gap(5.w),
                                    Text(
                                      "التصنيف",
                                      style: getRegularBlack14Style(),
                                    ),
                                    Gap(10.w),
                                    Icon(
                                      Icons.arrow_downward_outlined,
                                      size: 12.sp,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Gap(10.w),
                          Container(
                            height: 30.h,
                            child: Card(
                              color: primary.withOpacity(.1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.h)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 20.h,
                                      height: 20.h,
                                      child: Picture(
                                        getAssetIcon("brand.svg"),
                                        width: 20.h,
                                        height: 20.h,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Gap(5.w),
                                    Text(
                                      "البراند",
                                      style: getRegularBlack14Style(),
                                    ),
                                    Gap(10.w),
                                    Icon(
                                      Icons.arrow_downward_outlined,
                                      size: 12.sp,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Gap(10.w),
                          Container(
                            height: 30.h,
                            child: Card(
                              color: primary.withOpacity(.1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.h)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 20.h,
                                      height: 20.h,
                                      child: Picture(
                                        getAssetIcon("available.svg"),
                                        width: 20.h,
                                        height: 20.h,
                                        color: Colors.black,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Gap(5.w),
                                    Text(
                                      "توافر المنتج",
                                      style: getRegularBlack14Style(),
                                    ),
                                    Gap(10.w),
                                    Icon(
                                      Icons.arrow_downward_outlined,
                                      size: 12.sp,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Gap(10.w),
                          Container(
                            height: 30.h,
                            child: Card(
                              color: primary.withOpacity(.1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.h)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 20.h,
                                      height: 20.h,
                                      child: Picture(
                                        getAssetIcon("color.svg"),
                                        width: 20.h,
                                        height: 20.h,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Gap(5.w),
                                    Text(
                                      "اللون",
                                      style: getRegularBlack14Style(),
                                    ),
                                    Gap(10.w),
                                    Icon(
                                      Icons.arrow_downward_outlined,
                                      size: 12.sp,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Gap(10.w),
                          Container(
                            height: 30.h,
                            child: Card(
                              color: primary.withOpacity(.1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.h)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 20.h,
                                      height: 20.h,
                                      child: Picture(
                                        getAssetIcon("rate.svg"),
                                        width: 20.h,
                                        height: 20.h,
                                        color: Colors.black,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Gap(5.w),
                                    Text(
                                      "التقييم",
                                      style: getRegularBlack14Style(),
                                    ),
                                    Gap(10.w),
                                    Icon(
                                      Icons.arrow_downward_outlined,
                                      size: 12.sp,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(5.h),
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // Number of columns
                            childAspectRatio: 30 / 35,
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 8.0,
                          ),
                          itemCount: 15,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: () {
                                  Nav.productDetailsPage(context);
                                },
                                child: GridViewItem());
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
