import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shopyneer/core/widgets/animated_dropdown_list.dart';
import 'package:shopyneer/core/widgets/picture.dart';
import 'package:shopyneer/features/home/models/category_model.dart';
import 'package:shopyneer/features/home/widgets/home_categories.dart';
import 'package:shopyneer/features/home/widgets/product_widget.dart';
import 'package:shopyneer/shared/theme/colors.dart';
import 'package:shopyneer/shared/theme/styles_manager.dart';
import 'package:size_config/size_config.dart';

import '../../core/widgets/custom_app_bar.dart';
import '../home/widgets/animated_search_field.dart';

class BrandPage extends StatelessWidget {
  BrandPage({super.key, required this.BrandImg, required this.BrandTitle});
  String BrandTitle;
  String BrandImg;
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
    return Scaffold(
      body: Column(
        children: [
          GeneralAppBar(
            routeName: BrandTitle,
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
                        BrandImg,
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: HorizontalGridView(categories: categories),
                  ),
                  Gap(20.h),
                  Container(
                    width: double.infinity,
                    height: 100.h,
                    color: primary.withOpacity(.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "المنتجات ",
                          style: getBoldBlack16Style(),
                        ),
                        Text(
                          "الأكثر مبيعا ",
                          style: getPrimaryBoldStyle20Style(),
                        ),
                        Text(
                          " في ${BrandTitle} ",
                          style: getBoldBlack16Style(),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 430.h,
                    color: greyFA,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                              height: 250.h,
                              width: 200.w,
                              child: MainProductWidget(
                                imgUrl:
                                    'https://www.pngarts.com/files/3/Nike-Running-Shoes-PNG-Picture.png',
                              ));
                        },
                        separatorBuilder: (context, index) {
                          return Gap(10.w);
                        },
                        itemCount: 10),
                  ),
                  Gap(40.h),
                  Container(
                    width: double.infinity,
                    height: 100.h,
                    color: primary.withOpacity(.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "عروض  ",
                          style: getPrimaryBoldStyle20Style(),
                        ),
                        Text(
                          "${BrandTitle} ",
                          style: getBoldBlack16Style(),
                        ),
                        Container(
                            height: 60.h,
                            width: 60.h,
                            child: Picture(
                              "https://static.vecteezy.com/system/resources/thumbnails/049/890/240/small_2x/discount-percentage-icon-3d-render-png.png",
                              fit: BoxFit.fill,
                            )),
                      ],
                    ),
                  ),
                  Container(
                    color: greyFA,
                    height: 250, // Adjust based on item height
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, // Two rows
                              childAspectRatio: 2 / 4,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 5
                              // Square items
                              ),
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final category = categories[index];
                        return Padding(
                          padding: EdgeInsets.all(10.0.h),
                          child: Container(
                            width: 100.w,
                            height: 50.h,
                            child: Picture(
                              "https://cdn.create.vista.com/downloads/1332d533-bf43-4867-9b84-8fcd863baeae_1024.jpeg",
                              fit: BoxFit.fill,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Gap(10.h),
                  Container(
                    width: double.infinity,
                    height: 100.h,
                    color: primary.withOpacity(.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "كل منتجات ",
                          style: getPrimaryBoldStyle20Style(),
                        ),
                        Text(
                          BrandTitle,
                          style: getBoldBlack16Style(),
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
                                  width: MediaQuery.of(context).size.width / 3,
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
                              return MainProductWidget(
                                imgUrl:
                                    "https://www.thepinkstuff.com/uploads/tps-product-images/cleaning-paste/cleaning-paste-bigger-1.%5B1%5D.png",
                              );
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
    );
  }
}
