import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shopyneer/config/navigation/nav.dart';
import 'package:shopyneer/config/theme/colors.dart';
import 'package:shopyneer/config/theme/styles_manager.dart';
import 'package:shopyneer/core/widgets/picture.dart';
import 'package:size_config/size_config.dart';

import '../../core/widgets/custom_app_bar.dart';

class OrderDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBar(
              routeName: 'تفاصيل التتبع',
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Order ID
                    Text(
                      'رقم الطلب: NEGGBO073582238 #',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      textDirection: TextDirection.rtl,
                    ),
                    Divider(
                      height: 20.h,
                      color: greyFA,
                    ),
                    Gap(20.h),
                    // Cancellation status
                    Row(
                      children: [
                        Icon(
                          Icons.cancel,
                          size: 40.sp,
                          color: Colors.red,
                        ),
                        Gap(20.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'تم الإلغاء في',
                              style: TextStyle(fontSize: 16),
                              textDirection: TextDirection.rtl,
                            ),
                            Text(
                              '10 نوفمبر، 11:08 م',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey[600]),
                              textDirection: TextDirection.rtl,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(
                      color: greyFA,
                      height: 40.h,
                    ),
                    // Delivery Address
                    Row(
                      children: [
                        Text(
                          'عنوان التوصيل',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                          textDirection: TextDirection.rtl,
                        ),
                        Gap(10.w),
                        Text(
                          '(العمل)',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: greyD0),
                          textDirection: TextDirection.rtl,
                        ),
                      ],
                    ),
                    Gap(20.h),
                    Text(
                      'Eslam Muhamed\nمحطة مترو ألف مسكن، مصر الجديدة، مصر',
                      style: TextStyle(fontSize: 16),
                      textDirection: TextDirection.rtl,
                    ),
                    Text(
                      'تم التحقق: +20-11-53942488',
                      style: TextStyle(fontSize: 16, color: Colors.green),
                      textDirection: TextDirection.rtl,
                    ),
                    Gap(20.h),
                    Container(
                      height: 50.h,
                      color: greyFA,
                      child: Row(
                        children: [
                          Text(
                            'سلة الطلب',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            textDirection: TextDirection.rtl,
                          ),
                        ],
                      ),
                    ),
                    Gap(20.h),
                    Container(
                      height: 240.h,
                      child: ListView.separated(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.all(10.h),
                              child: GestureDetector(
                                onTap: () {
                                  Nav.productDetailsPage(context);
                                },
                                child: Card(
                                  elevation: 4,
                                  shadowColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.h)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        ClipRRect(
                                          child: SizedBox(
                                            width: 80.h,
                                            height: 120.h,
                                            child: Picture(
                                              "https://freepngimg.com/save/166135-product-cosmetics-png-file-hd/1199x800",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Gap(10.h),
                                        Text(
                                          "ماسكرا",
                                          style: getBoldBlack16Style(),
                                        ),
                                        Divider(),
                                        Text(
                                          "500 ج.م",
                                          style: getRegularPrimary14Style(),
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
                    Divider(
                      color: greyFA,
                      height: 40.h,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero),
                      elevation: 10,
                      shadowColor: Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
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
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
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
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[800],
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: valueColor,
            ),
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
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(width: 8),
        Text(
          'الدفع كاش عند الاستلام',
          style: TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
