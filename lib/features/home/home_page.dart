import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart'
    show CountdownTimer;
import 'package:gap/gap.dart';
import 'package:shopyneer/config/navigation/nav.dart';
import 'package:shopyneer/core/getit_service/getit_service.dart';
import 'package:shopyneer/core/widgets/elevated_button.dart';
import 'package:shopyneer/core/widgets/picture.dart';
import 'package:shopyneer/features/home/cubit/home_cubit.dart';
import 'package:shopyneer/features/home/cubit/home_state.dart';
import 'package:shopyneer/features/home/models/advertising_response_model.dart';
import 'package:shopyneer/features/home/models/category_model.dart';
import 'package:shopyneer/features/home/widgets/ads_slider.dart';
import 'package:shopyneer/features/home/widgets/animated_search_field.dart';
import 'package:shopyneer/features/home/widgets/buy_more_item.dart';
import 'package:shopyneer/features/home/widgets/home_categories.dart';
import 'package:shopyneer/features/home/widgets/product_widget.dart';
import 'package:shopyneer/shared/theme/colors.dart';
import 'package:shopyneer/shared/theme/styles_manager.dart';
import 'package:size_config/size_config.dart';

import '../../core/utils/get_asset_path.dart';
import '../../core/widgets/dot_seperator.dart';

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

  late CountdownTimerController controller;
  final int endTime =
      DateTime.now().millisecondsSinceEpoch + 1000 * (21 * 3600 + 50 * 60 + 15);

  final CarouselSliderController? _controller = CarouselSliderController();
  final ValueNotifier<int> _currentIndex = ValueNotifier<int>(0);
  final List<String> imageUrls = [
    "https://shopyneer.com/cdn/shop/files/copy_0b3c20ac-e028-474c-b100-d572d5f23633.jpg?v=1730359256&width=3840",
    "https://shopyneer.com/cdn/shop/files/copy_0b3c20ac-e028-474c-b100-d572d5f23633.jpg?v=1730359256&width=3840",
    "https://shopyneer.com/cdn/shop/files/copy_0b3c20ac-e028-474c-b100-d572d5f23633.jpg?v=1730359256&width=3840",
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

  HomeCubit homeCubit = getIt.get<HomeCubit>()..getGeneralProducts();

  @override
  void initState() {
    controller = CountdownTimerController(endTime: endTime, onEnd: onEnd);
  }

  void onEnd() {
    setState(() {});
  }

  Widget _buildTimeBox(String value) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.7),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        value,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildSeparator() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: Text(
        ":",
        style:
            TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: black),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeCubit,
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Color(0xffffffff),
            body: Column(
              children: [
                Header(),
                /* Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Divider(),
                ),*/
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Gap(10.h),
                        // ==================================================
                        // ADVERTISEMENTS CAROUSEL SECTION
                        // --------------------------------------------------
                        /// TODO: Implement dynamic ads loading from API
                        /// Currently using static image URLs for demonstration
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

                        // ==================================================
                        // CATEGORIES GRID VIEW SECTION
                        // --------------------------------------------------
                        /// Responsive horizontal grid showing product categories
                        /// Uses adaptive spacing based on screen height
                        Gap(20.h),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: HorizontalGridView(categories: categories),
                        ),

                        // ==================================================
                        // PROMOTIONAL SECTIONS
                        // --------------------------------------------------
                        DotSeparator(),
                        BuyMorePart(), // Upsell section for bulk purchases
                        DotSeparator(),
                        MegaOffersPart(), // Featured mega deals carousel

                        // ==================================================
                        // ASYNC-LOADED CONTENT SECTIONS
                        // --------------------------------------------------
                        // Discounts Section (Async Loaded)

                        DotSeparator(),

                        FutureBuilder<Widget>(
                          future: Future.delayed(
                            Duration(milliseconds: 2500),
                            () => SeeAllDiscountsPart(),
                          ),
                          builder: (BuildContext context,
                              AsyncSnapshot<Widget> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return Center(
                                  child: Text('Error: ${snapshot.error}'));
                            }
                            return snapshot.hasData
                                ? snapshot.data!
                                : Center(child: Text('No Data'));
                          },
                        ),

                        DotSeparator(),
                        // Coupons Section (Async Loaded)
                        FutureBuilder<Widget>(
                          future: Future.delayed(
                            Duration(milliseconds: 2500),
                            () => DiscountCuponsPart(),
                          ),
                          builder: (BuildContext context,
                              AsyncSnapshot<Widget> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return Center(
                                  child: Text('Error: ${snapshot.error}'));
                            }
                            return snapshot.hasData
                                ? snapshot.data!
                                : Center(child: Text('No Data'));
                          },
                        ),

                        // ==================================================
                        // PRODUCT RECOMMENDATIONS
                        // --------------------------------------------------
                        DotSeparator(),
                        SuggestedForUPart(), // Personalized recommendations
                        DotSeparator(),

                        // ==================================================
                        // OFFERS SLIDER (Stateful Section)
                        // --------------------------------------------------
                        /// Controlled by PageController
                        /// Auto-animated slider with indicator dots
                        OffersSliderPart(
                            controller: _controller,
                            currentIndex: _currentIndex,
                            imageUrls: imageUrls),
                        DotSeparator(),

                        // ==================================================
                        // LATEST PRODUCTS (Async Loaded)
                        // --------------------------------------------------
                        FutureBuilder<Widget>(
                          future: Future.delayed(
                            Duration(milliseconds: 2500),
                            () => LatestProductsPart(),
                          ),
                          builder: (BuildContext context,
                              AsyncSnapshot<Widget> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return Center(
                                  child: Text('Error: ${snapshot.error}'));
                            }
                            return snapshot.hasData
                                ? snapshot.data!
                                : Center(child: Text('No Data'));
                          },
                        ),

                        // ==================================================
                        // SPECIAL OFFERS SECTIONS
                        // --------------------------------------------------
                        DotSeparator(),
                        StrongestOffersPart(), // Time-limited special offers
                        DotSeparator(),
                        buildFlashSalePart(), // Countdown timer flash sales

                        // ==================================================
                        // BRAND-RELATED CONTENT
                        // --------------------------------------------------
                        DotSeparator(),
                        FutureBuilder<Widget>(
                          future: Future.delayed(
                            Duration(milliseconds: 1500),
                            () => BrandsStoresPart(categories: categories),
                          ),
                          builder: (BuildContext context,
                              AsyncSnapshot<Widget> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return Center(
                                  child: Text('Error: ${snapshot.error}'));
                            }
                            return snapshot.hasData
                                ? snapshot.data!
                                : Center(child: Text('No Data'));
                          },
                        ),

                        // ==================================================
                        // PLATFORM EXCLUSIVES
                        // --------------------------------------------------
                        DotSeparator(),
                        FutureBuilder<Widget>(
                          future: Future.delayed(
                            Duration(milliseconds: 2000),
                            () => OnlyOnShopyneerPart(),
                          ),
                          builder: (BuildContext context,
                              AsyncSnapshot<Widget> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return Center(
                                  child: Text('Error: ${snapshot.error}'));
                            }
                            return snapshot.hasData
                                ? snapshot.data!
                                : Center(child: Text('No Data'));
                          },
                        ),

                        // ==================================================
                        // CATEGORY-SPECIFIC OFFERS
                        // --------------------------------------------------
                        DotSeparator(),
                        FutureBuilder<Widget>(
                          future: Future.delayed(
                            Duration(milliseconds: 2000),
                            () => CategorySomeProductsAndOffersPart(),
                          ),
                          builder: (BuildContext context,
                              AsyncSnapshot<Widget> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return Center(
                                  child: Text('Error: ${snapshot.error}'));
                            }
                            return snapshot.hasData
                                ? snapshot.data!
                                : Center(child: Text('No Data'));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Center buildFlashSalePart() {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        color: Colors.pink[50],
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: CountdownTimer(
                    controller: controller,
                    widgetBuilder: (_, time) {
                      if (time == null) {
                        return Center(
                          child: Text(
                            "انتهى",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent.shade200,
                            ),
                          ),
                        );
                      }
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildTimeBox("${time.sec ?? 0}"),
                          _buildSeparator(),
                          _buildTimeBox("${time.min ?? 0}"),
                          _buildSeparator(),
                          _buildTimeBox("${time.hours ?? 0}"),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
            Divider(
              color: greyFA,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text("كل يوم ", style: getRegularBlack16Style()),
                    SizedBox(width: 4),
                    Text("Flash Sale", style: getBoldPrimary16Style()),
                    SizedBox(width: 4),
                    Icon(Icons.local_offer, color: primary),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    children: [
                      Text("اكتشفي كل العروض", style: getVBoldWhite14Style()),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward, color: Colors.white),
                    ],
                  ),
                ),
              ],
            ),
            Divider(
              color: greyFA,
            ),
            Container(
              height: 430.h,
              width: double.infinity,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                        height: 220.h,
                        width: 200.w,
                        child: MainProductWidget(
                          imgUrl:
                              "https://www.dhresource.com/webp/m/0x0/f2/albu/g17/M01/3D/60/rBVa4l_m-6WAC39fAAMzXTSmCNM346.jpg",
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

class CategorySomeProductsAndOffersPart extends StatelessWidget {
  const CategorySomeProductsAndOffersPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}

class OnlyOnShopyneerPart extends StatelessWidget {
  const OnlyOnShopyneerPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 110.h,
          color: primary.withOpacity(.05),
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
                    style: getBoldBlack14Style(),
                  ),
                  Text(
                    " علي شوبنير ",
                    style: getPrimaryBoldStyle20Style(),
                  ),
                ],
              ),
            ],
          )),
        ),
        AutoScrollingGridView(),
      ],
    );
  }
}

