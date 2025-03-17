import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shopyneer/core/widgets/custom_app_bar.dart';
import 'package:shopyneer/core/widgets/dot_seperator.dart';
import 'package:shopyneer/core/widgets/elevated_button.dart';
import 'package:shopyneer/shared/theme/styles_manager.dart';
import 'package:size_config/size_config.dart';

import '../../config/navigation/nav.dart';
import '../../core/widgets/picture.dart';
import '../../shared/theme/colors.dart';

class OrderTrackingTimeline extends StatelessWidget {
  final List<TrackingStep> steps = [
    TrackingStep(
      title: 'استلمنا الطلب',
      date: '25 يناير',
      isCompleted: true,
    ),
    TrackingStep(
      title: 'قيد التنفيذ',
      date: '25 يناير',
      isCompleted: true,
    ),
    TrackingStep(
      title: 'خرج من المخزن',
      date: '25 يناير',
      subtitle: 'جاري الإعداد للشحن',
      isCompleted: true,
    ),
    TrackingStep(
      title: 'تم الإرسال',
      date: '',
      isCompleted: false,
    ),
    TrackingStep(
      title: 'التسليم يوم الثلاثاء',
      date: '28 يناير',
      isCompleted: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GeneralAppBar(routeName: "تتبع الطلب"),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20.w),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20.h),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10.h),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("كود الأوردر: ", style: getBoldBlack12Style()),
                        Text("#7465784365", style: getBoldGreyD012Style()),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8F8F8),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: List.generate(steps.length, (index) {
                      final step = steps[index];
                      final isLast = index == steps.length - 1;
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              CircleAvatar(
                                radius: 10,
                                backgroundColor: step.isCompleted
                                    ? Colors.green
                                    : Colors.grey.shade300,
                                child: Icon(
                                  step.isCompleted ? Icons.check : Icons.circle,
                                  size: 12,
                                  color: step.isCompleted
                                      ? Colors.white
                                      : Colors.grey.shade500,
                                ),
                              ),
                              if (!isLast)
                                Container(
                                  width: 2,
                                  height: 50,
                                  color: step.isCompleted
                                      ? Colors.green
                                      : Colors.grey.shade300,
                                ),
                            ],
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${step.title} ${step.date.isNotEmpty ? '(${step.date})' : ''}',
                                  style: step.isCompleted
                                      ? getBoldBlack12Style()
                                          .copyWith(color: Colors.green)
                                      : getRegularGrey12Style(),
                                ),
                                if (step.subtitle != null)
                                  Text(
                                    step.subtitle!,
                                    style: getRegularGrey12Style(),
                                  ),
                                const SizedBox(height: 16),
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ),
                DotSeparator(),
                OrderSummaryWidget(),
                DotSeparator(),
                _buildOrderSummary(),
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class TrackingStep {
  final String title;
  final String date;
  final String? subtitle;
  final bool isCompleted;

  TrackingStep({
    required this.title,
    required this.date,
    this.subtitle,
    this.isCompleted = false,
  });
}

Widget _buildOrderSummary() {
  return Card(
    elevation: 0,
    color: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    margin: const EdgeInsets.only(top: 8),
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "شحنة رقم 1 من 1 (1 منتج)",
                style: getBoldGreyD014Style(),
              ),
            ],
          ),
          const Divider(
            height: 20,
            color: greyFA,
            thickness: 3,
          ),
          Container(
            height: 240.h,
            child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () {
                        Nav.productDetailsPage(context);
                      },
                      child: Card(
                        elevation: 0,
                        shadowColor: Colors.black,
                        color: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.h),
                            side: BorderSide(color: greyFA)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipRRect(
                                child: SizedBox(
                                  width: 80.h,
                                  height: 100.h,
                                  child: Picture(
                                    "https://freepngimg.com/save/166135-product-cosmetics-png-file-hd/1199x800",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Gap(10.h),
                              Text(
                                "ماسكرا",
                                style: getRegularBlack14Style(),
                              ),
                              Text(
                                " ( 2 وحده ) ",
                                style: getRegularGrey12Style(),
                              ),
                              Text(
                                "500 ج.م",
                                style: getBoldPrimary12Style(),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Gap(10.w);
                },
                itemCount: 10),
          ),
        ],
      ),
    ),
  );
}

class OrderSummaryWidget extends StatelessWidget {
  final String orderCode = "12345589";
  final String userName = "Hager Mansor";
  final String address =
      "فيلا 1000 - الحي الأول - شرق النيل - قسم بني سويف - محافظة بني سويف";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Order Code

        const SizedBox(height: 16),

        // Address Card
        Card(
          elevation: 0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.h),
              side: BorderSide(color: greyFA)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "عنوان التوصيل (المنزل)",
                  style: getMediumPrimary16Style(),
                ),
                const SizedBox(height: 4),
                Text(
                  userName,
                  style: getBoldGreyD014Style(),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(Icons.location_on, color: Colors.pink),
                    Gap(20.w),
                    Expanded(
                      child: Text(
                        address,
                        textAlign: TextAlign.start,
                        style: getRegularGrey14Style(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Update Address Button

                CustomElevatedButton(
                    onTap: () {},
                    buttonColor: Colors.black,
                    buttonName: "تحديث العنوان")
              ],
            ),
          ),
        ),
      ],
    );
  }
}
