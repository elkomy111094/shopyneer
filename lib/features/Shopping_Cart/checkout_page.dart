import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shopyneer/core/widgets/custom_app_bar.dart';
import 'package:shopyneer/core/widgets/dot_seperator.dart';
import 'package:shopyneer/core/widgets/elevated_button.dart';
import 'package:size_config/size_config.dart';

import '../../config/navigation/nav.dart';
import '../../core/widgets/picture.dart';
import '../../shared/theme/colors.dart';
import '../../shared/theme/styles_manager.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          GeneralAppBar(
            routeName: 'تأكيد الطلب',
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Shipping Address Section
                  _buildSectionTitle("عنوان الشحن"),
                  _buildShippingAddress(),

                  DotSeparator(),
                  _buildSectionTitle("أوردرك"),
                  _buildOrderSummary(),

                  DotSeparator(),
                  _buildSectionTitle("الدفع"),

                  _buildPaymentOptions(),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.h),
            child: CustomElevatedButton(
              condition: true,
              onTap: () {
                showSuccessDialog(context);
              },
              buttonColor: Colors.black,
              buttonName: "تأكيد الأوردر",
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: getBoldPrimary16Style(),
    );
  }

  Widget _buildShippingAddress() {
    return Card(
      color: Colors.white,
      elevation: 0,
      margin: const EdgeInsets.only(top: 8),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: greyFA)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                    text: TextSpan(children: [
                  TextSpan(text: "العنوان", style: getBoldBlack14Style()),
                  TextSpan(text: "  (المنزل) ", style: getRegularGrey14Style()),
                ])),
                Gap(100.w),
                Expanded(
                  child: CustomElevatedButton(
                      onTap: () {}, buttonName: "عنوان الإستلام"),
                ),
              ],
            ),
            Gap(20.h),
            Text(
              'التسليم إلى:',
              style: getBoldBlack14Style(),
            ),
            Gap(10.h),
            Text(
              'فيلا 1000 - الحي الثاني - باقي النيل - قسم بني سويف - محافظة بني سويف',
              style: getBoldGreyD012Style(),
            ),
            Row(
              children: [
                Checkbox(value: false, onChanged: null),
                Text(
                  "تسليم عند الباب",
                  style: getRegularBlack14Style(),
                ),
              ],
            )
          ],
        ),
      ),
    );
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

  Widget _buildPaymentOptions() {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: greyFA)),
      margin: const EdgeInsets.only(top: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            _buildPaymentMethodTile(
              selected: true,
              icon: Icons.credit_card,
              title: "بطاقة الائتمان",
              subtitle: "****1234",
              actionText: "تغيير",
            ),
            const Divider(
              color: greyFA,
            ),
            _buildPaymentMethodTile(
              selected: false,
              icon: Icons.credit_card,
              title: "Valu",
              subtitle: "توفير خدمة الدفع بالتقسيط الشهرية",
            ),
            const Divider(
              color: greyFA,
            ),
            _buildPaymentMethodTile(
              selected: false,
              icon: Icons.money,
              title: "الدفع فقط عند الاستلام",
              subtitle: "قد يتم فرض رسوم إضافية",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethodTile({
    required bool selected,
    required IconData icon,
    required String title,
    String? subtitle,
    String? actionText,
  }) {
    return Row(
      children: [
        Radio(value: true, groupValue: selected, onChanged: (_) {}),
        Icon(icon, color: Colors.pink),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: getBoldBlack12Style()),
              if (subtitle != null)
                Text(
                  subtitle,
                  style: getRegularGrey12Style(),
                ),
            ],
          ),
        ),
        if (actionText != null)
          Text(
            actionText,
            style: const TextStyle(color: Colors.pink),
          ),
      ],
    );
  }
}

void showSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      contentPadding: const EdgeInsets.all(20),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.check_circle_outline,
            color: Colors.green,
            size: 60,
          ),
          const SizedBox(height: 16),
          Text(
            'تم طلب الأوردر بنجاح!',
            style: getBoldBlack16Style(),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            'شكراً لطلبك. سيتم التواصل معك قريباً لإتمام عملية التوصيل.',
            style: getRegularGrey12Style(),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Nav.orderTrackingPage(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            ),
            child: Text(
              'تتبع الطلبً',
              style: getVBoldWhite12Style(),
            ),
          ),
        ],
      ),
    ),
  );
}
