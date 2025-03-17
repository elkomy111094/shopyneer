import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shopyneer/config/navigation/nav.dart';
import 'package:shopyneer/core/widgets/elevated_button.dart';
import 'package:shopyneer/core/widgets/picture.dart';
import 'package:shopyneer/shared/theme/colors.dart';
import 'package:shopyneer/shared/theme/styles_manager.dart';
import 'package:size_config/size_config.dart';

class OrderWidget extends StatefulWidget {
  const OrderWidget({Key? key}) : super(key: key);

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  final ExpandableController controller = ExpandableController();

  @override
  void initState() {
    controller.toggle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          elevation: 0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.w),
            side: BorderSide(color: greyFA, width: 2),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // الحالة
                Center(
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 6.h),
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12.w),
                        ),
                        child: Text(
                          "تم تأكيده",
                          style: getBoldBlack16Style()
                              .copyWith(color: Colors.green),
                        ),
                      ),
                      Gap(10.w),
                      Text(
                        "في الثلاثاء 22 / 5 /2024",
                        style: getBoldGreyD012Style(),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: greyFA,
                ),

                // السعر ورقم الطلب
                Row(
                  children: [
                    Expanded(
                      child: Text("5000 ج.م", style: getBoldBlack16Style()),
                    ),
                    Text(" #583557", style: getBoldBlack16Style()),
                  ],
                ),
                Divider(color: greyFA, height: 24.h),

                // عدد المنتجات والتاريخ
                Row(
                  children: [
                    Expanded(
                      child: Text("10 منتجات", style: getBoldBlack12Style()),
                    ),
                    Text("11 / 10 / 2024", style: getBoldBlack12Style()),
                  ],
                ),
                Divider(color: greyFA, height: 24.h),

                // قائمة المنتجات
                SizedBox(
                  height: 220.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    itemCount: 10,
                    separatorBuilder: (_, __) => Gap(10.w),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => Nav.productDetailsPage(context),
                        child: Container(
                          width: 130.w,
                          decoration: BoxDecoration(
                            border: Border.all(color: greyFA),
                            borderRadius: BorderRadius.circular(12.h),
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.all(10.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.h),
                                child: Picture(
                                  "https://freepngimg.com/save/166135-product-cosmetics-png-file-hd/1199x800",
                                  width: 90.w,
                                  height: 100.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Gap(8.h),
                              Text("ماسكرا",
                                  style: getRegularBlack14Style(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis),
                              Text("(2 وحده)", style: getRegularGrey12Style()),
                              Text("500 ج.م", style: getBoldPrimary12Style()),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                Gap(20.h),

                // زر التتبع
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: CustomElevatedButton(
                      onTap: () => Nav.orderDetails(context),
                      buttonColor: Colors.black,
                      buttonName: 'تفاصيل الطلب',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // الشريط العلوي الملون (أنيق أكثر)
      ],
    );
  }
}