class BrandsStoresPart extends StatelessWidget {
  const BrandsStoresPart({
    super.key,
    required this.categories,
  });

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 110.h,
          color: primary.withOpacity(.05),
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
                    style: getBoldBlack14Style(),
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
          height: 260.h, // Adjust based on item height
          child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Two rows
              childAspectRatio: 2 / 2,

              // Square items
            ),
            itemCount: 30,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Nav.brandPage(context,
                      BrandTitle: "Marwa Brand",
                      BrandImage:
                          "https://cdn.dribbble.com/userupload/15432182/file/original-86fe3dcc263edbe838fef0168d02126b.jpg?crop=575x1152-1425x1790&format=webp&resize=400x300&vertical=center");
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(100), // يجعل الصورة دائرية
                    child: Image.network(
                      "https://cdn.dribbble.com/userupload/15432182/file/original-86fe3dcc263edbe838fef0168d02126b.jpg?crop=575x1152-1425x1790&format=webp&resize=400x300&vertical=center",
                      fit: BoxFit.cover, // غيّره حسب الحاجة
                      width: 100, // حجم الصورة
                      height: 100,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class StrongestOffersPart extends StatelessWidget {
  const StrongestOffersPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      color: greyFA,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "أجمد",
                          style: getBoldBlack18Style(),
                        ),
                        Gap(10.w),
                        Expanded(
                          child: Text(
                            "العروض",
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
            height: 430.h,
            width: double.infinity,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                      height: 220.h,
                      width: 200.w,
                      child: MainProductWidget(
                        imgUrl:
                            "https://eg.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/43/167935/1.jpg?3501",
                      ));
                },
                separatorBuilder: (context, index) {
                  return Gap(10.w);
                },
                itemCount: 5),
          ),
        ],
      ),
    );
  }
}

