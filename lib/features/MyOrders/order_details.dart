import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shopyneer/config/navigation/nav.dart';
import 'package:shopyneer/core/widgets/dot_seperator.dart';
import 'package:shopyneer/core/widgets/picture.dart';
import 'package:shopyneer/shared/theme/colors.dart';
import 'package:shopyneer/shared/theme/styles_manager.dart';
import 'package:size_config/size_config.dart';

import '../../core/widgets/custom_app_bar.dart';

class OrderDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          GeneralAppBar(
            routeName: 'تفاصيل التتبع',
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Order ID
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'رقم الطلب:',
                        style: getBoldPrimary16Style(),
                        textDirection: TextDirection.rtl,
                      ),
                      Text(
                        '#753857853',
                        style: getBoldBlack16Style(),
                        textDirection: TextDirection.rtl,
                      ),
                    ],
                  ),
                  Divider(
                    height: 40.h,
                    color: greyFA,
                  ),
                  Gap(20.h),
                  // Cancellation status
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green[100],
                        ),
                        child: Icon(
                          Icons.done,
                          size: 40.sp,
                          color: Colors.green,
                        ),
                      ),
                      Gap(20.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'تم التأكيد في',
                            style: getBoldBlack16Style()
                                .copyWith(color: Colors.green),
                            textDirection: TextDirection.rtl,
                          ),
                          Gap(10.h),
                          Text(
                            '10 نوفمبر، 11:08 م',
                            style: getMediumGrey14Style(),
                            textDirection: TextDirection.rtl,
                          ),
                        ],
                      ),
                    ],
                  ),
                  DotSeparator(),
                  // Delivery Address
                  Row(
                    children: [
                      Text(
                        'عنوان التوصيل',
                        style: getBoldPrimary16Style(),
                        textDirection: TextDirection.rtl,
                      ),
                      Gap(10.w),
                      Text(
                        '(العمل)',
                        style: getBoldGreyD014Style(),
                        textDirection: TextDirection.rtl,
                      ),
                    ],
                  ),
                  Gap(20.h),
                  Text(
                    'Eslam Muhamed\nمحطة مترو ألف مسكن، مصر الجديدة، مصر',
                    style: getRegularBlack14Style(),
                    textDirection: TextDirection.rtl,
                  ),
                  Gap(20.h),
                  Text(
                    'تم التحقق: +20-11-53942488',
                    style:
                        getBoldPrimary12Style().copyWith(color: Colors.green),
                    textDirection: TextDirection.rtl,
                  ),
                  DotSeparator(),
                  Row(
                    children: [
                      Text(
                        'سلة الطلب',
                        style: getBoldPrimary16Style(),
                        textDirection: TextDirection.rtl,
                      ),
                    ],
                  ),
                  Gap(20.h),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                  DotSeparator(),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.h),
                        side: BorderSide(color: greyFA, width: 2)),
                    elevation: 0,
                    color: Colors.white,
                    shadowColor: Colors.black,
                    child: Padding(
                      padding: EdgeInsets.all(20.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          OrderDetailRow(
                            title: 'قيمة المنتجات (1 منتج)',
                            value: '129.00 ج.م',
                          ),
                          OrderDetailRow(
                            title: 'رسوم الشحن',
                            value: 'مجانا',
                            valueColor: Colors.green,
                          ),
                          OrderDetailRow(
                            title: 'رسوم الدفع عند الاستلام',
                            value: '9.00 ج.م',
                          ),
                          Divider(),
                          OrderDetailRow(
                            title: 'المجموع شامل الضريبة',
                            value: '138.00 ج.م',
                            isBold: true,
                          ),
                          OrderDetailRow(
                            title: 'مبلغ VAT المقدر',
                            value: '16.95 ج.م',
                          ),
                          SizedBox(height: 24),
                          Text(
                            'طريقة الدفع',
                            style: getBoldPrimary14Style(),
                          ),
                          SizedBox(height: 8),
                          PaymentMethodWidget(),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: greyFA,
                    height: 40.h,
                  ),
                  // Product details

                  SizedBox(height: 8),

                  // Help button
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OrderDetailRow extends StatelessWidget {
  final String title;
  final String value;
  final bool isBold;
  final Color valueColor;

  const OrderDetailRow({
    required this.title,
    required this.value,
    this.isBold = false,
    this.valueColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: getBoldBlack12Style(),
          ),
          Text(
            value,
            style: getRegularGrey14Style(),
          ),
        ],
      ),
    );
  }
}

class PaymentMethodWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.green[100],
            border: Border.all(color: Colors.green),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            'نقدي',
            style: getBoldBlack14Style().copyWith(color: Colors.green),
          ),
        ),
        SizedBox(width: 8),
        Text(
          'الدفع كاش عند الاستلام',
          style: getRegularGreen14Style(),
        ),
      ],
    );
  }
}
