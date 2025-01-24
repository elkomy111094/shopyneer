import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:shopyneer/config/localization/loc_keys.dart';
import 'package:shopyneer/config/navigation/nav.dart';
import 'package:shopyneer/config/theme/colors.dart';
import 'package:shopyneer/config/theme/styles_manager.dart';
import 'package:shopyneer/core/widgets/elevated_button.dart';
import 'package:shopyneer/core/widgets/loading_widget.dart';
import 'package:shopyneer/core/widgets/picture.dart';
import 'package:shopyneer/features/home/cubit/home_cubit.dart';
import 'package:shopyneer/features/home/cubit/home_state.dart';
import 'package:shopyneer/features/home/models/category_model.dart';
import 'package:shopyneer/features/home/widgets/ads_slider.dart';
import 'package:shopyneer/features/home/widgets/animated_search_field.dart';
import 'package:shopyneer/features/home/widgets/grid_view_item.dart';
import 'package:shopyneer/features/home/widgets/home_categories.dart';
import 'package:shopyneer/features/home/widgets/product_widget.dart';
import 'package:size_config/size_config.dart';

import '../../core/utils/get_asset_path.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> arAssetIcons = [
    'hour_serice.svg',
    'monthes.svg',
    'otheres.svg',
    'offers.svg',
  ];

  final List<String> enAssetIcons = [
    'hour_serice_en.svg',
    'months_en.svg',
    'others_en.svg',
    'offers_en.svg',
  ];

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
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: white,
      body: Column(
        children: [
          Header(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// TODO : Ads Slider
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
                  Gap(20.h),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: HorizontalGridView(categories: categories),
                  ),
                  Gap(30.h),
                  Container(
                    height: 920.h,
                    width: double.infinity,
                    color: primary.withOpacity(.03),
                    child: Column(
                      children: [
                        Gap(20.h),
                        Container(
                          height: 100.h,
                          width: double.infinity,
                          color: Colors.black,
                          child: Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "أجمد العروض ",
                                    style: getW700White16Style(),
                                  ),
                                  Container(
                                    child: Picture(
                                        "https://media.istockphoto.com/id/1055875434/vector/black-friday-sale-banner-template-design-vector-illustration.jpg?s=612x612&w=0&k=20&c=qWcsmSB9hEzADUVqxV60dyBPA1XHHonE3MVQQ9Q1iiQ="),
                                    width: 50.h,
                                    height: 50.h,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "جمعه شوبنير ",
                                    style: getBoldPrimary18Style(),
                                  ),
                                  Text(
                                    "البيضاء",
                                    style: getBoldWhite22Style(),
                                  ),
                                ],
                              ),
                            ],
                          )),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(5.h),
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, // Number of columns
                                childAspectRatio: 30 / 35,
                                crossAxisSpacing: 8.0,
                                mainAxisSpacing: 8.0,
                              ),
                              itemCount: 5,
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
                  Gap(20.h),

                  FutureBuilder<Widget>(
                    future: Future.delayed(
                      Duration(milliseconds: 500),
                      () => Column(
                        children: [
                          Container(
                            height: 110.h,
                            color: primary.withOpacity(.1),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "مقترحه",
                                  style: getBoldBlack20Style(),
                                ),
                                Text(
                                  "لك",
                                  style: getBoldPrimary19Style(),
                                ),
                              ],
                            ),
                          ),
                          Gap(20.h),
                          Container(
                            height: 500.h,
                            width: double.infinity,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Container(
                                  height: 250.h,
                                  width: 200.w,
                                  child: MainProductWidget(),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return Gap(10.w);
                              },
                              itemCount: 5,
                            ),
                          ),
                        ],
                      ),
                    ), // The asynchronous task
                    builder:
                        (BuildContext context, AsyncSnapshot<Widget> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                            child:
                                CircularProgressIndicator()); // Loading indicator
                      } else if (snapshot.hasError) {
                        return Center(
                            child: Text(
                                'Error: ${snapshot.error}')); // Error message
                      } else if (snapshot.hasData) {
                        return snapshot.data!; // Display the widget from Future
                      } else {
                        return Center(
                            child:
                                Text('No Data')); // Handle unexpected null data
                      }
                    },
                  ),

                  Gap(20.h),

                  FutureBuilder<Widget>(
                    future: Future.delayed(
                      Duration(milliseconds: 2500),
                      () => Column(
                        children: [
                          Container(
                            height: 110.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(color: greyFA)),
                            child: Center(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "كوبوووونات خصم ",
                                        style: getBoldBlack20Style(),
                                      ),
                                      Container(
                                        child: Picture(
                                            "https://couponviser.com/wp-content/themes/couponviser/assets/images/Online_Shoping.png"),
                                        width: 100.h,
                                        height: 100.h,
                                      ),
                                    ],
                                  ),
                                  color: primary.withOpacity(.2),
                                ),
                              ],
                            )),
                          ),
                          Container(
                            height: 260.h,
                            width: double.infinity,
                            child: Column(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.all(5.h),
                                    child: GridView.builder(
                                      shrinkWrap: true,
                                      padding: EdgeInsets.all(10.h),
                                      physics: NeverScrollableScrollPhysics(),
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount:
                                                  2, // Number of columns
                                              crossAxisSpacing: 8.0,
                                              mainAxisSpacing: 20.0,
                                              childAspectRatio: 4 / 2),
                                      itemCount: 4,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            Nav.offerPage(context,
                                                OfferImage:
                                                    "https://couponatstore.com/wp-content/uploads/2022/03/%D9%83%D9%88%D8%AF-%D8%AE%D8%B5%D9%85-%D9%81%D9%8A%D9%83%D8%AA%D9%88%D8%B1%D9%8A%D8%A7-%D8%B3%D9%8A%D9%83%D8%B1%D9%8A%D8%AA-640x360.png",
                                                OfferTitle: "كود خصم فيكتوريا");
                                          },
                                          child: Picture(
                                              "https://couponatstore.com/wp-content/uploads/2022/03/%D9%83%D9%88%D8%AF-%D8%AE%D8%B5%D9%85-%D9%81%D9%8A%D9%83%D8%AA%D9%88%D8%B1%D9%8A%D8%A7-%D8%B3%D9%8A%D9%83%D8%B1%D9%8A%D8%AA-640x360.png"),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ), // The asynchronous task
                    builder:
                        (BuildContext context, AsyncSnapshot<Widget> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                            child:
                                CircularProgressIndicator()); // Loading indicator
                      } else if (snapshot.hasError) {
                        return Center(
                            child: Text(
                                'Error: ${snapshot.error}')); // Error message
                      } else if (snapshot.hasData) {
                        return snapshot.data!; // Display the widget from Future
                      } else {
                        return Center(
                            child:
                                Text('No Data')); // Handle unexpected null data
                      }
                    },
                  ),

                  Gap(30.h),

                  FutureBuilder<Widget>(
                    future: Future.delayed(
                      Duration(milliseconds: 1500),
                      () => Column(
                        children: [
                          Container(
                            height: 110.h,
                            color: primary.withOpacity(.2),
                            width: double.infinity,
                            child: Center(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "شوف  ",
                                      style: getBoldBlack16Style(),
                                    ),
                                    Text(
                                      "ستور البرندات",
                                      style: getPrimaryBoldStyle20Style(),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                          ),
                          SizedBox(
                            height: 250.h, // Adjust based on item height
                            child: GridView.builder(
                              scrollDirection: Axis.horizontal,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3, // Two rows
                                childAspectRatio: 2 / 4,
                                mainAxisSpacing: 10,

                                // Square items
                              ),
                              itemCount: categories.length,
                              itemBuilder: (context, index) {
                                final category = categories[index];
                                return GestureDetector(
                                  onTap: () {
                                    Nav.brandPage(context,
                                        BrandTitle: "Marwa Brand",
                                        BrandImage:
                                            "https://cdn.dribbble.com/userupload/15432182/file/original-86fe3dcc263edbe838fef0168d02126b.jpg?crop=575x1152-1425x1790&format=webp&resize=400x300&vertical=center");
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Card(
                                      shadowColor: Colors.black,
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.h)),
                                      child: Picture(
                                        "https://cdn.dribbble.com/userupload/15432182/file/original-86fe3dcc263edbe838fef0168d02126b.jpg?crop=575x1152-1425x1790&format=webp&resize=400x300&vertical=center",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ), // The asynchronous task
                    builder:
                        (BuildContext context, AsyncSnapshot<Widget> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                            child:
                                CircularProgressIndicator()); // Loading indicator
                      } else if (snapshot.hasError) {
                        return Center(
                            child: Text(
                                'Error: ${snapshot.error}')); // Error message
                      } else if (snapshot.hasData) {
                        return snapshot.data!; // Display the widget from Future
                      } else {
                        return Center(
                            child:
                                Text('No Data')); // Handle unexpected null data
                      }
                    },
                  ),

                  Gap(20.h),

                  FutureBuilder<Widget>(
                    future: Future.delayed(
                      Duration(milliseconds: 2000),
                      () => Column(
                        children: [
                          Container(
                            height: 110.h,
                            color: primary.withOpacity(.2),
                            width: double.infinity,
                            child: Center(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "فقط",
                                      style: getBoldBlack16Style(),
                                    ),
                                    Text(
                                      "علي شوبنير",
                                      style: getPrimaryBoldStyle20Style(),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                          ),
                          AutoScrollingGridView(),
                        ],
                      ),
                    ), // The asynchronous task
                    builder:
                        (BuildContext context, AsyncSnapshot<Widget> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                            child:
                                CircularProgressIndicator()); // Loading indicator
                      } else if (snapshot.hasError) {
                        return Center(
                            child: Text(
                                'Error: ${snapshot.error}')); // Error message
                      } else if (snapshot.hasData) {
                        return snapshot.data!; // Display the widget from Future
                      } else {
                        return Center(
                            child:
                                Text('No Data')); // Handle unexpected null data
                      }
                    },
                  ),

                  Gap(20.h),

                  FutureBuilder<Widget>(
                    future: Future.delayed(
                      Duration(milliseconds: 2000),
                      () => Column(
                        children: [
                          CategoryOffersAndProducts(
                            categoryName: "العطور",
                            categoryBGColor: Colors.black,
                            offer: "خصم 70 %",
                            offerImgUrl:
                                "https://i.pinimg.com/736x/5c/fd/1b/5cfd1b4cf3a4cfc0e1338f1fffc835aa.jpg",
                            productImgUrl:
                                "https://i.pinimg.com/736x/b3/77/c7/b377c75e4cda6ccd3f9a18fdc7da482a.jpg",
                          ),
                          Gap(20.h),
                          CategoryOffersAndProducts(
                            categoryName: "الفساتين",
                            categoryBGColor: primary,
                            offer: "خصم 40 %",
                            offerImgUrl:
                                "https://live.myplug.com/WS/image_resize/?pic=aHR0cHM6Ly9lbGl0ZS1jb25jZXB0ei5zMy5hbWF6b25hd3MuY29tL29mZmVyX2ltYWdlcy81NjYvNGM2ZjMzMWM5NmFiYTY3NzE3ZDQ5YWNlNzI2MjEzNmEwYTcxNmJhOC5qcGVn&height=515&width=412&color=FFFFFF",
                            productImgUrl:
                                "https://www.nicepng.com/png/detail/18-180657_pink-dress-png-party-dress-transparent-clipart.png",
                          ),
                          Gap(20.h),
                          CategoryOffersAndProducts(
                            categoryName: "أزياء الأطفال",
                            categoryBGColor: Colors.black,
                            offer: "خصم 80 %",
                            offerImgUrl:
                                "https://i.ytimg.com/vi/edfILaEG-xc/hq720.jpg?sqp=-oaymwE7CK4FEIIDSFryq4qpAy0IARUAAAAAGAElAADIQj0AgKJD8AEB-AH-CYAC0AWKAgwIABABGH8gEyg9MA8=&rs=AOn4CLBbMyLNOJjDs_9Oo0xiRPl9-ZXP7Q",
                            productImgUrl:
                                "https://cdn.salla.sa/rAajaZ/25fb2d60-72dd-434c-bc99-a563d0c3b4b8-908.91089108911x1000-vab5OacpCGNhxalzygI18uRfKZMQkqdSdVyBBuPJ.png",
                          ),
                          Gap(20.h),
                          CategoryOffersAndProducts(
                            categoryName: "المكياج",
                            categoryBGColor: primary,
                            offer: "خصم 25 %",
                            offerImgUrl:
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPpa0D4YS6-2IFV8cIsVKw2wuCjIgnsUdZYw&s",
                            productImgUrl:
                                "https://static.vecteezy.com/system/resources/thumbnails/026/539/848/small_2x/pink-cosmetic-bag-with-tools-for-artificial-eyelash-extensions-brushes-false-eyelashes-products-in-bottles-watercolor-illustration-hand-drawn-isolated-composition-png.png",
                          ),
                          Gap(20.h),
                          CategoryOffersAndProducts(
                            categoryName: "لانجيري",
                            categoryBGColor: Colors.black,
                            offer: "خصم 45 %",
                            offerImgUrl:
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4aUieTLqVmWc_Nf8Hm9QWewL4fnV-JndhLOlTDHiSpMHEnMdnokjxuYVIChChmsF9vAI&usqp=CAU",
                            productImgUrl:
                                "https://cdn11.bigcommerce.com/s-zgzcmknun3/images/stencil/1280x1280/products/12156/34572/Prima_Donna_Madison_Seamless_Bra_0262127_Pink__47117.1720741946.png?c=2",
                          ),
                        ],
                      ),
                    ), // The asynchronous task
                    builder:
                        (BuildContext context, AsyncSnapshot<Widget> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                            child:
                                CircularProgressIndicator()); // Loading indicator
                      } else if (snapshot.hasError) {
                        return Center(
                            child: Text(
                                'Error: ${snapshot.error}')); // Error message
                      } else if (snapshot.hasData) {
                        return snapshot.data!; // Display the widget from Future
                      } else {
                        return Center(
                            child:
                                Text('No Data')); // Handle unexpected null data
                      }
                    },
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

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: primary.withOpacity(.03),
      child: Column(
        children: [
          Gap(20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Picture(
                  getAssetImage("logo_without_bg.png"),
                  width: 50.h,
                  height: 50.h,
                  color: primary,
                ),
              ),
              Gap(10.w),
              Expanded(
                child: AnimatedSearchField(
                  onSubmit: (val) {
                    Nav.searchPage(context, val);
                  },
                ),
              ),
              Gap(10.w),
              GestureDetector(
                onTap: () {
                  Nav.favoritesPage(context);
                },
                child: Container(
                  height: 50.h,
                  width: 50.h,
                  child: Card(
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
              ),
              Gap(10.w),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Row(
              children: [
                Picture(
                  getAssetIcon("location.svg"),
                  width: 30.h,
                  height: 30.h,
                  color: primary,
                ),
                Text(
                  " توصيل الي : ",
                  style: getRegularPrimary14Style(),
                ),
                Expanded(
                  child: Text(
                    " الف مسكن - مصر الجديده - القاهره -مصر ",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: getBoldBlack14Style(),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_drop_down_circle_outlined))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryOffersAndProducts extends StatelessWidget {
  CategoryOffersAndProducts({
    super.key,
    required this.categoryName,
    required this.offer,
    required this.offerImgUrl,
    required this.productImgUrl,
    required this.categoryBGColor,
  });

  String categoryName;
  String offer;
  String offerImgUrl;
  Color categoryBGColor;
  String productImgUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 850.h,
      width: double.infinity,
      color: categoryBGColor.withOpacity(.02),
      child: Padding(
        padding: EdgeInsets.all(10.h),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        categoryName,
                        style: getBoldPrimary18Style(),
                      ),
                      Gap(10.h),
                      Text(
                        offer,
                        style: getBoldBlack18Style(),
                      ),
                    ],
                  ),
                ),
                CustomElevatedButton(
                  condition: true,
                  width: 200.w,
                  height: 40.h,
                  buttonColor: Colors.black,
                  onTap: () {},
                  buttonName: "شوف كل العروض",
                ),
              ],
            ),
            Gap(20.h),
            Container(
              height: 150.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) {
                  return Gap(10.w);
                },
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Nav.offerPage(context,
                          OfferTitle: offer + " علي " + categoryName,
                          OfferImage: offerImgUrl);
                    },
                    child: Container(
                      width: 100.w,
                      height: 150.h,
                      child: Card(
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.h)),
                        child: Picture(
                          offerImgUrl,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  );
                },
                itemCount: 10,
              ),
            ),
            Gap(20.h),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "عروض",
                            style: getBoldBlack18Style(),
                          ),
                          Gap(10.w),
                          Expanded(
                            child: Text(
                              categoryName,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: getBoldPrimary18Style(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                CustomElevatedButton(
                  condition: true,
                  width: 200.w,
                  height: 40.h,
                  buttonColor: Colors.black,
                  onTap: () {},
                  buttonName: "شوف كل العروض",
                ),
              ],
            ),
            Gap(20.h),
            Container(
              height: 500.h,
              width: double.infinity,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                        height: 250.h,
                        width: 200.w,
                        child: MainProductWidget(
                          imgUrl: productImgUrl,
                        ));
                  },
                  separatorBuilder: (context, index) {
                    return Gap(10.w);
                  },
                  itemCount: 10),
            ),
          ],
        ),
      ),
    );
  }
}

