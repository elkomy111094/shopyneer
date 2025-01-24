import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shopyneer/config/theme/colors.dart';
import 'package:shopyneer/config/theme/styles_manager.dart';
import 'package:shopyneer/core/widgets/custom_app_bar.dart';
import 'package:size_config/size_config.dart';

class SupportScreen extends StatelessWidget {
  final List<String> reasons = [
    'تعديل أو إلغاء طلب',
    'استفسار عن منتج',
    'شكوى',
    'اقتراح'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
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
                      Gap(20.h),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'الاسم',
                          labelStyle: TextStyle(color: primary),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: primary),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'البريد الإلكتروني',
                          labelStyle: TextStyle(color: primary),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: primary),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'رقم الهاتف',
                          labelStyle: TextStyle(color: primary),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: primary),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'السبب',
                          labelStyle: TextStyle(color: primary),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: primary),
                          ),
                        ),
                        isExpanded: true,
                        hint: Text('اختر سبباً'),
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black,
                        ),
                        items: reasons
                            .map((reason) => DropdownMenuItem<String>(
                                  value: reason,
                                  child: Text(reason),
                                ))
                            .toList(),
                        onChanged: (value) {},
                      ),
                      SizedBox(height: 16),
                      TextField(
                        maxLines: 5,
                        decoration: InputDecoration(
                          labelText: 'الرسالة',
                          labelStyle: TextStyle(color: primary),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: primary),
                          ),
                        ),
                      ),
                      SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.h)),
                            padding: EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: Text(
                            'إرسال',
                            style: TextStyle(color: Colors.white, fontSize: 16),
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
      ),
    );
  }
}
