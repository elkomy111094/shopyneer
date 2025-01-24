import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shopyneer/config/theme/colors.dart';
import 'package:shopyneer/config/theme/styles_manager.dart';
import 'package:shopyneer/core/widgets/custom_app_bar.dart';
import 'package:shopyneer/core/widgets/elevated_button.dart';
import 'package:size_config/size_config.dart';

import '../../core/widgets/picture.dart';

class EditAddressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            routeName: 'تفاصيل العنوان',
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SectionTitle(
                        title: 'معلومات الموقع', icon: Icons.location_pin),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            '4 - صعب صالح - حلمية النعام - قسم عين شمس - محافظة القاهرة - 4542114',
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        ),
                        Stack(
                          children: [
                            Picture(
                              "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Europe_blank_laea_location_map.svg/2395px-Europe_blank_laea_location_map.svg.png",
                              width: 80.h,
                              height: 80.h,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: GestureDetector(
                                onTap: () {
                                  // Handle edit functionality
                                },
                                child: Container(
                                  height: 30.h,
                                  color: Colors.black,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.edit,
                                          size: 16, color: Colors.white),
                                      Gap(5.w),
                                      Text(
                                        'تعديل',
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'عين شمس',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ),
                    Divider(
                      height: 30.h,
                      color: greyFA,
                    ),
                    SectionTitle(title: 'تفاصيل العنوان الإضافية'),
                    SizedBox(height: 8),
                    Text(
                      'محطه مترو الف مسكن',
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    Divider(
                      height: 30.h,
                      color: greyFA,
                    ),
                    SectionTitle(title: 'معلوماتك الشخصية'),
                    Gap(20.h),
                    DetailRow(label: 'رقم الموبايل', value: '+20 11 53942488'),
                    Divider(
                      height: 30.h,
                      color: greyFA,
                    ),
                    DetailRow(label: 'الاسم الأول', value: 'Eslam'),
                    Divider(
                      height: 30.h,
                      color: greyFA,
                    ),
                    DetailRow(label: 'اسم العائلة', value: 'Muhamed'),
                    Divider(
                      height: 30.h,
                      color: greyFA,
                    ),
                    SectionTitle(title: 'تسمية العنوان (اختيارية)'),
                    Gap(20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AddressLabelButton(
                          title: 'المنزل',
                          icon: Icons.home,
                          isSelected: true,
                        ),
                        Gap(20.w),
                        AddressLabelButton(
                          title: 'العمل',
                          icon: Icons.work,
                          isSelected: false,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: CustomElevatedButton(
              condition: true,
              onTap: () {},
              buttonColor: Colors.black,
              buttonName: "حفظ",
            ),
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  final IconData? icon;

  const SectionTitle({required this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (icon != null) ...[
          Icon(icon, size: 18, color: greyD0),
          SizedBox(width: 4),
        ],
        Text(
          title,
          style: getBoldGreyD016Style(),
        ),
      ],
    );
  }
}

class DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.h)),
      child: TextFormField(
        autofocus: true,
        controller: TextEditingController(text: value),
        decoration: InputDecoration(
          hintText: label,
          hintStyle: getRegularGrey12Style(),
          focusedBorder: InputBorder.none,
          fillColor: Colors.transparent,
          border: InputBorder.none,
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}

class AddressLabelButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;

  const AddressLabelButton({
    required this.title,
    required this.icon,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: isSelected ? primary : Colors.transparent,
        border: Border.all(color: isSelected ? primary : Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, color: isSelected ? Colors.white : Colors.grey),
          SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey,
                fontSize: 13.sp),
          ),
        ],
      ),
    );
  }
}
