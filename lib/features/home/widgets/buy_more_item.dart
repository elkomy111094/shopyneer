import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shopyneer/shared/theme/colors.dart';
import 'package:shopyneer/shared/theme/styles_manager.dart';
import 'package:size_config/size_config.dart';

class BuyMoreItem extends StatelessWidget {
  final String? imageUrl;
  final String? title;
  final String? description;

  const BuyMoreItem({
    super.key,
    this.imageUrl, // الصورة يمكن أن تكون null
    this.title, // العنوان يمكن أن يكون null
    this.description, // الوصف يمكن أن يكون null
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.h),
      child: Stack(
        children: [
          Card(
            color: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.h),
              side: BorderSide(color: Colors.grey.withOpacity(.1)),
            ),
            child: Padding(
              padding: EdgeInsets.all(5.h),
              child: Wrap(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.h),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(),
                      height: 140.h,
                      child: CachedNetworkImage(
                        fit: BoxFit.fill,
                        imageUrl: imageUrl ??
                            "https://via.placeholder.com/150", // صورة افتراضية إذا كانت `null`
                        placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(
                            color: primary,
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            Icon(Icons.error, color: Colors.red),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.h, vertical: 5.h),
                    child: Column(
                      children: [
                        Gap(5.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                title ??
                                    "إسم المنتج غير متوفر", // عنوان افتراضي
                                style: getBoldPrimary14Style(),
                              ),
                            ),
                          ],
                        ),
                        Gap(5.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                description ??
                                    "لا توجد تفاصيل متاحة", // وصف افتراضي عند null
                                style: getRegularGrey12Style(),
                              ),
                            ),
                          ],
                        ),
                        Gap(5.h),
                      ],
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
