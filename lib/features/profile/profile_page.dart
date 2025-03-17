import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:shopyneer/core/widgets/dot_seperator.dart';
import 'package:shopyneer/core/widgets/elevated_button.dart';
import 'package:shopyneer/shared/theme/colors.dart';
import 'package:shopyneer/shared/theme/styles_manager.dart';
import 'package:size_config/size_config.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../config/navigation/nav.dart';

class ProfilePage extends StatelessWidget {
  Future<void> launchURL(String url) async {
    // Check if the URL can be launched
    if (await canLaunch(url)) {
      // Launch the URL
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(color: white),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 30.h,
                    ),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: primary.withOpacity(.1),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10.h),
                            child: CircleAvatar(
                              radius: 25.h,
                              backgroundColor: primary,
                              child: Text("EM",
                                  style:
                                      getVBoldWhite14Style()), // User initials
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'أهلاً',
                                    style: getBoldBlack12Style(),
                                  ),
                                  Gap(5.w),
                                  Text(
                                    'إسلام',
                                    style: getBoldPrimary16Style(),
                                  ),
                                ],
                              ),
                              Gap(5.h),
                              Text(
                                'elkomy.dev@gmail.com',
                                style: getRegularGrey12Style(),
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Nav.editProfilePage(context);
                          },
                          child: Text('تعديل', style: getBoldPrimary16Style()),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: SingleChildScrollView(
                padding: EdgeInsets.zero,
                child: Column(
                  children: [
                    GridView(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2.5,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                      children: [
                        _buildProfileTile('الطلبات', subTitle: "إداره وتتبع",
                            onTap: () {
                          Nav.ordersPage(context: context);
                        }, Icons.shopping_cart),
                        _buildProfileTile('المرتجعات',
                            subTitle: "0 قيد المراجعه", onTap: () {
                          Nav.returnsPage(context: context);
                        }, Icons.history),
                        _buildProfileTile(
                            'المفضلة',
                            subTitle: "0 منتجات",
                            Icons.favorite, onTap: () {
                          Nav.favoritesPage(context);
                        }),
                        _buildProfileTile(
                            'العناوين', Icons.location_on_outlined, onTap: () {
                          Nav.addressesPage(context);
                        }),
                      ],
                    ),
                    DotSeparator(),

                    Container(
                      decoration: BoxDecoration(color: Colors.white),
                      child: Column(
                        children: [
                          /* _buildListTile('شاهدته مؤخرا', Icons.remove_red_eye_outlined),*/

                          _buildListTile('عن التطبيق', Icons.info_outline,
                              ontap: () async {
                            Nav.aboutAppPage(context);
                          }),
                          _buildListTile('خدمة العملاء', Icons.support,
                              ontap: () async {
                            Nav.techSupportPage(context: context);
                          }),
                          _buildListTile('الأسئله الشائعه', Icons.question_mark,
                              ontap: () async {
                            Nav.commonQuestionsPage(context);
                          }),
                          _buildListTile('التنبيهات', Icons.notifications,
                              ontap: () {
                            Nav.notificationPage(context);
                          }),
                        ],
                      ),
                    ),

                    // Settings Section
                    /*         _buildSectionHeader('الإعدادات'),
                    Container(
                      decoration: BoxDecoration(color: Colors.white),
                      child: Column(
                        children: [
                          _buildListTile('البلد', Icons.public),
                          _buildListTile('اللغة', Icons.language),
                          _buildListTile('إعدادات الأمان', Icons.security),

                        ],
                      ),
                    ),
              */

                    _buildListTile('سياسة الخصوصيه', Icons.security,
                        ontap: () async {
                      Nav.privacyPolicyPage(context: context);
                    }),
                    _buildListTile('الشروط والأحكام', Icons.file_copy,
                        ontap: () async {
                      Nav.termsAndConditionPage(context: context);
                    }),
                    _buildListTile('سياسة الشحن', Icons.delivery_dining,
                        ontap: () async {
                      Nav.shippingPolicyPage(context: context);
                    }),
                    _buildListTile('سياسة الإسترجاع', Icons.keyboard_return,
                        ontap: () async {
                      Nav.returnPolicyPage(context: context);
                    }),

                    _buildListTile('بيع علي شوبينير', Icons.money,
                        ontap: () async {
                      Nav.beSellerPage(context);
                    }),

                    Gap(10.h),
                    CustomElevatedButton(
                      condition: true,
                      buttonColor: Colors.red,
                      buttonIcon: Icon(
                        Icons.logout,
                        color: white,
                      ),
                      onTap: () {},
                      width: 400.w,
                      buttonName: "تسجيل الخروج",
                    ),
                    DotSeparator(),

                    Column(
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text('تواصل معنا',
                              style: getPrimaryBoldStyle20Style()),
                        ),
                        Gap(20.h),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                icon: Icon(Icons.facebook),
                                color: Colors.black,
                                onPressed: () async {
                                  await launch(
                                      "https://www.facebook.com/shopyneer");
                                },
                              ),
                              IconButton(
                                icon: Icon(FontAwesomeIcons.twitter),
                                color: Colors.black,
                                onPressed: () async {
                                  await launch("https://x.com/shopyneer");
                                },
                              ),
                              IconButton(
                                icon: Icon(FontAwesomeIcons.instagram),
                                color: Colors.black,
                                onPressed: () async {
                                  await launch(
                                      "https://www.instagram.com/shopyneer/");
                                },
                              ),
                              IconButton(
                                icon: Icon(FontAwesomeIcons.youtube),
                                color: Colors.black,
                                onPressed: () async {
                                  await launch(
                                      "https://www.youtube.com/@Shopyneer");
                                },
                              ),
                            ],
                          ),
                        ),
                        Gap(30.h),
                        Text(
                          "الإصدار رقم (V:1.0)",
                          style: getBoldGreyD014Style(),
                        ),
                        Gap(10.h),
                        Text(
                          "© 2025 [شوبينير].",
                          style: getBoldGreyD014Style(),
                        ),
                        Gap(30.h),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

      // Bottom Navigation Bar
    );
  }

  Widget _buildProfileTile(String title, IconData icon,
      {String? subTitle, void Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: primary.withOpacity(.1)),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.h),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, color: primary),
            Gap(10.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: getBoldBlack14Style(),
                ),
                Gap(5.h),
                subTitle != null
                    ? Text(
                        subTitle,
                        style: getRegularGrey12Style(),
                      )
                    : SizedBox(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(String title, IconData icon, {void Function()? ontap}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Card(
        elevation: 0,
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.h),
            side: BorderSide(color: primary.withOpacity(.1))),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.h),
          child: ListTile(
            leading: Icon(icon, color: primary),
            title: Text(title, style: getBoldBlack12Style()),
            trailing: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: primary.withOpacity(.1)),
              child: Padding(
                padding: EdgeInsets.all(10.h),
                child: Icon(
                  Icons.chevron_right,
                  color: primary,
                ),
              ),
            ),
            onTap: ontap,
          ),
        ),
      ),
    );
  }
}
