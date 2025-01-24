import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:shopyneer/config/theme/colors.dart';
import 'package:shopyneer/config/theme/styles_manager.dart';
import 'package:shopyneer/core/utils/get_asset_path.dart';
import 'package:shopyneer/core/widgets/elevated_button.dart';
import 'package:shopyneer/core/widgets/picture.dart';
import 'package:shopyneer/features/home/widgets/product_widget.dart';
import 'package:size_config/size_config.dart';

import '../../core/widgets/custom_app_bar.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  final List<String> fakeUrls = [
    "https://cdn.salla.sa/PeBV/b96bc934-ae63-4f88-8efb-727aa33fa7a2-1000x1000-iQQIPHC3ijP9WVn3pR0hnkPXO5M501PCukGb5ezR.png",
    "https://iraq.feel22.com/cdn/shop/files/lip012_1e449dc7-4851-41d6-ba48-a7ededb1133d.png?v=1716718709&width=600",
    "https://cdn.salla.sa/YgzOpR/yQE7Zlxhwp7bNFekKw8bIzSHQavrL2Uq8Hqa0nX1.png",
    "https://cdn.salla.sa/YgzOpR/Uvb1nbvOvv8vlVNDDe9v2jX7XhfK06SmuF3svqmu.png",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            CustomAppBar(
              routeName: "تفاصيل",
              subTitle: "إسم المنتج",
              onBackPressed: () {
                Navigator.of(context).pop();
              },
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10.h),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "إسم المنتج",
                            style: getPrimaryBoldStyle20Style(),
                          )
                        ],
                      ),
                      Gap(10.h),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "نظارات شمسية غير منتظمة صغيرة مستطيلة حماية من الأشعة فوق البنفسجية - أسود",
                              style: getRegularBlack14Style(),
                            ),
                          )
                        ],
                      ),
                      Gap(20.h),
                      CarouselSlider(
                          items: fakeUrls
                              .map((url) => Card(
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.h),
                                        side: BorderSide(color: greyFA)),
                                    child: Container(
                                      height: 250,
                                      decoration: BoxDecoration(
                                          color: white,
                                          border: Border.all(color: greyFA)),
                                      child: Stack(
                                        fit: StackFit.expand,
                                        children: [
                                          Picture(
                                            url,
                                            fit: BoxFit.fill,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ))
                              .toList(),
                          options: CarouselOptions(
                            height: 300,
                            aspectRatio: 16 / 16,
                            viewportFraction: 1,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 3),
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            enlargeFactor: 0.3,
                            onPageChanged: null,
                            scrollDirection: Axis.horizontal,
                          )),
                      Gap(10.h),
                      Row(
                        children: [
                          Text(
                            "200 ج.م",
                            style: getPrimaryBoldStyle20Style(),
                          ),
                        ],
                      ),
                      Gap(10.h),
                      Row(
                        children: [
                          Picture(
                            getAssetIcon("remain_in_stock.svg"),
                            width: 30.h,
                            height: 20.h,
                            color: primary,
                          ),
                          Gap(10.h),
                          Text(
                            "باقي 5 وحدات في المخزون",
                            style: getRegularGrey12Style(),
                          )
                        ],
                      ),
                      Gap(10.h),
                      Row(
                        children: [
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
                          Gap(10.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "أحصل عليه خلال ",
                                    style: getRegularGrey12Style(),
                                  ),
                                  Text(
                                    " 24 ديسمبر",
                                    style: getBoldBlack14Style(),
                                  ),
                                ],
                              ),
                              Gap(10.h),
                              Text(
                                "إطلب خلال 17 ساعه و 28 دقيقه",
                                style: getRegularGrey12Style(),
                              ),
                            ],
                          )
                        ],
                      ),
                      Text(
                        "تفاصيل المنتج",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "تحتوي ماسكارا لاش برينسيس الأصلية على رأس فرشاة كبير وعريض يمنحك تأثيرات كثيفة للغاية مثل الرموش الصناعية! كما تمنح الفرشاة ذات الألياف مخروطية الشكل الرموش حجماً كبيراً وطولاً منحوتاً تماماً مثل الرموش الصناعية من دون أي متاعب. ",
                        style: TextStyle(fontSize: 14, height: 1.5),
                      ),
                      Gap(20.h),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Table(
                          columnWidths: const {
                            0: FlexColumnWidth(2),
                            1: FlexColumnWidth(3),
                          },
                          border: TableBorder.symmetric(
                            inside: BorderSide(
                                color: Colors.grey.shade300, width: 1),
                          ),
                          children: const [
                            TableRow(
                              decoration:
                                  BoxDecoration(color: Color(0xFFF5F5F5)),
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'اللون',
                                    textAlign: TextAlign.right,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Nude',
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'القسم',
                                    textAlign: TextAlign.right,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'المكياج',
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              decoration:
                                  BoxDecoration(color: Color(0xFFF5F5F5)),
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'اسم الموديل',
                                    textAlign: TextAlign.right,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'EBCBA',
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'الماركة',
                                    textAlign: TextAlign.right,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'شيجلتم',
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              decoration:
                                  BoxDecoration(color: Color(0xFFF5F5F5)),
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'كود المنتج',
                                    textAlign: TextAlign.right,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    '880001',
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'كود المنتج',
                                    textAlign: TextAlign.right,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    '880001',
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Gap(20.h),
                      // Icons Row

                      Divider(
                        color: greyD0,
                        thickness: 3,
                        height: 50.h,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buildIconWithLabel("cash_in_hand.svg", "توصيل مجاني"),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: Container(
                              height: 100.h,
                              width: 1.h,
                              color: greyD0,
                            ),
                          ),
                          buildIconWithLabel(
                              "secure_payment.svg", "عملية دفع آمنة"),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: Container(
                              height: 100.h,
                              width: 1.h,
                              color: greyD0,
                            ),
                          ),
                          buildIconWithLabel("fast_transit4.svg", "تواصل سريع"),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: Container(
                              height: 100.h,
                              width: 1.h,
                              color: greyD0,
                            ),
                          ),
                          buildIconWithLabel(
                              "safe_cardboard.svg", "تأمين ضد التلف"),
                        ],
                      ),
                      Divider(
                        color: greyD0,
                        thickness: 3,
                        height: 50.h,
                      ),

                      // Bundle Offers Section

                      Container(
                        color: greyFA,
                        child: Padding(
                          padding: EdgeInsets.all(10.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "يباع معها ",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 20.h),
                              Container(
                                color: white,
                                child: Padding(
                                  padding: EdgeInsets.all(20.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      buildProductBundle(
                                          "ماسكارا",
                                          "99.00 جنيه",
                                          "https://www.pngplay.com/wp-content/uploads/12/Mascara-PNG-HD-Free-File-Download.png"),
                                      Icon(Icons.add, color: Colors.grey),
                                      buildProductBundle(
                                          "مجموعة مكياج",
                                          "210.00 جنيه",
                                          "https://www.pngplay.com/wp-content/uploads/12/Mascara-PNG-HD-Free-File-Download.png"),
                                      Icon(Icons.add, color: Colors.grey),
                                      buildProductBundle(
                                          "مجموعة شفاه",
                                          "310.00 جنيه",
                                          "https://www.pngplay.com/wp-content/uploads/12/Mascara-PNG-HD-Free-File-Download.png"),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 16),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.h),
                                  border: Border.all(color: primary),
                                ),
                                child: Center(
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "شراء كل هذا مقابل 600.00 جنيه",
                                      style: getRegularPrimary14Style(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Gap(20.h),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF3F3F3),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Gap(20.h),
                            Text(
                              'تسوق آمن بياناتك محمية دائماً',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              textDirection: TextDirection.rtl,
                            ),
                            Gap(20.h),
                            Container(
                              height: 50.h,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Picture(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1hGV6XSh3L3eG2Jdp6oUFs0UglPcCfWvyCQ&s",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Gap(10.w),
                                  Expanded(
                                    child: Picture(
                                      "https://forexawy.com/wp-content/uploads/2024/06/PayPal-Logo.jpg.webp",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Gap(10.w),
                                  Expanded(
                                    child: Picture(
                                      "https://blog.twiintech.com/wp-content/uploads/2023/05/PAYO-5.jpg",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Gap(10.w),
                                  Expanded(
                                    child: Picture(
                                      "https://ahli.com/wp-content/uploads/2023/07/Mastercard-Word_Card-Front-1-1024x646.png",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Gap(10.w),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      ProductRatingWidget(),

                      // Reviews Section
                      Text(
                        "تقييمات وآراء العملاء على المنتج",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),

                      SizedBox(height: 8),
                      buildCustomerReview(
                        "محمد علي",
                        "رائع جدًا! المنتج ممتاز وقيمة مقابل السعر.",
                        5,
                        "assets/images/customer1.png",
                      ),
                      buildCustomerReview(
                        "هبة محمد",
                        "خدمة العملاء كانت ممتازة و المنتج رائع!",
                        4,
                        "assets/images/customer2.png",
                      ),
                      buildCustomerReview(
                        "أحمد كريم",
                        "المنتج جيد لكن كنت أتوقع جودة أفضل قليلاً.",
                        3,
                        "assets/images/customer3.png",
                      ),
                      Gap(30.h),
                      Container(
                        height: 50.h,
                        child: Row(
                          children: [
                            Container(
                              height: 50.h,
                              width: 50.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.h),
                                  border: Border.all(color: greyD0)),
                              child: Center(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("الكميه"),
                                  Gap(5.h),
                                  Text(
                                    "10",
                                    style: getBoldPrimary16Style(),
                                  ),
                                ],
                              )),
                            ),
                            Gap(10.w),
                            Expanded(
                              child: CustomElevatedButton(
                                condition: true,
                                onTap: () {},
                                buttonColor: Colors.black,
                                buttonName: "أضف الي العربه",
                                buttonIcon: Icon(
                                  Icons.add_shopping_cart,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(30.h),
                      Column(
                        children: [
                          Container(
                            height: 110.h,
                            color: primary.withOpacity(.1),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "منتجات",
                                    style: getBoldBlack20Style(),
                                  ),
                                  Text(
                                    " مشابهه ",
                                    style: getBoldPrimary19Style(),
                                  ),
                                ],
                              ),
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
                      Gap(30.h),
                      Column(
                        children: [
                          Container(
                            height: 110.h,
                            color: primary.withOpacity(.1),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "منتجات",
                                    style: getBoldBlack20Style(),
                                  ),
                                  Text(
                                    " الناس شافوها ",
                                    style: getBoldPrimary19Style(),
                                  ),
                                ],
                              ),
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
                      Gap(30.h),
                      Column(
                        children: [
                          Container(
                            height: 110.h,
                            color: primary.withOpacity(.1),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "منتجات",
                                    style: getBoldBlack20Style(),
                                  ),
                                  Text(
                                    " شوفتها قبل كدا ",
                                    style: getBoldPrimary19Style(),
                                  ),
                                ],
                              ),
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
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductRatingWidget extends StatelessWidget {
  const ProductRatingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            'تقييمات المنتج',
            style: getBoldBlack16Style(),
          ),
          Gap(10.h),
          Container(
            width: 30.w,
            height: 5.h,
            color: primary,
          ),
          Gap(10.h),
          const SizedBox(height: 8.0),
          const Text(
            '(100) 4',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8.0),
          RatingBarIndicator(
            rating: 4.0,
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Color(0xFFFBC02D),
            ),
            itemCount: 5,
            itemSize: 30.0,
            unratedColor: Colors.grey.shade300,
          ),
          const SizedBox(height: 16.0),
          _buildRatingRow(5, 50),
          _buildRatingRow(4, 10),
          _buildRatingRow(3, 15),
          _buildRatingRow(2, 10),
          _buildRatingRow(1, 15),
          Gap(30.h),
          _buildInfoSection(
            icon: Icons.star_border,
            title: 'إزاي أقيم المنتج ده؟',
            description:
                'لو اشتريت منتج من شوبيبر، ممكن تدخل على "الطلبات" وتعدين تدوس على "تقييم تقييم".',
          ),
          const SizedBox(height: 16.0),
          _buildInfoSection(
            icon: Icons.format_list_bulleted,
            title: 'إزاي بتتحسب التقييمات؟',
            description:
                'التقييمات من عملاء شوبيبر الذين اشتروا المنتج وكتبوا تقييم.',
          ),
        ],
      ),
    );
  }

  Widget _buildRatingRow(int starCount, int percentage) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              starCount.toString(),
              style: const TextStyle(fontSize: 14),
            ),
            const Icon(
              Icons.star,
              size: 16,
              color: Color(0xFFFBC02D),
            ),
          ],
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            height: 8.0,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: percentage / 100,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFBC02D),
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
            ),
          ),
        ),
        Text(
          '$percentage',
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildInfoSection(
      {required IconData icon,
      required String title,
      required String description}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Color(0xFF8B1E3F)),
        const SizedBox(width: 8.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF8B1E3F),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                description,
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Widget buildIconWithLabel(String icon, String label) {
  return Column(
    children: [
      Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.h),
            color: primary.withOpacity(.2),
          ),
          child: Padding(
            padding: EdgeInsets.all(10.h),
            child: Picture(
              getAssetIcon(icon),
              width: 40.h,
              height: 40.h,
              color: primary,
            ),
          )),
      SizedBox(height: 10),
      Text(
        label,
        textAlign: TextAlign.center,
        style: getBoldBlack12Style(),
      ),
    ],
  );
}

Widget buildProductBundle(String name, String price, String image) {
  return GestureDetector(
    child: Column(
      children: [
        Picture(
          image,
          width: 60.h,
          height: 60.h,
        ),
        SizedBox(height: 4),
        Text(name, style: TextStyle(fontSize: 14)),
        Text(price,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      ],
    ),
  );
}

Widget buildCustomerReview(
    String name, String review, int stars, String avatar) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 24,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Picture(
              "https://images.ctfassets.net/lh3zuq09vnm2/yBDals8aU8RWtb0xLnPkI/19b391bda8f43e16e64d40b55561e5cd/How_tracking_user_behavior_on_your_website_can_improve_customer_experience.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: List.generate(
                  stars,
                  (index) => Icon(Icons.star, size: 16, color: Colors.amber),
                ),
              ),
              Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text(
                review,
                style: getRegularGrey12Style(),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
