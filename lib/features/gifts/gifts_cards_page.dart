import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shopyneer/config/navigation/nav.dart';
import 'package:shopyneer/core/utils/get_asset_path.dart';
import 'package:shopyneer/core/widgets/dot_seperator.dart';
import 'package:shopyneer/core/widgets/elevated_button.dart';
import 'package:shopyneer/core/widgets/picture.dart';
import 'package:shopyneer/shared/theme/colors.dart';
import 'package:shopyneer/shared/theme/styles_manager.dart';
import 'package:size_config/size_config.dart';

import '../home/widgets/animated_search_field.dart';

class GiftCardsPage extends StatelessWidget {
  const GiftCardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Banner Image
            Container(
              width: double.infinity,
              height: 150.h,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                colors: [Color(0xffffffff), Color(0xffF5B0CE)],
              )),
              child: Padding(
                padding: EdgeInsets.all(20.h),
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "بطاقات هدايا شوبينير",
                            style: getBoldPrimary19Style(),
                          ),
                          Gap(10.h),
                          Text(
                            "تقدر تستخدمها على كل خدمات شوبينير",
                            style: getBoldBlack12Style(),
                          ),
                        ],
                      ),
                      Picture(
                        getAssetImage("gift1.png"),
                        width: 120.h,
                        height: 120.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Filter Tabs

            const SizedBox(height: 16),

            // Search Field
            Center(
              child: AnimatedSearchField(
                onSubmit: (val) {},
                hint: "دوري بالفئه المناسبه",
              ),
            ),
            Gap(20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: primary, width: 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.h)),
                    ),
                    onPressed: () {
                      // TODO: Handle button action
                    },
                    icon:
                        Icon(Icons.card_giftcard_outlined, color: Colors.black),
                    label: Text(
                      'استبدل بطاقة هدية',
                      style: getBoldPrimary10Style(),
                    ),
                  ),
                ),
                Gap(10.w),
                Expanded(
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: primary, width: 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.h)),
                    ),
                    onPressed: () {
                      // TODO: Handle button action
                    },
                    icon:
                        Icon(Icons.card_giftcard_outlined, color: Colors.black),
                    label: Text(
                      'شوف الطلبات السابقه',
                      style: getBoldPrimary10Style(),
                    ),
                  ),
                ),
              ],
            ),
            DotSeparator(),
            // Categories Grid
            _buildCategoryGrid(),

            const SizedBox(height: 24),

            // Exchange Gift Card Banner
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.pinkAccent, Colors.purpleAccent],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Picture(
                    getAssetImage("gift2.png"),
                    width: 100.h,
                    height: 100.h,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "دوس هنا تستبدل بطاقة هدية",
                          style: getBoldPrimary12Style()
                              .copyWith(color: Colors.white),
                        ),
                        const SizedBox(height: 10),
                        CustomElevatedButton(
                            onTap: () {}, buttonName: "إستفيد برصيدك")
                      ],
                    ),
                  ),
                  Picture(
                    getAssetImage("gift2.png"),
                    width: 100.h,
                    height: 100.h,
                  ),
                ],
              ),
            ),

            DotSeparator(),

            // FAQ Section
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'الأسئلة الشائعة',
                style: getMediumPrimary16Style(),
              ),
            ),
            const SizedBox(height: 10),
            _buildFaqItem("ماهي بطاقة هدية shopneer؟"),
            _buildFaqItem("كيف يتم استلام بطاقة هدية Shopneer؟"),
            _buildFaqItem("هل مدة صلاحية بطاقة الهدية محددة؟"),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryGrid() {
    final categories = [
      {
        "title": "عيد ميلاد",
        "imageUrl":
            "https://www.greatbags.com/cdn/shop/products/e38bd83af578077b65a31424bd24d085_800x.png?v=1593313918"
      },
      {
        "title": "هدايا نسائية",
        "imageUrl":
            "https://www.greatbags.com/cdn/shop/products/e38bd83af578077b65a31424bd24d085_800x.png?v=1593313918"
      },
      {
        "title": "الزواج",
        "imageUrl":
            "https://www.greatbags.com/cdn/shop/products/e38bd83af578077b65a31424bd24d085_800x.png?v=1593313918"
      },
      {
        "title": "تقدير وشكر",
        "imageUrl":
            "https://www.greatbags.com/cdn/shop/products/e38bd83af578077b65a31424bd24d085_800x.png?v=1593313918"
      },
      {
        "title": "أى مناسبة",
        "imageUrl":
            "https://www.greatbags.com/cdn/shop/products/e38bd83af578077b65a31424bd24d085_800x.png?v=1593313918"
      },
      {
        "title": "عيد الأم",
        "imageUrl":
            "https://www.greatbags.com/cdn/shop/products/e38bd83af578077b65a31424bd24d085_800x.png?v=1593313918"
      },
    ];

    return Container(
      height: 300.h,
      child: GridView.builder(
        itemCount: categories.length,
        shrinkWrap: false,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.9,
        ),
        itemBuilder: (context, index) {
          final item = categories[index];
          return GestureDetector(
            onTap: () {
              Nav.giftDetailsPage(context);
            },
            child: Card(
              color: Color(0xffFDEBF0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Picture(
                    getAssetImage("shopyneer_gift.png"),
                    height: 100.h,
                    width: 100.h,
                  ),
                  Text(
                    item["title"]!,
                    style: getBoldBlack12Style(),
                  ),
                  Gap(10.h),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFaqItem(String question) {
    return ExpansionTile(
      title: Text(
        question,
        style: getBoldBlack14Style(),
      ),
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Text(
            "سيتم إدراج الإجابة هنا بالتفصيل...",
            style: getRegularGrey14Style(),
          ),
        ),
      ],
    );
  }
}
