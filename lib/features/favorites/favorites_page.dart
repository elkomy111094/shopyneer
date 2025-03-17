import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shopyneer/core/utils/get_asset_path.dart';
import 'package:shopyneer/core/widgets/picture.dart';
import 'package:shopyneer/features/home/widgets/product_widget.dart';
import 'package:shopyneer/shared/theme/colors.dart';
import 'package:shopyneer/shared/theme/styles_manager.dart';
import 'package:size_config/size_config.dart';

import '../../core/widgets/custom_app_bar.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Column(
        children: [
          GeneralAppBar(
            routeName: "منتجاتي المفضله",
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
                          elevation: 0,
                          color: primary.withOpacity(.1),
                          child: Padding(
                            padding: EdgeInsets.all(10.h),
                            child: Picture(
                              getAssetIcon("fav_home.svg"),
                              width: 40.h,
                              height: 40.h,
                              color: primary,
                            ),
                          ),
                        ),
                      ),
                      Gap(5.w),
                      Text(
                        "245",
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
                  Expanded(
                    child: GridView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Two widgets in each row
                        childAspectRatio:
                            20 / 40, // Aspect ratio of the grid items
                      ),
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return AnimatedContainer(
                          duration: Duration(seconds: 1),
                          margin: EdgeInsets.all(8.0),
                          child: MainProductWidget(
                            imgUrl:
                                "https://merty-pharma.net/cdn/shop/products/11_1200x.jpg?v=1668594077",
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
