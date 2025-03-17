import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shopyneer/core/widgets/custom_app_bar.dart';
import 'package:shopyneer/shared/theme/colors.dart';
import 'package:shopyneer/shared/theme/styles_manager.dart';
import 'package:size_config/size_config.dart';

class ReturnProductsPage extends StatefulWidget {
  const ReturnProductsPage({super.key});

  @override
  State<ReturnProductsPage> createState() => _ReturnProductsPageState();
}

class _ReturnProductsPageState extends State<ReturnProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          GeneralAppBar(
            routeName: 'المرتجعات',
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              itemCount: 10,
              itemBuilder: (context, index) {
                return OrderDetailsCard();
              },
            ),
          )
        ],
      ),
    );
  }
}

class OrderDetailsCard extends StatelessWidget {
  const OrderDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      color: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: greyFA)),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // الحالة، التاريخ وكود الطلب
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.green.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.check_circle_outline, color: Colors.green),
                      SizedBox(width: 6),
                      Text(
                        "مكتمل",
                        style:
                            getBoldBlack12Style().copyWith(color: Colors.green),
                      ),
                    ],
                  ),
                ),
                Gap(40.w),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("تاريخ الطلب: ", style: getBoldBlack12Style()),
                          Text("25 يناير 2025", style: getBoldGreyD012Style()),
                        ],
                      ),
                      Divider(
                        color: greyFA,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("كود الأوردر: ", style: getBoldBlack12Style()),
                          Text("#7465784365", style: getBoldGreyD012Style()),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // تفاصيل المنتج
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    "https://media.zid.store/thumbs/5cdca214-2e50-4659-8a26-57bf32ab67f8/b279fd81-2c4c-421c-b4b1-a5a2c0e6ea72-thumbnail-1000x1000.png",
                    width: 70,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "مجموعة Dazzler Glitter للشفاه من شيجلام",
                        style: getBoldBlack14Style(),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "تم إرجاع المنتج",
                        style: getBoldGreyD012Style(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(
              height: 30,
              color: greyFA,
            ),

            // سبب الإرجاع
            Text(
              "سبب الإرجاع",
              style: getBoldBlack14Style(),
            ),
            const SizedBox(height: 4),
            Text(
              "المنتج مختلف عن المعروض",
              style: getBoldGreyD012Style().copyWith(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
