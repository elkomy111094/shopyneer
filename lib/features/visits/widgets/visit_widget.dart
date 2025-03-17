import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:shopyneer/config/localization/loc_keys.dart';
import 'package:shopyneer/core/utils/extensions/date.dart';
import 'package:shopyneer/features/visits/models/visits_response_model.dart';
import 'package:shopyneer/shared/theme/colors.dart';
import 'package:shopyneer/shared/theme/styles_manager.dart';
import 'package:size_config/size_config.dart';

class VisitWidget extends StatelessWidget {
  final bool isFinished;
  final VisitModel visit;

  const VisitWidget({super.key, this.isFinished = false, required this.visit});

  // Helper method to build individual contract detail rows
  Widget buildContractDetailRow(String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$title :',
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.black,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: primary, // Border color
      strokeWidth: 1, // Width of the border
      dashPattern: const [3, 3], // Length of the dash and space between dashes
      borderType: BorderType.RRect, // Rounded border
      radius: const Radius.circular(10), // Rounded corners radius
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.h),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(Loc.visitDetails(), style: getBoldPrimary16Style()),
                const Spacer(),
              ],
            ),
            Divider(
              height: 10.h,
              thickness: .1,
            ),
            buildContractDetailRow(Loc.date(), visit.date.toSimpleDate()),
            Divider(
              height: 10.h,
              thickness: .1,
            ),
            buildContractDetailRow(Loc.period(), visit.shiftName),
            Divider(
              height: 10.h,
              thickness: .1,
            ),
            buildContractDetailRow(Loc.visitStatus(), visit.orderStatus),
            Divider(
              height: 10.h,
              thickness: .1,
            ),
            buildContractDetailRow(Loc.visitContract(), visit.contractNumber),
          ],
        ),
      ),
    );
  }
}
