import 'package:shopyneer/config/theme/styles_manager.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:size_config/size_config.dart';

import '../../../config/localization/loc_keys.dart';
import '../../../config/theme/colors.dart';

class CancelContractDialog extends StatefulWidget {
  const CancelContractDialog({super.key});

  @override
  State<CancelContractDialog> createState() => _CancelContractDialogState();
}

class _CancelContractDialogState extends State<CancelContractDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            Loc.alert(),
            style: getPrimaryBoldStyle20Style(),
          ),
        ],
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            Loc.confirmContractCancel(),
            style: getRegularBlack16Style(),
          ),
        ],
      ),
      actions: [
        SizedBox(
          height: 50.h,
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Handle 'Yes' action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    Loc.yes(),
                    style: getVBoldWhite16Style(),
                  ),
                ),
              ),
              Gap(20.w),
              Expanded(
                child: DottedBorder(
                  padding: const EdgeInsets.all(0),
                  color: greyEE, // Border color
                  strokeWidth: 1, // Width of the border
                  dashPattern: const [
                    3,
                    3
                  ], // Length of the dash and space between dashes
                  borderType: BorderType.RRect, // Rounded border
                  radius: Radius.circular(10.h), // Rounded corners radius
                  child: Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                      },
                      child: Text(
                        Loc.cancel(),
                        style: getBoldGreyD016Style(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