class LatestProductsPart extends StatelessWidget {
  const LatestProductsPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 110.h,
          width: double.infinity,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "أحدث ",
                        style: getBoldBlack20Style(),
                      ),
                      Gap(5.w),
                      Text(
                        " المنتجات ",
                        style: getPrimaryBoldStyle20Style(),
                      ),
                    ],
                  ),
                  color: primary.withOpacity(.05),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 160.h,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.all(5.h),
            child: GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.all(10.h),
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 40 / 75,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Nav.offerPage(
                      context,
                      OfferImage:
                          "https://couponatstore.com/wp-content/uploads/2022/03/%D9%83%D9%88%D8%AF-%D8%AE%D8%B5%D9%85-%D9%81%D9%8A%D9%83%D8%AA%D9%88%D8%B1%D9%8A%D8%A7-%D8%B3%D9%8A%D9%83%D8%B1%D9%8A%D8%AA-640x360.png",
                      OfferTitle: "كود خصم فيكتوريا",
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 8.h),
                    child: Picture(
                      "https://m.media-amazon.com/images/I/616K7ohBNzS._AC_UF894,1000_QL80_.jpg",
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class OffersSliderPart extends StatelessWidget {
  const OffersSliderPart({
    super.key,
    required CarouselSliderController? controller,
    required ValueNotifier<int> currentIndex,
    required this.imageUrls,
  })  : _controller = controller,
        _currentIndex = currentIndex;

  final CarouselSliderController? _controller;
  final ValueNotifier<int> _currentIndex;
  final List<String> imageUrls;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.loose,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: CarouselSlider(
            carouselController: _controller,
            options: CarouselOptions(
              height: 100,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.9,
              autoPlayInterval: Duration(seconds: 3),
              onPageChanged: (index, reason) {
                _currentIndex.value = index; // تحديث قيمة المؤشر
              },
            ),
            items: imageUrls.map((url) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(url,
                    fit: BoxFit.cover, width: double.infinity),
              );
            }).toList(),
          ),
        ),

        // زر الرجوع
        // زر الرجوع
        Positioned(
          left: 10,
          child: Container(
            width: 40, // ضبط عرض الزر
            height: 40, // ضبط ارتفاع الزر
            alignment: Alignment.center, // جعل الأيقونة في المنتصف تمامًا
            decoration: BoxDecoration(
              color: Colors.white, // خلفية بيضاء مثل الصورة
              shape: BoxShape.circle, // شكل دائري للأيقونة
            ),
            child: IconButton(
              icon: Icon(Icons.arrow_forward_ios,
                  color: Colors.brown.shade700, size: 15.sp),
              padding: EdgeInsets.zero,
              onPressed: () => _controller!.previousPage(),
            ),
          ),
        ),

        Positioned(
          right: 10,
          child: Container(
            width: 40, // ضبط عرض الزر
            height: 40, // ضبط ارتفاع الزر
            alignment: Alignment.center, // جعل الأيقونة في المنتصف تمامًا
            decoration: BoxDecoration(
              color: Colors.white, // خلفية بيضاء مثل التصميم في الصورة
              shape: BoxShape.circle, // جعل الزر دائريًا
            ),
            child: IconButton(
              icon: Icon(
                  Icons.arrow_back_ios_new, // تغيير الأيقونة إلى السهم الصحيح
                  color: Colors.brown.shade700,
                  size: 15.sp),
              padding: EdgeInsets.zero,
              onPressed: () =>
                  _controller!.nextPage(), // استدعاء الصفحة التالية
            ),
          ),
        ),

        // المؤشرات (Dots) باستخدام ValueListenableBuilder
      ],
    );
  }
}

