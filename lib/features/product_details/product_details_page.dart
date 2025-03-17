import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:shopyneer/core/utils/get_asset_path.dart';
import 'package:shopyneer/core/widgets/dot_seperator.dart';
import 'package:shopyneer/core/widgets/elevated_button.dart';
import 'package:shopyneer/core/widgets/picture.dart';
import 'package:shopyneer/features/home/widgets/product_widget.dart';
import 'package:shopyneer/shared/theme/colors.dart';
import 'package:shopyneer/shared/theme/styles_manager.dart';
import 'package:size_config/size_config.dart';

import '../../core/widgets/custom_app_bar.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  final CarouselSliderController? _controller = CarouselSliderController();
  final ValueNotifier<int> _currentIndex = ValueNotifier<int>(0);
  final List<String> imageUrls = [
    "https://cdn.salla.sa/PeBV/b96bc934-ae63-4f88-8efb-727aa33fa7a2-1000x1000-iQQIPHC3ijP9WVn3pR0hnkPXO5M501PCukGb5ezR.png",
    "https://iraq.feel22.com/cdn/shop/files/lip012_1e449dc7-4851-41d6-ba48-a7ededb1133d.png?v=1716718709&width=600",
    "https://cdn.salla.sa/YgzOpR/yQE7Zlxhwp7bNFekKw8bIzSHQavrL2Uq8Hqa0nX1.png",
    "https://cdn.salla.sa/YgzOpR/Uvb1nbvOvv8vlVNDDe9v2jX7XhfK06SmuF3svqmu.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          GeneralAppBar(
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
                        Picture(
                          getAssetIcon("remain_in_stock.svg"),
                          width: 30.h,
                          height: 20.h,
                          color: primary,
                        ),
                        Gap(10.h),
                        Container(
                          decoration: BoxDecoration(
                            color: greyFA,
                            borderRadius: BorderRadius.circular(10.h),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 10.w),
                            child: Text(
                              "باقي 5 وحدات في المخزون",
                              style: getRegularGrey12Style()
                                  .copyWith(color: Colors.red),
                            ),
                          ),
                        ),
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
                    ProductImagesSlider(
                        controller: _controller,
                        currentIndex: _currentIndex,
                        imageUrls: imageUrls),
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
                    Gap(20.h),
                    Text(
                      "تفاصيل المنتج",
                      style: getPrimaryBoldStyle20Style(),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "تحتوي ماسكارا لاش برينسيس الأصلية على رأس فرشاة كبير وعريض يمنحك تأثيرات كثيفة للغاية مثل الرموش الصناعية! كما تمنح الفرشاة ذات الألياف مخروطية الشكل الرموش حجماً كبيراً وطولاً منحوتاً تماماً مثل الرموش الصناعية من دون أي متاعب. ",
                      style: getMediumGrey14Style(),
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
                          inside:
                              BorderSide(color: Colors.grey.shade300, width: 1),
                        ),
                        children: [
                          TableRow(
                            decoration: BoxDecoration(color: Color(0xFFF5F5F5)),
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'اللون',
                                  textAlign: TextAlign.right,
                                  style: getRegularPrimaryBold12Style(),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Nude',
                                  textAlign: TextAlign.left,
                                  style: getBoldBlack12Style(),
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
                                  style: getRegularPrimaryBold12Style(),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'المكياج',
                                  textAlign: TextAlign.left,
                                  style: getBoldBlack12Style(),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            decoration: BoxDecoration(color: Color(0xFFF5F5F5)),
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'اسم الموديل',
                                  textAlign: TextAlign.right,
                                  style: getRegularPrimaryBold12Style(),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'EBCBA',
                                  textAlign: TextAlign.left,
                                  style: getBoldBlack12Style(),
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
                                  style: getRegularPrimaryBold12Style(),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'شيجلتم',
                                  textAlign: TextAlign.left,
                                  style: getBoldBlack12Style(),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            decoration: BoxDecoration(color: Color(0xFFF5F5F5)),
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'كود المنتج',
                                  textAlign: TextAlign.right,
                                  style: getRegularPrimaryBold12Style(),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  '880001',
                                  textAlign: TextAlign.left,
                                  style: getBoldBlack12Style(),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Gap(20.h),
                    // Icons Row

                    DotSeparator(),
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
                    DotSeparator(),

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
                              style: getBoldPrimary18Style(),
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
                                    buildProductBundle("ماسكارا", "99.00 جنيه",
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
                    DotSeparator(),
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
                            style: getBoldPrimary14Style(),
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
                    DotSeparator(),
                    ProductRatingWidget(),

                    // Reviews Section
                    Text(
                      "تقييمات وآراء العملاء على المنتج",
                      style: getBoldBlack16Style(),
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
                      height: 70.h,
                      child: Row(
                        children: [
                          Container(
                            height: 70.h,
                            width: 100.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.h),
                                border: Border.all(color: greyD0)),
                            child: Center(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("الكميه", style: getBoldGreyD014Style()),
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
                    DotSeparator(),
                    Column(
                      children: [
                        Container(
                          height: 110.h,
                          color: primary.withOpacity(.05),
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
                          height: 430.h,
                          width: double.infinity,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                height: 250.h,
                                width: 200.w,
                                child: MainProductWidget(
                                  imgUrl:
                                      "https://www.hairtreats.net/wp-content/uploads/2021/02/53.jpg",
                                ),
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
                    DotSeparator(),
                    Column(
                      children: [
                        Container(
                          height: 110.h,
                          color: primary.withOpacity(.05),
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
                          height: 430.h,
                          width: double.infinity,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                height: 250.h,
                                width: 200.w,
                                child: MainProductWidget(
                                  imgUrl:
                                      "https://hips.hearstapps.com/hmg-prod/images/elm-070224-7675-facial-hair-removal-66aa8933345ff.jpg?crop=0.668xw:1.00xh;0.167xw,0&resize=640:*",
                                ),
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
                    DotSeparator(),
                    Column(
                      children: [
                        Container(
                          height: 110.h,
                          color: primary.withOpacity(.05),
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
                          height: 430.h,
                          width: double.infinity,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                height: 250.h,
                                width: 200.w,
                                child: MainProductWidget(
                                  imgUrl:
                                      "https://assets.myntassets.com/dpr_1.5,q_60,w_400,c_limit,fl_progressive/assets/images/21353360/2025/2/15/1e8d04a5-d080-4f0b-ae45-239b7607dbeb1739621442969-FACES-CANADA-Strobe-Your-Way-Strobe-Cream-with-Shea-Butter---1.jpg",
                                ),
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
            style: getBoldPrimary18Style(),
          ),
          Gap(10.h),
          Container(
            width: 30.w,
            height: 5.h,
            color: primary,
          ),
          Gap(10.h),
          const SizedBox(height: 8.0),
          Text(
            '(100) 4',
            style: getBoldBlack14Style(),
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
        Icon(icon, color: primary),
        const SizedBox(width: 8.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: getMediumPrimary16Style(),
              ),
              const SizedBox(height: 4.0),
              Text(
                description,
                style: getBoldGreyD014Style(),
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
            color: primary.withOpacity(.05),
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
        Text(name, style: getBoldBlack12Style()),
        Text(price, style: getBoldGreyD012Style()),
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
              Text(name, style: getBoldBlack12Style()),
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

class ProductImagesSlider extends StatelessWidget {
  const ProductImagesSlider({
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
              height: 300,
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
