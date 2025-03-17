import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shopyneer/config/navigation/nav.dart';
import 'package:shopyneer/core/widgets/custom_app_bar.dart';
import 'package:shopyneer/core/widgets/elevated_button.dart';
import 'package:shopyneer/shared/theme/colors.dart';
import 'package:size_config/size_config.dart';

import '../../shared/theme/styles_manager.dart';

class AddressesPage extends StatefulWidget {
  const AddressesPage({super.key});

  @override
  State<AddressesPage> createState() => _AddressesPageState();
}

class _AddressesPageState extends State<AddressesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          GeneralAppBar(
            routeName: 'عناويني',
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return ContactCard(
                  addressType1: 'العمل',
                  addressType2: 'رئيسي',
                  isType1Active: true,
                  name: 'إسلام محمد',
                  address:
                      'محطة مترو ألف مسكن، 144 شارع جسر السويس، الزهراء ومساكن الحلمية، قسم عين شمس، محافظة القاهرة 11772، مصر',
                  phone: "+20 1153942488",
                  isPhoneVerified: true,
                  onEdit: () {
                    Nav.editAddressPage(context);
                  },
                );
              },
              itemCount: 10,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: CustomElevatedButton(
              condition: true,
              onTap: () {
                Nav.addAddressPage(context);
              },
              buttonColor: Colors.black,
              buttonName: "إضافة عنوان جديد",
            ),
          ),
        ],
      ),
    );
  }
}

class ContactCard extends StatelessWidget {
  final String addressType1;
  final String addressType2;
  final bool isType1Active;
  final String name;
  final String address;
  final String phone;
  final bool isPhoneVerified;
  final VoidCallback? onEdit;

  const ContactCard({
    super.key,
    required this.addressType1,
    required this.addressType2,
    required this.isType1Active,
    required this.name,
    required this.address,
    required this.phone,
    this.isPhoneVerified = false,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: greyFA),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                TabButton(title: addressType1, isActive: isType1Active),
                const SizedBox(width: 8),
                TabButton(title: addressType2, isActive: !isType1Active),
                const Spacer(),
                if (onEdit != null)
                  GestureDetector(
                    onTap: onEdit,
                    child: Row(
                      children: [
                        const Icon(Icons.edit, size: 16, color: Colors.grey),
                        const SizedBox(width: 4),
                        Text(
                          'تعديل',
                          style: getRegularGrey14Style(),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
            const Divider(color: greyFA),
            const SizedBox(height: 16),
            DetailRow(
              label: 'الاسم',
              value: name,
              labelStyle: getBoldPrimary12Style(),
              valueStyle: getRegularGrey14Style(),
            ),
            DetailRow(
              label: 'العنوان',
              value: address,
              labelStyle: getBoldPrimary12Style(),
              valueStyle: getRegularGrey14Style(),
            ),
            DetailRow(
              label: 'رقم الموبايل',
              value: phone,
              valueColor: isPhoneVerified ? Colors.green : null,
              valuePrefix: isPhoneVerified
                  ? Text('تم التحقق',
                      style:
                          getBoldPrimary14Style().copyWith(color: Colors.green))
                  : null,
              labelStyle: getBoldPrimary14Style(),
              valueStyle: getRegularGrey14Style(),
            ),
          ],
        ),
      ),
    );
  }
}

class TabButton extends StatelessWidget {
  final String title;
  final bool isActive;

  const TabButton({
    required this.title,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: isActive ? Colors.black : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: isActive ? null : Border.all(color: Colors.black),
      ),
      child: Text(
        title,
        style: getBoldBlack12Style().copyWith(
          color: isActive ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}

class DetailRow extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;
  final Widget? valuePrefix;
  final labelStyle;
  final valueStyle;

  DetailRow({
    required this.label,
    required this.value,
    this.valueColor,
    this.valuePrefix,
    this.labelStyle,
    this.valueStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              label,
              style: labelStyle,
            ),
          ),
          Gap(20.w),
          Expanded(
            flex: 3,
            child: Text(
              value,
              textAlign: TextAlign.start,
              style: valueStyle,
            ),
          ),
        ],
      ),
    );
  }
}
