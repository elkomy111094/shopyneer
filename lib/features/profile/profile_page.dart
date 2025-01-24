import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:shopyneer/config/theme/colors.dart';
import 'package:shopyneer/config/theme/styles_manager.dart';
import 'package:shopyneer/core/widgets/elevated_button.dart';
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
      backgroundColor: greyFA, // Light background color

      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: greyFA,
            ),
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
                        CircleAvatar(
                          radius: 25.h,
                          child: Text("EM"), // User initials
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'أهلاً إسلام',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Gap(5.h),
                              Text(
                                'elkomy.dev@gmail.com',
                                style:
                                    TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Nav.editProfilePage(context);
                          },
                          child: Text('تعديل'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    GridView(
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
                        _buildProfileTile(
                            'المرتجعات',
                            subTitle: "0 قيد المراجعه",
                            Icons.history),
                        _buildProfileTile(
                            'المفضلة',
                            subTitle: "0 منتجات",
                            Icons.favorite, onTap: () {
                          Nav.favoritesPage(context);
                        }),
                        _buildProfileTile(
                            'رصيد شوبينير',
                            subTitle: "0.00  ج.م",
                            Icons.wallet),
                      ],
                    ),
                    Gap(20.h),

                    Container(
                      decoration: BoxDecoration(color: Colors.white),
                      child: Column(
                        children: [
                          /* _buildListTile('شاهدته مؤخرا', Icons.remove_red_eye_outlined),*/
                          _buildListTile('العناوين', Icons.location_on,
                              ontap: () {
                            Nav.addressesPage(context);
                          }),
                          _buildListTile('الدفع', Icons.payment, ontap: () {
                            Nav.paymentMethodsPage(context);
                          }),
                          _buildListTile('طلبات الضمان', Icons.security),
                          _buildListTile('QR كود', Icons.qr_code),
                          _buildListTile('عن التطبيق', Icons.info_outline,
                              ontap: () async {
                            await launch(
                                "https://shopyneer.com/pages/about-us");
                          }),
                          _buildListTile('خدمة العملاء', Icons.support,
                              ontap: () async {
                            Nav.techSupportPage(context: context);
                          }),
                          _buildListTile('الأسئله الشائعه', Icons.question_mark,
                              ontap: () async {
                            await launch("https://shopyneer.com/pages/faqs");
                          }),
                          _buildListTile('التنبيهات', Icons.notifications,
                              ontap: () {
                            Nav.notificationPage(context);
                          }),
                        ],
                      ),
                    ),

                    SizedBox(height: 10),

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
                    SizedBox(height: 20),

                    // Logout Button
                    CustomElevatedButton(
                      condition: true,
                      buttonColor: Colors.black,
                      buttonIcon: Icon(
                        Icons.logout,
                        color: white,
                      ),
                      onTap: () {},
                      width: 400.w,
                      buttonName: "تسجيل الخروج",
                    ),
                    SizedBox(height: 20),
                    _buildListTile('سياسة الخصوصيه', Icons.security,
                        ontap: () async {
                      await launch(
                          "https://shopyneer.com/policies/privacy-policy");
                    }),
                    _buildListTile('الشروط والأحكام', Icons.file_copy,
                        ontap: () async {
                      await launch(
                          "https://shopyneer.com/policies/terms-of-service");
                    }),
                    _buildListTile('سياسة الشحن', Icons.delivery_dining,
                        ontap: () async {
                      await launch(
                          "https://shopyneer.com/policies/shipping-policy");
                    }),
                    _buildListTile('سياسة الإسترجاع', Icons.keyboard_return,
                        ontap: () async {
                      await launch(
                          "https://shopyneer.com/policies/refund-policy");
                    }),

                    SizedBox(height: 20),

                    // Footer Section
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
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
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
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Card(
        elevation: 10,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.h)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.h),
          child: ListTile(
            leading: Icon(icon, color: primary),
            title: Text(title),
            trailing: Icon(Icons.chevron_right),
            onTap: ontap,
          ),
        ),
      ),
    );
  }
}