class SuggestedForUPart extends StatelessWidget {
  const SuggestedForUPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100.h,
          color: primary.withOpacity(.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "مقترحه",
                style: getBoldBlack20Style(),
              ),
              Text(
                " لك ",
                style: getBoldPrimary19Style(),
              ),
            ],
          ),
        ),
        Gap(20.h),
        Container(
          height: 430.h,
          width: double.infinity,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                    height: 220.h,
                    width: 200.w,
                    child: MainProductWidget(
                      imgUrl:
                          "https://www.dhresource.com/webp/m/0x0/f2/albu/g17/M01/3D/60/rBVa4l_m-6WAC39fAAMzXTSmCNM346.jpg",
                    ));
              },
              separatorBuilder: (context, index) {
                return Gap(10.w);
              },
              itemCount: 10),
        ),
      ],
    );
  }
}

class DiscountCuponsPart extends StatelessWidget {
  const DiscountCuponsPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 110.h,
          width: double.infinity,
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
                  color: primary.withOpacity(.05),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 160.h,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.all(5.h),
            child: GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.all(10.h),
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 40 / 78,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Nav.offerPage(
                      context,
                      OfferImage:
                          "https://couponatstore.com/wp-content/uploads/2022/03/%D9%83%D9%88%D8%AF-%D8%AE%D8%B5%D9%85-%D9%81%D9%8A%D9%83%D8%AA%D9%88%D8%B1%D9%8A%D8%A7-%D8%B3%D9%8A%D9%83%D8%B1%D9%8A%D8%AA-640x360.png",
                      OfferTitle: "كود خصم فيكتوريا",
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 8.h),
                    child: Picture(
                      "https://couponatstore.com/wp-content/uploads/2022/03/%D9%83%D9%88%D8%AF-%D8%AE%D8%B5%D9%85-%D9%81%D9%8A%D9%83%D8%AA%D9%88%D8%B1%D9%8A%D8%A7-%D8%B3%D9%8A%D9%83%D8%B1%D9%8A%D8%AA-640x360.png",
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class SeeAllDiscountsPart extends StatelessWidget {
  const SeeAllDiscountsPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 110.h,
          width: double.infinity,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        " شوف كل",
                        style: getBoldBlack20Style(),
                      ),
                      Gap(5.w),
                      Text(
                        " الخصومات ",
                        style: getPrimaryBoldStyle20Style(),
                      ),
                    ],
                  ),
                  color: primary.withOpacity(.05),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 260.h,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.all(5.h),
            child: GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.all(10.h),
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.h,
                childAspectRatio: 40 / 78,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Nav.offerPage(
                      context,
                      OfferImage:
                          "https://couponatstore.com/wp-content/uploads/2022/03/%D9%83%D9%88%D8%AF-%D8%AE%D8%B5%D9%85-%D9%81%D9%8A%D9%83%D8%AA%D9%88%D8%B1%D9%8A%D8%A7-%D8%B3%D9%8A%D9%83%D8%B1%D9%8A%D8%AA-640x360.png",
                      OfferTitle: "كود خصم فيكتوريا",
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 8.h),
                    child: Picture(
                      "https://couponatstore.com/wp-content/uploads/2022/03/%D9%83%D9%88%D8%AF-%D8%AE%D8%B5%D9%85-%D9%81%D9%8A%D9%83%D8%AA%D9%88%D8%B1%D9%8A%D8%A7-%D8%B3%D9%8A%D9%83%D8%B1%D9%8A%D8%AA-640x360.png",
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class MegaOffersPart extends StatelessWidget {
  const MegaOffersPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 650.h,
      width: double.infinity,
      color: primary,
      child: Column(
        children: [
          Gap(20.h),
          Container(
            height: 100.h,
            width: double.infinity,
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        " عروض الميجا",
                        style: getBoldWhite16Style(),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: CustomElevatedButton(
                            removeShadow: true,
                            buttonName: "إكتشفي جميع العروض",
                            buttonTextStyle: getW700White14Style(),
                            buttonColor: Colors.black,
                            onTap: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(5.h),
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  childAspectRatio: 35 / 30,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        Nav.productDetailsPage(context);
                      },
                      child: BuyMoreItem(
                        imageUrl:
                            "https://www.dhresource.com/webp/m/0x0/f2/albu/g17/M01/3D/60/rBVa4l_m-6WAC39fAAMzXTSmCNM346.jpg",
                        description: "خصم حتي 60 %",
                        title: "أزياء الشتاء",
                      ));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BuyMorePart extends StatelessWidget {
  const BuyMorePart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600.h,
      width: double.infinity,
      color: primary.withOpacity(.03),
      child: Column(
        children: [
          Gap(20.h),
          Container(
            height: 100.h,
            width: double.infinity,
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "إشتري أكتر ",
                      style: getBoldPrimary18Style(),
                    ),
                    Text(
                      "وبالك مرتاح",
                      style: getBoldBlack18Style(),
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
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  childAspectRatio: 35 / 30,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        Nav.productDetailsPage(context);
                      },
                      child: BuyMoreItem(
                        imageUrl:
                            "https://m.media-amazon.com/images/I/61os7UhG-2L.jpg",
                        title: "إشتري المحلي ",
                        description: "منتجات مصريه بجوده عاليه",
                      ));
                },
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
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(6.r),
            bottomRight: Radius.circular(6.r),
          )),
      child: Column(
        children: [
          Gap(20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 50.h,
                width: 50.h,
                child: Padding(
                  padding: EdgeInsets.all(10.h),
                  child: Picture(
                    getAssetImage("logo_without_bg.png"),
                    width: 40.h,
                    height: 40.h,
                    color: primary,
                  ),
                ),
              ),
              Gap(10.w),
              Expanded(
                child: Center(
                  child: AnimatedSearchField(
                    onSubmit: (val) {
                      Nav.searchPage(context, val);
                    },
                  ),
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
              Gap(10.w),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              children: [
                Picture(
                  getAssetIcon("location.svg"),
                  width: 20.h,
                  height: 20.h,
                  color: primary,
                ),
                Text(
                  " توصيل الي : ",
                  style: getBoldPrimary14Style(),
                ),
                Expanded(
                  child: Text(
                    " الف مسكن - مصر الجديده - القاهره -مصر ",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: getRegularBlack12Style(),
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
      height: 770.h,
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
              height: 430.h,
              width: double.infinity,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                        height: 220.h,
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
              elevation: 0,
              shadowColor: primary,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
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
