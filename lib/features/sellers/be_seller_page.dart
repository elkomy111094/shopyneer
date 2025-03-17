import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shopyneer/core/widgets/custom_app_bar.dart';
import 'package:shopyneer/core/widgets/dot_seperator.dart';
import 'package:shopyneer/shared/theme/colors.dart';
import 'package:shopyneer/shared/theme/styles_manager.dart';
import 'package:size_config/size_config.dart';

class BeSellerPage extends StatelessWidget {
  const BeSellerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          GeneralAppBar(
            routeName: "بيع علي",
            subTitle: "شوبينير",
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Gap(20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "تسوّق أكثر من 150,000 ماركة",
                      style: getPrimaryBoldStyle20Style(),
                    ),
                  ],
                ),
                Gap(20.h),
                SizedBox(
                  height: 300.h, // Adjust based on item height
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, // Two rows
                            childAspectRatio: 2 / 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10

                            // Square items
                            ),
                    itemCount: 30,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: primary.withOpacity(.1)),
                          child: Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  100), // يجعل الصورة دائرية
                              child: Image.network(
                                "https://static.rfstat.com/renderforest/images/v2/landing-pics/logo_landing/Clothing/clothing_logo_5.png",
                                fit: BoxFit.cover, // غيّره حسب الحاجة
                                width: 100, // حجم الصورة
                                height: 100,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                DotSeparator(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "مالذي تبحث عنه ؟",
                      style: getPrimaryBoldStyle20Style(),
                    ),
                  ],
                ),
                Gap(30.h),
                SizedBox(
                  height: 300.h, // Adjust based on item height
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, // Two rows
                            childAspectRatio: 2 / 5,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 10

                            // Square items
                            ),
                    itemCount: 30,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 50.h,
                          height: 50.h,
                          decoration: BoxDecoration(
                              color: Color(0xffFFF1DB),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50.h),
                                  bottomRight: Radius.circular(50.h))),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  child: Padding(
                                    padding: const EdgeInsets.all(1.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          100), // يجعل الصورة دائرية
                                      child: Image.network(
                                        "https://static.rfstat.com/renderforest/images/v2/landing-pics/logo_landing/Clothing/clothing_logo_5.png",
                                        fit: BoxFit.cover, // غيّره حسب الحاجة
                                        width: 100, // حجم الصورة
                                        height: 100,
                                      ),
                                    ),
                                  ),
                                  radius: 35.h,
                                ),
                                Gap(10.w),
                                Expanded(
                                    child: Row(
                                  children: [
                                    Text(
                                      "أزياء أطفال",
                                      style: getBoldPrimary14Style(),
                                    )
                                  ],
                                ))
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
