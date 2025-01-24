import 'package:flutter/material.dart';
import 'package:size_config/size_config.dart';

import '../../config/theme/colors.dart';
import '../../config/theme/styles_manager.dart';

class CustomRadioButtonTile extends StatelessWidget {
  const CustomRadioButtonTile(
      {super.key, required this.onChangeValue, required this.value, this.checkBoxColor, required this.text});

  final Function(bool) onChangeValue;
  final bool value;
  final String text;
  final Color? checkBoxColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChangeValue(!value);
      },
      child: Container(
        height: 60.h,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 23.w),
          child: Row(
            children: [
              Text(
                text,
                style: getRegularBlack16Style(),
              ),
              const Spacer(),
              SizedBox(
                width: 20.w,
                height: 20.h,
                child: Radio<bool>(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  groupValue: value,
                  toggleable: true,
                  value: true,
                  activeColor: checkBoxColor ?? primary,
                  onChanged: (newValue) {
                    onChangeValue(newValue ?? false);
                  },
                  fillColor: WidgetStateProperty.resolveWith<Color>(
                    (Set<WidgetState> states) {
                      if (states.contains(WidgetState.selected)) {
                        return checkBoxColor ?? primary;
                      }
                      return Colors.grey.withOpacity(0.5); // Unselected color
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
