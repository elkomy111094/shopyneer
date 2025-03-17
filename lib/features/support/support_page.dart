import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shopyneer/core/widgets/custom_app_bar.dart';
import 'package:shopyneer/core/widgets/dot_seperator.dart';
import 'package:shopyneer/shared/theme/colors.dart';
import 'package:shopyneer/shared/theme/styles_manager.dart';
import 'package:size_config/size_config.dart';

class SupportScreen extends StatefulWidget {
  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  final List<String> reasons = [
    'تعديل أو إلغاء طلب',
    'استفسار عن منتج',
    'شكوى',
    'اقتراح'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          GeneralAppBar(
            routeName: "",
            subTitle: "تواصل معنا",
            onBackPressed: () {
              Navigator.of(context).pop();
            },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(20.h),
                    Text(
                      textAlign: TextAlign.center,
                      "في حال واجهتك أي مشكلة أو استفسار، لا تتردد في التواصل معنا. فريق خدمة العملاء لدينا متواجد دائمًا لمساعدتك وضمان تجربتك معنا خالية من أي صعوبات. سواء كان لديك استفسار حول منتج، طلب مساعدة في عملية الشراء، أو رغبة في تقديم ملاحظات",
                      style: getBoldGreyD014Style(),
                    ),
                    DotSeparator(),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.h, vertical: 20.h),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        color: const Color(0xffffe2e9),
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "لا يوجد إجابة على سؤالك؟ اطلب الدعم",
                              style: getBoldBlack16Style(),
                            ),
                            const SizedBox(height: 20),
                            _buildTextField(
                                label: "الاسم",
                                hint: "ادخل اسمك الثلاثي أو الوهابي"),
                            const SizedBox(height: 15),
                            _buildTextField(
                                label: "البريد الإلكتروني", hint: "ادخل بريدك"),
                            const SizedBox(height: 15),
                            _buildDropdownField(),
                            const SizedBox(height: 15),
                            _buildTextField(
                                label: "رسالتك",
                                hint: "اكتب سؤالك",
                                maxLines: 5),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: primary,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                    ),
                                    child: Text(
                                      "إرسال",
                                      style: getVBoldWhite12Style(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
      {required String label, required String hint, int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: getBoldGreyD014Style(),
        ),
        Gap(10.h),
        TextField(
          maxLines: maxLines,
          style: getBoldPrimary14Style(),
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Colors.white,
            hintStyle: getBoldGreyD012Style(),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField() {
    String selected = "إلغاء أو تعديل الطلب";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "الموضوع",
          style: getBoldGreyD014Style(),
        ),
        Gap(10.h),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: DropdownButton<String>(
            isExpanded: true,
            value: selected,
            onChanged: (value) {
              setState(() {
                selected = value!;
              });
            },
            underline: const SizedBox(),
            items: [
              DropdownMenuItem(
                  value: "إلغاء أو تعديل الطلب",
                  child: Text(
                    "إلغاء أو تعديل الطلب",
                    style: getBoldBlack12Style(),
                  )),
              DropdownMenuItem(
                  value: "استرجاع المنتج",
                  child: Text(
                    "استرجاع المنتج",
                    style: getBoldBlack12Style(),
                  )),
              DropdownMenuItem(
                  value: "استفسار عام",
                  child: Text(
                    "استفسار عام",
                    style: getBoldBlack12Style(),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}

class FAQItem {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});
}
