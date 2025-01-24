import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shopyneer/config/theme/colors.dart';
import 'package:shopyneer/config/theme/styles_manager.dart';
import 'package:shopyneer/core/widgets/animated_dropdown_list.dart';
import 'package:shopyneer/core/widgets/picture.dart';
import 'package:shopyneer/features/home/models/category_model.dart';
import 'package:shopyneer/features/home/widgets/product_widget.dart';
import 'package:size_config/size_config.dart';

import '../../core/widgets/custom_app_bar.dart';
import '../home/widgets/animated_search_field.dart';

class OfferPage extends StatelessWidget {
  OfferPage({super.key, required this.OfferTitle, required this.OfferImg});

  String OfferTitle;
  String OfferImg;

  final List<Category> categories = [
    Category(
        title: 'لانجيري',
        imageUrl:
            'https://shopyneer.com/cdn/shop/collections/MENTIONABLES-sadiebanksphotography-313-704x1024.jpg?v=1729503635'),
    Category(
        title: 'فساتين',
        imageUrl:
            'https://shopyneer.com/cdn/shop/collections/86f1e88b-90af-4581-894d-07162d1334e5.webp?v=1729503859'),
    Category(
        title: 'الأزياء والموضة',
        imageUrl:
            'https://shopyneer.com/cdn/shop/collections/c639ba6fc15cbd5d3843b517ecbed98c.jpg_720x720q80.jpg?v=1729503577'),
    Category(
        title: 'العناية بالشعر',
        imageUrl:
            'https://shopyneer.com/cdn/shop/collections/Skin_Care.jpg?v=1727586547'),
    Category(
        title: 'المكياج',
        imageUrl:
            'https://shopyneer.com/cdn/shop/collections/360_F_273553300_sBBxIPpLSn5iC5vC8FwzFh6BJDKvUeaC.jpg?v=1729503610'),
    Category(
        title: 'العناية بالجسم',
        imageUrl:
            'https://shopyneer.com/cdn/shop/collections/Hair_Care.jpg?v=1727586564'),
    Category(
        title: 'العطور',
        imageUrl:
            'https://shopyneer.com/cdn/shop/collections/Fragrances.jpg?v=1729503796'),
    Category(
        title: 'الإستحمام والعناية بالجسم',
        imageUrl:
            'https://shopyneer.com/cdn/shop/collections/Bath_Body.webp?v=1727586493'),
    Category(
        title: 'خصومات حتى 75%',
        imageUrl:
            'https://shopyneer.com/cdn/shop/collections/Beauty_Health.webp?v=1729504081'),
    Category(
        title: 'أزياء الشتاء',
        imageUrl:
            'https://shopyneer.com/cdn/shop/collections/Winter-Clothes.png?v=1729512808'),
    Category(
        title: 'منتجات كورية',
        imageUrl:
            'https://shopyneer.com/cdn/shop/collections/korean_beauty.webp?v=1729503726'),
    Category(
        title: 'إكسسوارات',
        imageUrl:
            'https://shopyneer.com/cdn/shop/collections/Tools_Accessories.jpg?v=1729503398'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBar(
              routeName: OfferTitle,
              onBackPressed: () {
                Navigator.of(context).pop();
              },
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                        height: 250.h,
                        width: double.infinity,
                        child: Picture(
                          OfferImg,
                          fit: BoxFit.fill,
                        )),
                    Gap(10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Gap(10.w),
                        Expanded(
                          child: AnimatedSearchField(),
                        ),
                        Gap(10.w),
                      ],
                    ),
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
                                    Text(
                                      "السعر",
                                      style: getRegularBlack14Style(),
                                    ),
                                    Gap(10.w),
                                    Icon(Icons.arrow_downward_outlined),
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
                                    Text(
                                      "التصنيف",
                                      style: getRegularBlack14Style(),
                                    ),
                                    Gap(10.w),
                                    Icon(Icons.arrow_downward_outlined),
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
                                    Text(
                                      "البراند",
                                      style: getRegularBlack14Style(),
                                    ),
                                    Gap(10.w),
                                    Icon(Icons.arrow_downward_outlined),
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
                                    Text(
                                      "توافر المنتج",
                                      style: getRegularBlack14Style(),
                                    ),
                                    Gap(10.w),
                                    Icon(Icons.arrow_downward_outlined),
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
                                    Text(
                                      "اللون",
                                      style: getRegularBlack14Style(),
                                    ),
                                    Gap(10.w),
                                    Icon(Icons.arrow_downward_outlined),
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
                                    Text(
                                      "التقييم",
                                      style: getRegularBlack14Style(),
                                    ),
                                    Gap(10.w),
                                    Icon(Icons.arrow_downward_outlined),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      color: greyFA,
                      child: Column(
                        children: [
                          Gap(10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    child: SimpleDropdown()),
                              ),
                            ],
                          ),
                          Gap(10.h),
                          Padding(
                            padding: EdgeInsets.all(5.h),
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, // Number of columns
                                childAspectRatio: 30 / 71,
                                crossAxisSpacing: 8.0,
                                mainAxisSpacing: 8.0,
                              ),
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return MainProductWidget();
                              },
                            ),
                          ),
                        ],
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
