import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:shopyneer/core/widgets/custom_app_bar.dart';
import 'package:shopyneer/core/widgets/elevated_button.dart';
import 'package:shopyneer/shared/theme/colors.dart';
import 'package:shopyneer/shared/theme/styles_manager.dart';
import 'package:size_config/size_config.dart';

import '../../core/widgets/picture.dart';

class EditAddressPage extends StatelessWidget {
  const EditAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const GeneralAppBar(routeName: 'تعديل العنوان'),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildAnimatedSection(
                      delay: 0,
                      child: _buildSectionTitle(
                          'معلومات الموقع', Icons.location_pin),
                    ),
                    const Gap(10),
                    _buildAnimatedSection(
                      delay: 200,
                      child: _buildAddressCard(context),
                    ),
                    const Gap(20),
                    _buildAnimatedSection(
                      delay: 300,
                      child: _buildSectionTitle('تفاصيل العنوان الإضافية'),
                    ),
                    const Gap(10),
                    _buildAnimatedSection(
                      delay: 400,
                      child: _buildTextField(
                          hint: 'تفاصيل إضافية مثل معلم قريب أو وصف مختصر'),
                    ),
                    const Gap(20),
                    _buildAnimatedSection(
                      delay: 500,
                      child: _buildSectionTitle('معلوماتك الشخصية'),
                    ),
                    const Gap(20),
                    _buildAnimatedSection(
                      delay: 600,
                      child: _buildTextField(
                          label: 'رقم الموبايل', hint: '+20 11 53942488'),
                    ),
                    const Gap(16),
                    _buildAnimatedSection(
                      delay: 700,
                      child:
                          _buildTextField(label: 'الاسم الأول', hint: 'Eslam'),
                    ),
                    const Gap(16),
                    _buildAnimatedSection(
                      delay: 800,
                      child: _buildTextField(
                          label: 'اسم العائلة', hint: 'Muhamed'),
                    ),
                    const Gap(20),
                    _buildAnimatedSection(
                      delay: 900,
                      child: _buildSectionTitle('تسمية العنوان (اختياري)'),
                    ),
                    const Gap(14),
                    _buildAnimatedSection(
                      delay: 1000,
                      child: Row(
                        children: [
                          AddressLabelButton(
                              title: 'المنزل',
                              icon: Icons.home,
                              isSelected: true),
                          Gap(20.w),
                          AddressLabelButton(
                              title: 'العمل',
                              icon: Icons.work,
                              isSelected: false),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
            child: CustomElevatedButton(
              condition: true,
              onTap: () {},
              buttonColor: primary,
              buttonName: "حفظ التغييرات",
            ).animate().fade(duration: 500.ms).slideY(begin: 0.3),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedSection({required Widget child, required int delay}) {
    return child
        .animate(delay: Duration(milliseconds: delay))
        .fade(duration: 600.ms)
        .slideY(begin: 0.2);
  }

  Widget _buildSectionTitle(String title, [IconData? icon]) {
    return Row(
      children: [
        if (icon != null) Icon(icon, size: 18, color: greyD0),
        if (icon != null) const SizedBox(width: 6),
        Text(title, style: getBoldPrimary12Style()),
      ],
    );
  }

  Widget _buildTextField({String? label, required String hint}) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: greyFA)),
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: TextFormField(
          initialValue: hint,
          style: getBoldBlack14Style(),
          decoration: InputDecoration(
            labelText: label,
            labelStyle: getRegularGrey12Style(),
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 14.h),
          ),
        ),
      ),
    );
  }

  Widget _buildAddressCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 8)],
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              '4 - صعب صالح - حلمية النعام - قسم عين شمس - محافظة القاهرة - 4542114',
              style: getBoldBlack12Style(),
            ),
          ),
          const Gap(12),
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Picture(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Europe_blank_laea_location_map.svg/2395px-Europe_blank_laea_location_map.svg.png",
                  width: 80.h,
                  height: 80.h,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 30.h,
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(8)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.edit, size: 16, color: Colors.white),
                        Gap(5.w),
                        Text(
                          'تعديل',
                          style: getVBoldWhite14Style(),
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
    return AnimatedContainer(
      duration: 300.ms,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: isSelected ? primary : Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: isSelected ? primary : greyD0),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: isSelected ? Colors.white : greyD0),
          const SizedBox(width: 6),
          Text(
            title,
            style: getRegularGrey14Style().copyWith(
              color: isSelected ? Colors.white : greyD0,
            ),
          ),
        ],
      ),
    );
  }
}
