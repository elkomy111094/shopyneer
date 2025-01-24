import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:gap/gap.dart';
import 'package:shopyneer/config/theme/colors.dart';
import 'package:shopyneer/config/theme/styles_manager.dart';
import 'package:shopyneer/features/MyOrders/Widgets/order_widget.dart';
import 'package:size_config/size_config.dart';

import '../../core/widgets/custom_app_bar.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBar(
              routeName: "طلبياتي",
              onBackPressed: () {
                Navigator.of(context).pop();
              },
            ),
            Gap(20.h),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: buildOrdersInfo(
                        "قيمة الطلبيات", Icons.monetization_on_outlined,
                        subTitle: "15000 ج.م"),
                  ),
                  Gap(20.w),
                  Expanded(
                    child: buildOrdersInfo("عدد الطلبيات ", Icons.numbers,
                        subTitle: "220"),
                  ),
                ],
              ),
            ),
            Gap(20.h),
            Expanded(
              child: AnimationLimiter(
                child: ListView.separated(
                  itemCount: 10,
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    vertical: 5.h,
                    horizontal: 20.w,
                  ),
                  itemBuilder: (context, index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 500),
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child: OrderWidget(),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Gap(24.h);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOrdersInfo(String title, IconData icon,
      {String? subTitle, void Function()? onTap}) {
    return Card(
      shadowColor: Colors.black,
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.h)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h),
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
      ),
    );
  }
}