class AutoScrollingGridView extends StatefulWidget {
  @override
  _AutoScrollingGridViewState createState() => _AutoScrollingGridViewState();
}

class _AutoScrollingGridViewState extends State<AutoScrollingGridView> {
  final List<String> categories =
      List.generate(20, (index) => "Category $index");
  final ScrollController _scrollController = ScrollController();
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_scrollController.hasClients) {
        double maxScroll = _scrollController.position.maxScrollExtent;
        double currentScroll = _scrollController.offset;
        double nextScroll = currentScroll + 20; // Adjust scroll step

        if (nextScroll >= maxScroll) {
          _scrollController.animateTo(0,
              duration: Duration(seconds: 1),
              curve: Curves.linear); // Reset to the start
        } else {
          _scrollController.animateTo(
            nextScroll,
            duration: const Duration(seconds: 1),
            curve: Curves.linear,
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      color: greyFA,
      child: GridView.builder(
        controller: _scrollController, // Attach the ScrollController
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 30 / 25,
          mainAxisSpacing: 2,
          crossAxisSpacing: 5,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 2,
              shadowColor: primary,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  fit: StackFit.loose,
                  children: [
                    Image.network(
                      "https://i.pinimg.com/474x/57/07/18/5707188516c049be53708ceaee49bdb3.jpg",
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
