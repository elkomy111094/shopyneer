import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shopyneer/shared/theme/colors.dart';
import 'package:shopyneer/shared/theme/styles_manager.dart';
import 'package:size_config/size_config.dart';

class GridViewItem extends StatelessWidget {
  const GridViewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.h),
      child: Stack(
        children: [
          Card(
            elevation: 5,
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.h),
                side: BorderSide(color: greyD0)),
            child: Padding(
              padding: EdgeInsets.all(5.h),
              child: Wrap(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.h),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(),
                        height: 100.h,
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl:
                              "https://media.tijn.co/products/00149904/official/_1200_1200_60.jpg",
                          // URL of the image
                          placeholder: (context, url) => Center(
                              child: CircularProgressIndicator(
                            color: primary,
                          )),
                          // Placeholder widget while loading
                          errorWidget: (context, url, error) => Icon(Icons
                              .error), // Error widget if image fails to load
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.h, vertical: 5.h),
                    child: Column(
                      children: [
                        Gap(5.h),
                        /* Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                "إسم المنتج",
                                style: getBoldBlack12Style(),
                              ),
                            ),
                            Text(
                              "تفاصيل العرض",
                              style: getBoldBlack12Style().copyWith(
                                  fontWeight: FontWeight.bold, color: primary),
                            )
                          ],
                        ),*/
                        Gap(5.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                "تفاصيل أكثر عن العرض او المنتج",
                                style: getRegularGrey12Style(),
                              ),
                            ),
                          ],
                        ),
                        Gap(5.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "25",
                              style: getRegularGrey12Style().copyWith(
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            Gap(5.w),
                            Expanded(
                              child: Text(
                                "25 ج.م",
                                style: getBoldBlack16Style().copyWith(
                                  color: primary,
                                ),
                              ),
                            ),
                            Container(
                              height: 40.h,
                              width: 40.h,
                              child: Card(
                                elevation: 30.h,
                                color: Colors.black,
                                child: IconButton(
                                    onPressed: () async {},
                                    highlightColor: greyA5,
                                    icon: SvgPicture.asset(
                                      "assets/icons/cart.svg",
                                      color: white,
                                    )),
                              ),
                            ),
                          ],
                        ),
                        Gap(10.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Gap(75.w),
                Expanded(
                  child: Container(
                    height: 30.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Text(
                                "خصم 60 %",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: getMediumWhite12Style(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10.h))),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
