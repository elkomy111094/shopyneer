import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shopyneer/config/navigation/nav.dart';
import 'package:shopyneer/config/theme/colors.dart';
import 'package:shopyneer/core/widgets/custom_app_bar.dart';
import 'package:shopyneer/core/widgets/elevated_button.dart';
import 'package:size_config/size_config.dart';

class AddressesPage extends StatefulWidget {
  const AddressesPage({super.key});

  @override
  State<AddressesPage> createState() => _AddressesPageState();
}

class _AddressesPageState extends State<AddressesPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: greyFA,
        body: Column(
          children: [
            CustomAppBar(
              routeName: 'عناويني',
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ContactCard();
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
      ),
    );
  }
}

class ContactCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 10,
        shadowColor: Colors.black,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.h)),
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  TabButton(
                    title: 'العمل',
                    isActive: true,
                  ),
                  SizedBox(width: 8),
                  TabButton(title: 'رئيسي', isActive: false),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Nav.editAddressPage(context);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.edit, size: 16, color: Colors.grey),
                        SizedBox(width: 4),
                        Text(
                          'تعديل',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Divider(color: greyFA),
              SizedBox(height: 16),
              DetailRow(label: 'الاسم', value: 'Eslam Muhamed'),
              DetailRow(
                label: 'العنوان',
                value:
                    'محطه مترو الف مسكن، 144 - جسر السويس - الزهراء ومساكن الحلمية - قسم عين شمس - محافظة القاهرة -4542362، مصر الجديدة',
              ),
              DetailRow(
                label: 'رقم الموبايل',
                value: '+20-11-53942488',
                valueColor: Colors.green,
                valuePrefix: Text(
                  'تم التحقق',
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ],
          ),
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
        style: TextStyle(
          color: isActive ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
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

  const DetailRow({
    required this.label,
    required this.value,
    this.valueColor,
    this.valuePrefix,
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
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
          ),
          Gap(20.w),
          Expanded(
            flex: 3,
            child: Text(
              value,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 14,
                color: valueColor ?? Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
