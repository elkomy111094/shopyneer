import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:shopyneer/config/localization/loc_keys.dart';
import 'package:shopyneer/core/utils/get_asset_path.dart';
import 'package:shopyneer/core/widgets/animated_dropdown_list.dart';
import 'package:shopyneer/core/widgets/dot_seperator.dart';
import 'package:shopyneer/core/widgets/loading_widget.dart';
import 'package:shopyneer/core/widgets/picture.dart';
import 'package:shopyneer/features/home/cubit/home_cubit.dart';
import 'package:shopyneer/features/home/cubit/home_state.dart';
import 'package:shopyneer/features/home/models/category_model.dart';
import 'package:shopyneer/features/home/widgets/home_categories.dart';
import 'package:shopyneer/features/home/widgets/product_widget.dart';
import 'package:shopyneer/shared/theme/colors.dart';
import 'package:shopyneer/shared/theme/styles_manager.dart';
import 'package:size_config/size_config.dart';

import '../../core/widgets/custom_app_bar.dart';
import '../home/models/advertising_response_model.dart';
import '../home/widgets/ads_slider.dart';
import '../home/widgets/animated_search_field.dart';

class MainCategoryPage extends StatefulWidget {
  const MainCategoryPage({super.key});

  @override
  State<MainCategoryPage> createState() => _MainCategoryPageState();
}

class _MainCategoryPageState extends State<MainCategoryPage> {
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
      backgroundColor: Colors.white,
      body: Column(
        children: [
          GeneralAppBar(
            routeName: "فساتين",
            onBackPressed: () {
              Navigator.of(context).pop();
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AdsSlider(imageUrls: [
                    Advertise(
                        image:
                            "https://shopyneer.com/cdn/shop/files/55541425a1dab62315d6b31edc53091a.jpg?v=1731094370&width=2000",
                        id: "",
                        date: "11-10-1994"),
                    Advertise(
                        image:
                            "https://shopyneer.com/cdn/shop/files/copy_0b3c20ac-e028-474c-b100-d572d5f23633.jpg?v=1730359256&width=2000",
                        id: "",
                        date: "11-10-1994"),
                    Advertise(
                        image:
                            "https://shopyneer.com/cdn/shop/files/copy_29c9774f-e95f-4466-87bb-d850753affc9.jpg?v=1730359279&width=2000",
                        id: "",
                        date: "11-10-1994"),
                    Advertise(
                        image:
                            "https://shopyneer.com/cdn/shop/files/6.jpg?v=1730189751&width=2000",
                        id: "",
                        date: "11-10-1994"),
                  ]),
                  BlocConsumer<HomeCubit, HomeState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is HomeLoadingState) {
                        return SizedBox(
                          height: 250.h,
                          width: double.infinity,
                          child: const Center(
                            child: LoadingWidget(),
                          ),
                        );
                      } else if (state is HomeFailedState) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: Center(
                            child: Text(Loc.noAds()),
                          ),
                        );
                      } else if (state is HomeSuccessState) {
                        return AdsSlider(
                            imageUrls:
                                state.advertismentResponseModel.data.listData);
                      }
                      return Container();
                    },
                  ),
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
                            color: Colors.white,
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
                            color: Colors.white,
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
                            color: Colors.white,
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
                            color: Colors.white,
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
                            color: Colors.white,
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
                            color: Colors.white,
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
                  Container(
                    width: double.infinity,
                    height: 100.h,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "إشتري حسب ",
                          style: getBoldBlack16Style(),
                        ),
                        Text(
                          "نوع المنتج ",
                          style: getPrimaryBoldStyle20Style(),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: HorizontalGridView(categories: categories),
                  ),
                  DotSeparator(),
                  Container(
                    width: double.infinity,
                    height: 100.h,
                    color: Colors.white,
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
                  DotSeparator(),
                  Container(
                    width: double.infinity,
                    height: 100.h,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          " عروض علي ",
                          style: getBoldBlack16Style(),
                        ),
                        Text(
                          "الفساتين ",
                          style: getPrimaryBoldStyle20Style(),
                        ),
                        Picture(
                          "https://pngimg.com/d/percent_PNG7.png",
                          height: 30.h,
                          width: 30.h,
                        ),
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
                  DotSeparator(),
                  Container(
                    width: double.infinity,
                    height: 100.h,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          " منتجات ",
                          style: getBoldBlack16Style(),
                        ),
                        Text(
                          "الفساتين ",
                          style: getPrimaryBoldStyle20Style(),
                        ),
                        Picture(
                          "https://pngimg.com/d/percent_PNG7.png",
                          height: 30.h,
                          width: 30.h,
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
                              childAspectRatio: 20 / 38,
                            ),
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return MainProductWidget(
                                imgUrl:
                                    "https://pinkysugar.com/storage/photos/1/Products/nawarispecialmixpowder.jpg",
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
