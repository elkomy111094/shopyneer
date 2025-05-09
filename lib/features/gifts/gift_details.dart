import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shopyneer/core/widgets/custom_app_bar.dart';
import 'package:shopyneer/core/widgets/elevated_button.dart';
import 'package:shopyneer/core/widgets/fields/email_field.dart';
import 'package:shopyneer/core/widgets/fields/name_field.dart';
import 'package:size_config/size_config.dart';

import '../../shared/theme/colors.dart';
import '../../shared/theme/styles_manager.dart';

class GiftCardDetailsPage extends StatefulWidget {
  const GiftCardDetailsPage({Key? key}) : super(key: key);

  @override
  State<GiftCardDetailsPage> createState() => _GiftCardDetailsPageState();
}

class _GiftCardDetailsPageState extends State<GiftCardDetailsPage> {
  int selectedCardIndex = 0;
  int selectedAmountIndex = 0;
  int quantity = 1;
  bool buyForSelf = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final List<String> amounts = ['50', '100', '500', '1000', 'مخصص'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          children: [
            GeneralAppBar(routeName: "تفاصيل بطاقة الهدية"),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("اختار القيمة", style: getBoldPrimary16Style()),
                    const Gap(10),
                    SizedBox(
                      height: 100.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        separatorBuilder: (_, __) => Gap(10.w),
                        itemBuilder: (context, index) {
                          bool isSelected = selectedCardIndex == index;
                          return GestureDetector(
                            onTap: () =>
                                setState(() => selectedCardIndex = index),
                            child: Container(
                              width: 110.w,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: isSelected ? primary : grey4A,
                                  width: isSelected ? 2 : 1,
                                ),
                                borderRadius: BorderRadius.circular(2.r),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(2.r),
                                child: Image.asset(
                                  "assets/images/gift1.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Gap(20.h),
                    Text("اختار المبلغ", style: getBoldPrimary16Style()),
                    const Gap(10),
                    Wrap(
                      spacing: 10.w,
                      runSpacing: 10.h,
                      children: List.generate(amounts.length, (index) {
                        bool isSelected = selectedAmountIndex == index;
                        return GestureDetector(
                          onTap: () =>
                              setState(() => selectedAmountIndex = index),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 10.h),
                            decoration: BoxDecoration(
                              color: isSelected ? primary : Colors.transparent,
                              border: Border.all(color: primary),
                              borderRadius: BorderRadius.circular(2.r),
                            ),
                            child: Text(
                              amounts[index],
                              style: isSelected
                                  ? getBoldWhite16Style()
                                  : getMediumPrimary14Style(),
                            ),
                          ),
                        );
                      }),
                    ),
                    Gap(20.h),
                    Text("اختار العدد", style: getBoldPrimary16Style()),
                    Gap(10.h),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            if (quantity > 1) setState(() => quantity--);
                          },
                          icon: const Icon(Icons.remove,
                              color: Colors.pinkAccent),
                        ),
                        Text(
                          "$quantity",
                          style: getBoldPrimary16Style(),
                        ),
                        IconButton(
                          onPressed: () => setState(() => quantity++),
                          icon: const Icon(Icons.add, color: Colors.pinkAccent),
                        ),
                      ],
                    ),
                    Gap(10.h),
                    Row(
                      children: [
                        Checkbox(
                          value: buyForSelf,
                          onChanged: (val) => setState(() => buyForSelf = val!),
                          activeColor: primary,
                        ),
                        Text("اشتريها لنفسي", style: getRegularGrey14Style()),
                      ],
                    ),
                    Gap(20.h),
                    Text("اسم المستلم", style: getMediumBlack14Style()),
                    Gap(6.h),
                    NameField(
                      controller: TextEditingController(),
                      hint: "اسم المستلم",
                    ),
                    Gap(16.h),
                    Text("إيميل المستلم", style: getMediumBlack14Style()),
                    Gap(6.h),
                    EmailField(controller: TextEditingController()),
                    Gap(16.h),
                    Row(
                      children: [
                        const Icon(Icons.info_outline,
                            color: Colors.red, size: 18),
                        Gap(6.w),
                        Expanded(
                          child: Text(
                            "بطاقة الهدية صالحة لمدة عام من تاريخ الشراء",
                            style: getRegularGrey14Style(),
                          ),
                        ),
                      ],
                    ),
                    Gap(20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("$quantity بطاقة هدية",
                            style: getMediumBlack14Style()),
                        Text("${(quantity * 0).toStringAsFixed(2)} جنيه",
                            style: getBoldPrimary16Style()),
                      ],
                    ),
                    Gap(20.h),
                    Gap(30.h),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 52.h,
              child: CustomElevatedButton(
                  onTap: () {},
                  buttonColor: Colors.black,
                  buttonName: "إستمر لإتمام الشراء"),
            ),
          ],
        ),
      ),
    );
  }
}
