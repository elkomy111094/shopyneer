import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shopyneer/config/navigation/nav.dart';
import 'package:shopyneer/config/theme/colors.dart';
import 'package:shopyneer/config/theme/styles_manager.dart';
import 'package:shopyneer/core/widgets/picture.dart';
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
          elevation: 10,
          shadowColor: Colors.black,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.w),
              side: BorderSide(color: greyD0)),
          child: Container(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Gap(10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "ملفي",
                              style: getBoldBlack16Style()
                                  .copyWith(color: Colors.red),
                            )
                          ],
                        ),
                        Divider(
                          color: greyFA,
                          height: 20.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.h),
                          child: Row(
                            textBaseline: TextBaseline.alphabetic,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Text(
                                  "5000 ج.م",
                                  style: getBoldBlack16Style(),
                                ),
                              ),
                              Text(
                                "583557 # ",
                                style: getBoldBlack16Style(),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: greyFA,
                          height: 20.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.h),
                          child: Row(
                            textBaseline: TextBaseline.alphabetic,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Text(
                                  "10 منتجات",
                                  style: getRegularGrey12Style(),
                                ),
                              ),
                              Text(
                                "11 / 10 / 2024 ",
                                style: getRegularGrey12Style(),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: greyFA,
                          height: 20.h,
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
                        Gap(10.h),
                        InkWell(
                          onTap: () {
                            Nav.orderDetails(context);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Container(
                              height: 50.h,
                              color: Colors.black,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "تتبع الطلب",
                                          style: getBoldWhite16Style(),
                                        ),
                                        Gap(5.w),
                                        Center(
                                          child: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: primary,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: 10.w,
            width: 100.h,
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10.h),
                    bottomLeft: Radius.circular(10.h))),
          ),
        )
      ],
    );
  }
}
