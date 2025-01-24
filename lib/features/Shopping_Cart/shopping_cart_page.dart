import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shopyneer/config/navigation/nav.dart';
import 'package:shopyneer/config/theme/colors.dart';
import 'package:shopyneer/config/theme/styles_manager.dart';
import 'package:shopyneer/core/utils/get_asset_path.dart';
import 'package:shopyneer/core/widgets/elevated_button.dart';
import 'package:shopyneer/core/widgets/picture.dart';
import 'package:size_config/size_config.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({super.key});

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyFA,
      body: Padding(
        padding: EdgeInsets.all(10.h),
        child: Column(
          children: [
            Container(
              height: 50.h,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "العربه",
                    style: getBoldBlack20Style(),
                  ),
                  Text(
                    "  ( منتج واحد )  ",
                    style: getRegularGrey14Style(),
                  ),
                  Spacer(),
                  Container(
                    height: 40.h,
                    width: 40.h,
                    child: Card(
                      color: primary.withOpacity(.1),
                      child: Padding(
                        padding: EdgeInsets.all(10.h),
                        child: Picture(
                          getAssetIcon("fav_home.svg"),
                          width: 30.h,
                          height: 30.h,
                          color: primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Gap(10.h),
            Container(
              height: 50.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: greyFA, borderRadius: BorderRadius.circular(10.h)),
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
                      style: getRegularBlack14Style(),
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_drop_down_circle_outlined))
                ],
              ),
            ),
            Gap(20.h),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return CartItem();
                      },
                      itemCount: 10,
                    ),
                    Card(
                      color: Colors.white,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.h)),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "أكتب كود الخصم هنا ...",
                                hintStyle: getRegularGrey12Style(),
                                focusedBorder: InputBorder.none,
                                fillColor: Colors.transparent,
                                border: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                          Container(
                            height: 50.h,
                            width: 150.w,
                            child: Center(
                              child: Text(
                                "تفعيل",
                                style: getBoldPrimary16Style(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Gap(20.h),
                    Card(
                      color: Colors.white,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.h)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 10.h),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "المجموع الفرعي",
                                  style: getRegularGrey12Style(),
                                ),
                                Text(
                                  "( 5 منتجات)",
                                  style: getRegularGrey12Style(),
                                ),
                                Spacer(),
                                Text(" 9000 ج.م",
                                    style: getBoldGreyD014Style()),
                              ],
                            ),
                            Gap(20.h),
                            Row(
                              children: [
                                Text(
                                  "مصاريف الشحن",
                                  style: getRegularGrey12Style(),
                                ),
                                Spacer(),
                                Text(" 200 ج.م", style: getBoldGreyD014Style()),
                              ],
                            ),
                            Divider(
                              height: 20.h,
                              color: greyFA,
                            ),
                            Row(
                              children: [
                                Text(
                                  "المجموع",
                                  style: getBoldBlack16Style(),
                                ),
                                Spacer(),
                                Text(
                                  " 9200 ج.م",
                                  style: getBoldBlack16Style(),
                                ),
                              ],
                            ),
                            Gap(20.h),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            CustomElevatedButton(
              condition: true,
              onTap: () {},
              buttonColor: Colors.black,
              buttonName: "إتمام عملية الشراء",
            ),
          ],
        ),
      ),
    );
  }
}

class CartItem extends StatefulWidget {
  const CartItem({super.key});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Nav.productDetailsPage(context);
      },
      child: Padding(
        padding: EdgeInsets.all(10.h),
        child: Container(
          width: double.infinity,
          child: Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 4,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 30.h,
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
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
                      Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.h),
                              bottomRight: Radius.circular(10.h)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 5.h, horizontal: 20.w),
                          child: Text(
                            "إكسبرس",
                            style: getBoldBlack12Style(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: greyFA,
                ),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        'https://static.vecteezy.com/system/resources/thumbnails/048/053/161/small_2x/a-pastel-paradise-of-skincare-products-png.png', // Replace with the actual image URL
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Gap(10.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'بابلز',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '4 زجاجات حفظ اللبن من بابلز *150 مل',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '359.00 ج.م',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  'احصل عليها في الاثنين، 23 ديسمبر',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'اطلب خلال 21 ساعة 43 دقيقة',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.local_shipping,
                          color: primary,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'توصيل مجاني',
                          style: getBoldBlack12Style(),
                        ),
                      ],
                    ),
                  ],
                ),
                Gap(10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.not_interested,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'لايمكن استبدال او إرجاع هذا المنتج ',
                          style: getRegularGrey12Style(),
                        ),
                      ],
                    ),
                  ],
                ),
                Gap(10.h),
                Row(
                  children: [
                    Container(
                      height: 40.h,
                      decoration: BoxDecoration(
                          color: greyFA,
                          borderRadius: BorderRadius.circular(10.h),
                          border: Border.all(color: greyD0)),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              width: 40.w,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.h),
                                color: white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Icon(
                                  Icons.add,
                                  color: primary,
                                  size: 15.sp,
                                ),
                              ),
                            ),
                          ),
                          Gap(10.w),
                          Text(
                            '1000',
                            style: getBoldBlack14Style(),
                          ),
                          Gap(10.w),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: double.infinity,
                              width: 40.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.h),
                                color: white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Icon(
                                  Icons.remove,
                                  color: primary,
                                  size: 15.sp,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.delete_outline, color: primary),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite_border, color: primary),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
