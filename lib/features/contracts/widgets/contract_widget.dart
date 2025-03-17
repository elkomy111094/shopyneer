import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shopyneer/config/localization/loc_keys.dart';
import 'package:shopyneer/shared/theme/styles_manager.dart';
import 'package:shopyneer/core/utils/extensions/date.dart';
import 'package:shopyneer/features/contracts/models/contracts_response_model.dart';
import 'package:shopyneer/shared/theme/colors.dart';
import 'package:size_config/size_config.dart';

import '../../../config/navigation/nav.dart';
import 'cancel_contract_dialog.dart';

class ContractWidget extends StatelessWidget {
  final bool isFinished;
  final Contract contract;
  const ContractWidget(
      {super.key, this.isFinished = false, required this.contract});

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
                Text(Loc.contractDetails(), style: getBoldPrimary16Style()),
                const Spacer(),
                // Cancel Button

                isFinished
                    ? const SizedBox()
                    : DottedBorder(
                        color: red, // Border color
                        strokeWidth: 1, // Width of the border
                        dashPattern: const [
                          3,
                          3
                        ], // Length of the dash and space between dashes
                        borderType: BorderType.RRect, // Rounded border
                        radius: const Radius.circular(
                            100), // Rounded corners radius
                        child: GestureDetector(
                          onTap: () {
                            Nav.cancelContractDialog(
                                context, const CancelContractDialog());
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 5.h),
                            child: Text(
                              Loc.cancel(),
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        ),
                      ),

                Gap(8.w),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                  decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.circular(100.h),
                  ),
                  child: Text(
                    isFinished ? "تم التأكيد" : 'لم يتم التأكيد',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              height: 10.h,
              thickness: .1,
            ),
            buildContractDetailRow(
                Loc.contractNumber(), contract.contractNumber.toString()),
            Divider(
              height: 10.h,
              thickness: .1,
            ),
            buildContractDetailRow(
                Loc.amount(), '${contract.price.toString()} ريال'),
            Divider(
              height: 10.h,
              thickness: .1,
            ),
            buildContractDetailRow(
                Loc.requestDate(), contract.createdOn.toSimpleDate()),
          ],
        ),
      ),
    );
  }
}
