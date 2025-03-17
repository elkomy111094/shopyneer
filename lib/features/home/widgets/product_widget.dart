import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shopyneer/config/navigation/nav.dart';
import 'package:shopyneer/core/utils/get_asset_path.dart';
import 'package:shopyneer/core/widgets/picture.dart';
import 'package:shopyneer/features/home/models/products_general_response.dart';
import 'package:shopyneer/shared/theme/colors.dart';
import 'package:shopyneer/shared/theme/styles_manager.dart';
import 'package:size_config/size_config.dart';

class MainProductWidget extends StatefulWidget {
  String? imgUrl;
  Product? product;
  MainProductWidget({
    super.key,
    this.imgUrl,
    this.product,
  });

  @override
  State<MainProductWidget> createState() => _MainProductWidgetState();
}

class _MainProductWidgetState extends State<MainProductWidget> {
  bool isFavorite = false;

  _MainProductWidgetState();

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
        height: 400.h,
        child: Container(
          height: 430,
          child: Card(
            elevation: 0,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.h),
              side: BorderSide(color: greyFA),
            ),
            child: Padding(
              padding: EdgeInsets.all(5.h),
              child: Stack(
                children: [
                  Wrap(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 200.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.h),
                              color: greyFA,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.h),
                              child: SizedBox(
                                width: double.infinity,
                                height: 100.h,
                                child: CachedNetworkImage(
                                  fit: BoxFit.fill,
                                  imageUrl: widget.product == null
                                      ? widget.imgUrl ?? ""
                                      : widget.product!.images![0].url,
                                  placeholder: (context, url) =>
                                      Picture(getAssetImage("")),
                                  errorWidget: (context, url, __) =>
                                      Picture(getAssetImage("")),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 5.h,
                            left: 5.w,
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
                                    backgroundColor: primary.withOpacity(.05),
                                    child: isFavorite
                                        ? SvgPicture.asset(
                                            "assets/icons/fav_home.svg",
                                            color: primary,
                                            width: 16.sp,
                                            height: 16.sp,
                                          )
                                        : Icon(
                                            Icons.favorite_border,
                                            color: primary,
                                            size: 20.sp,
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 10.h,
                            left: 5.w,
                            child: Container(
                              height: 50.h,
                              width: 50.h,
                              child: Card(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.h),
                                ),
                                child: IconButton(
                                    onPressed: () async {},
                                    highlightColor: greyA5,
                                    splashColor: primary,
                                    icon: SvgPicture.asset(
                                      "assets/icons/cart.svg",
                                      color: primary,
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                      /* Container(
                        color: primary.withOpacity(.05),
                        height: 25.h,
                        child: Center(
                          child: Marquee(
                            text: 'خصم 50 % علي هذا المنتج - توصيل مجاني ',
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.bold),
                            scrollAxis: Axis.horizontal, // Horizontal scrolling
                            crossAxisAlignment: CrossAxisAlignment.start,
                            blankSpace:
                                0.0, // Removes delay by eliminating blank space
                            velocity: 100.0, // Adjust speed
                            accelerationDuration:
                                Duration.zero, // No acceleration
                            decelerationDuration: Duration.zero,
                          ),
                        ),
                      ),*/
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 5.h),
                        child: Column(
                          children: [
                            Gap(5.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    widget.product?.title ?? "إسم المنتج",
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
                            Gap(5.h),
                            SizedBox(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      widget.product?.description ??
                                          "وصف المنتج",
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
                              children: [
                                Card(
                                  elevation: 0,
                                  color: greyFA,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.h),
                                  ),
                                  child: Row(
                                    children: [
                                      Gap(10.w),
                                      Text(
                                        "( 1000 )".toString(),
                                        style: getMediumBlack12Style(),
                                      ),
                                      Text(
                                        " 4.5 ",
                                        style: getBoldBlack14Style(),
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
                  Positioned(
                    top: 0,
                    left: 70.w,
                    right: 0,
                    child: Container(
                      height: 30.h,
                      decoration: BoxDecoration(
                        color: Color(0xff471221),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.h),
                          topRight: Radius.circular(5.h),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                              child: Center(
                                  child: Text("خصم 40 %",
                                      style: getVBoldWhite12Style()))),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
