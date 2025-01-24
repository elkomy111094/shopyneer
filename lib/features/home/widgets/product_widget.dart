import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:marquee/marquee.dart';
import 'package:shopyneer/config/navigation/nav.dart';
import 'package:shopyneer/config/theme/colors.dart';
import 'package:shopyneer/config/theme/styles_manager.dart';
import 'package:shopyneer/core/widgets/picture.dart';
import 'package:size_config/size_config.dart';

class MainProductWidget extends StatefulWidget {
  String? imgUrl;
  MainProductWidget({
    super.key,
    this.imgUrl,
  });

  @override
  State<MainProductWidget> createState() => _MainProductWidgetState();
}

class _MainProductWidgetState extends State<MainProductWidget> {
  bool isFavorite = false;

  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Nav.productDetailsPage(context);
      },
      child: Container(
        height: 500.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.h),
          child: Stack(
            children: [
              Container(
                height: 450,
                child: Card(
                  elevation: 5,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.h),
                    side: BorderSide(color: greyD0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5.h),
                    child: Wrap(
                      children: [
                        Container(
                          height: 200.h,
                          color: greyFA,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.h),
                            child: SizedBox(
                              width: double.infinity,
                              height: 100.h,
                              child: CachedNetworkImage(
                                fit: BoxFit.fill,
                                imageUrl: widget.imgUrl ??
                                    "https://iluvlittlepeople.com/cdn/shop/files/A01275_3_1080x.jpg?v=1702432918",
                                placeholder: (context, url) => Image.asset(
                                  "",
                                  fit: BoxFit.fill,
                                ),
                                errorWidget: (context, url, __) => Image.asset(
                                  "",
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          color: primary.withOpacity(.2),
                          height: 25.h,
                          child: Center(
                            child: Marquee(
                              text: 'خصم 50 % علي هذا المنتج - توصيل مجاني ',
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.bold),
                              scrollAxis:
                                  Axis.horizontal, // Horizontal scrolling
                              crossAxisAlignment: CrossAxisAlignment.start,
                              blankSpace:
                                  0.0, // Removes delay by eliminating blank space
                              velocity: 100.0, // Adjust speed
                              accelerationDuration:
                                  Duration.zero, // No acceleration
                              decelerationDuration: Duration.zero,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 5.h),
                          child: Column(
                            children: [
                              Gap(5.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "إسم المنتج",
                                      style: getBoldBlack12Style(),
                                    ),
                                  ),
                                  /*Text(
                                    "Store Name",
                                    style: AppStyles.kTextStyle12.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.kOrangeColor),
                                  )*/
                                ],
                              ),
                              Gap(10.h),
                              Row(
                                children: [
                                  Card(
                                    elevation: 20,
                                    color: Colors.black.withOpacity(.7),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.h),
                                    ),
                                    child: Row(
                                      children: [
                                        Gap(10.w),
                                        Text(
                                          " (25) ",
                                          style: getMediumWhite12Style(),
                                        ),
                                        Text(
                                          "4.5",
                                          style: getMediumWhite12Style(),
                                        ),
                                        InkWell(
                                          child: Padding(
                                            padding: EdgeInsets.all(5.h),
                                            child: Icon(
                                              Icons.star,
                                              color: Colors.orange,
                                              size: 20.sp,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                              Gap(5.h),
                              SizedBox(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "لوريم ايبسوم هو نموذج افتراضي يوضع في التصاميم لتعرض على العميل ليتصور طريقه وضع النصوص بالتصاميم سواء كانت تصاميم مطبوعه … بروشور او فلاير على سبيل المثال … او نماذج مواقع انترنت …",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: getRegularGrey12Style(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Gap(5.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                  Padding(
                                    padding: EdgeInsets.all(15.h),
                                    child: Text(
                                      "60 %",
                                      style: getBoldBlack14Style().copyWith(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                width: double.infinity,
                                height: 30.h,
                                child: CarouselSlider(
                                  items: [
                                    Row(
                                      children: [
                                        Picture(
                                          "https://media.istockphoto.com/id/1453751410/vector/fast-shipping-delivery-truck-flat-icon.jpg?s=612x612&w=0&k=20&c=n-ld7oGUVRXMQdhyzpoaAM0yI55AaLEiog4kH-mpWCE=",
                                          fit: BoxFit.contain,
                                          width: 30.h,
                                          height: 30.h,
                                        ),
                                        Text(
                                          "شحن مجاني",
                                          style: getRegularBlack12Style(),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Picture(
                                          "https://img.freepik.com/premium-vector/cart-icon-icon-vector-image-can-be-used-ecommerce-store_120816-47143.jpg",
                                          fit: BoxFit.contain,
                                          width: 30.h,
                                          height: 30.h,
                                        ),
                                        Text(
                                          "بتخلص بسرعه",
                                          style: getRegularBlack12Style(),
                                        )
                                      ],
                                    ),
                                  ],
                                  options: CarouselOptions(
                                    height: 200, // Adjust height
                                    scrollDirection: Axis.vertical,
                                    autoPlay: true,
                                    autoPlayInterval: Duration(seconds: 1),
                                    autoPlayAnimationDuration:
                                        Duration(milliseconds: 500),
                                    autoPlayCurve: Curves.linear,
                                    enableInfiniteScroll: true,
                                    viewportFraction: 1.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.h, vertical: 15.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Gap(10.w),
                      InkWell(
                        onTap: () async {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                        },
                        child: CircleAvatar(
                          radius: 20.h,
                          backgroundColor: primary.withOpacity(.2),
                          child: isFavorite
                              ? SvgPicture.asset(
                                  "assets/icons/fav_home.svg",
                                  color: primary,
                                  width: 16.sp,
                                  height: 16.sp,
                                )
                              : Icon(
                                  Icons.favorite_border,
                                  color: Colors.white,
                                  size: 20.sp,
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 60.h,
                  width: 60.h,
                  child: Card(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: greyD0),
                      borderRadius: BorderRadius.circular(100.h),
                    ),
                    child: IconButton(
                        onPressed: () async {},
                        highlightColor: greyA5,
                        icon: SvgPicture.asset(
                          "assets/icons/cart.svg",
                          color: Colors.white,
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
