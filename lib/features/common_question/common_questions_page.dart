import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shopyneer/core/widgets/custom_app_bar.dart';
import 'package:shopyneer/core/widgets/dot_seperator.dart';
import 'package:shopyneer/shared/theme/colors.dart';
import 'package:shopyneer/shared/theme/styles_manager.dart';
import 'package:size_config/size_config.dart';

class FAQPage extends StatefulWidget {
  const FAQPage({super.key});

  @override
  State<FAQPage> createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  List<FAQItem> faqList = [
    FAQItem(
      question: "ماهو موقع shopyneer؟",
      answer:
          "نحن في شوپينير نفهم أن العميل هو محور اهتمامنا. ولذلك نعمل بجد لتقديم تجربة تسوق سلسة وممتعة. من لحظة تصفحك لموقعنا وحتى استلامك للطلب، نحن هنا لدعمك والإجابة على جميع استفساراتك.",
    ),
    FAQItem(
      question: "هل يمكنني إلغاء الطلب؟",
      answer: "نعم، يمكنك إلغاء الطلب من خلال صفحة الطلبات خلال فترة محددة.",
    ),
    FAQItem(
      question: "كيف يمكنني تتبع طلبي؟",
      answer: "ادخل إلى قسم الطلبات وستجد رقم التتبع وموقع الشحنة.",
    ),
  ];

  List<bool> expanded = [];

  @override
  void initState() {
    super.initState();
    expanded = List.generate(faqList.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          GeneralAppBar(
            routeName: "الأسئله الشائعه",
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.h),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: faqList.length,
                      itemBuilder: (context, index) {
                        final item = faqList[index];
                        final isExpanded = expanded[index];
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  expanded[index] = !expanded[index];
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: isExpanded
                                      ? primary
                                      : Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      item.question,
                                      style: TextStyle(
                                          color: isExpanded
                                              ? Colors.white
                                              : Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "cairo"),
                                    ),
                                    Icon(
                                      isExpanded ? Icons.remove : Icons.add,
                                      color: isExpanded
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            if (isExpanded)
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(16),
                                color: Colors.grey.shade100,
                                child: Text(
                                  item.answer,
                                  textAlign: TextAlign.right,
                                  style: getMediumGrey14Style(),
                                ),
                              ),
                            const SizedBox(height: 12),
                          ],
                        );
                      },
                    ),
                  ),
                  DotSeparator(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.h),
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
                              label: "رسالتك", hint: "اكتب سؤالك", maxLines: 5),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: primary,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
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
                  Gap(20.h),
                ],
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
