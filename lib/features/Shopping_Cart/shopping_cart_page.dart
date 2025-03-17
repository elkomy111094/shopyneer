import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shopyneer/config/navigation/nav.dart';
import 'package:shopyneer/core/utils/get_asset_path.dart';
import 'package:shopyneer/core/widgets/elevated_button.dart';
import 'package:shopyneer/core/widgets/picture.dart';
import 'package:shopyneer/shared/theme/colors.dart';
import 'package:shopyneer/shared/theme/styles_manager.dart';
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
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 60.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "العربه",
                    style: getPrimaryBoldStyle20Style(),
                  ),
                  Text(
                    "  ( منتج واحد )  ",
                    style: getRegularGrey14Style(),
                  ),
                  Spacer(),
                  Container(
                    height: 50.h,
                    width: 50.h,
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
                ],
              ),
            ),
          ),
          Container(
            child: Padding(
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
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return CartItem();
                    },
                    itemCount: 10,
                  ),
                  Card(
                    color: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.h),
                        side: BorderSide(color: primary)),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30.w),
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
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.w, vertical: 5.h),
                          child: Container(
                            height: 50.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10.h)),
                            child: Center(
                              child: Text(
                                "تفعيل",
                                style: getVBoldWhite12Style(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(20.h),
                  Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.h),
                        side: BorderSide(color: greyFA)),
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
                              Text(" 9000 ج.م", style: getBoldGreyD014Style()),
                            ],
                          ),
                          Gap(20.h),
                          Container(
                            padding: EdgeInsets.all(10.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.h),
                              border: Border.all(color: greyFA),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "مصاريف الشحن",
                                      style: getRegularGrey12Style(),
                                    ),
                                    Spacer(),
                                    Text(" 200 ج.م",
                                        style: getBoldGreyD014Style()),
                                  ],
                                ),
                                Divider(
                                  color: greyFA,
                                ),
                                FreeShippingProgress(
                                    currentAmount: 9200, requiredAmount: 10000),
                              ],
                            ),
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
          Padding(
            padding: EdgeInsets.all(10.h),
            child: CustomElevatedButton(
              condition: true,
              onTap: () {
                Nav.checkpoutPage(context: context);
              },
              buttonColor: Colors.black,
              buttonName: "إتمام عملية الشراء",
            ),
          ),
        ],
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
                border: Border.all(color: greyFA)),
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
                            style: getBoldPrimary16Style(),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '4 زجاجات حفظ اللبن من بابلز *150 مل',
                            style: getRegularGrey14Style(),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '359.00 ج.م',
                            style: getBoldBlack14Style(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  'احصل عليها في الاثنين، 23 ديسمبر',
                  style: getMediumBlue14Style().copyWith(color: Colors.green),
                ),
                Gap(10.h),
                Text(
                  'اطلب خلال 21 ساعة 43 دقيقة',
                  style: getMediumGrey14Style(),
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
                          borderRadius: BorderRadius.circular(10.h),
                          border: Border.all(color: greyFA)),
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
                    InkWell(
                      onTap: () {},
                      child: Container(
                          height: 50.h,
                          width: 50.h,
                          child: Padding(
                            padding: EdgeInsets.all(10.h),
                            child: Picture(
                              getAssetIcon("delete.svg"),
                            ),
                          )),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                          height: 50.h,
                          width: 50.h,
                          child: Padding(
                            padding: EdgeInsets.all(10.h),
                            child: Picture(
                              getAssetIcon("not_favorite.svg"),
                            ),
                          )),
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

class FreeShippingProgress extends StatelessWidget {
  final double currentAmount;
  final double requiredAmount;

  const FreeShippingProgress({
    super.key,
    required this.currentAmount,
    required this.requiredAmount,
  });

  @override
  Widget build(BuildContext context) {
    final double remaining = requiredAmount - currentAmount;
    final double progress = (currentAmount / requiredAmount).clamp(0.0, 1.0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text.rich(
          TextSpan(
            text: 'أنفق أكثر ',
            style: getBoldGreyD012Style(),
            children: [
              TextSpan(
                text: '${remaining.toInt()} جنيه ',
                style: getMediumPrimary16Style(),
              ),
              const TextSpan(
                text: 'للحصول على الشحن المجاني!',
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 10,
            backgroundColor: Colors.grey.shade300,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
          ),
        ),
      ],
    );
  }
}
