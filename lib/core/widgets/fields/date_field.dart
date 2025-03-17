import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shopyneer/shared/theme/colors.dart';
import 'package:shopyneer/shared/theme/styles_manager.dart';
import 'package:size_config/size_config.dart';

import '../../utils/get_asset_path.dart';
import '../../utils/vaildData/valid_data.dart';
import '../picture.dart';

class DateField extends StatelessWidget {
  const DateField({
    super.key,
    required this.controller,
    this.focusNode,
    this.confirm,
    this.onValidated,
    this.onTap,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final ValueChanged<String>? confirm;
  final ValueChanged<bool>? onValidated;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      readOnly: true,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      onFieldSubmitted: confirm,
      style: getBoldPrimary14Style(),
      onTap: onTap,
      textAlign: TextAlign.start,
      keyboardType: TextInputType.emailAddress,
      textInputAction:
          confirm == null ? TextInputAction.next : TextInputAction.done,
      autofillHints: const [
        AutofillHints.email,
      ],
      validator: (value) {
        final result = validate(value);
        onValidated?.call(result == null);
        return result;
      },
      decoration: InputDecoration(
          hintText: '17/09/2022',
          alignLabelWithHint: true,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: primary.withOpacity(0.1),
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(
                10,
              ),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: primary.withOpacity(0.1),
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(
                10,
              ),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: red,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(
                5,
              ),
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: primary,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          errorStyle: getBoldGreyD012Style().copyWith(color: Colors.red),
          labelStyle: getBoldBlue14Style(),
          prefixIcon: Container(
            width: 60.w,
            margin: EdgeInsets.only(
                left: context.locale.languageCode == 'en' ? 0 : 10.w,
                right: context.locale.languageCode == 'en' ? 10.w : 0),
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.h),
                  bottomRight: Radius.circular(10.h)),
              border: Border(
                left: BorderSide(
                  color: primary.withOpacity(0.1),
                ),
              ),
            ),
            child: Picture(
              getAssetIcon('date.svg'),
              color: primary,
            ),
          ),
          fillColor: Colors.white,
          filled: true,
          hintStyle: getRegularGrey12Style()),
    );
  }

  String? validate(String? value) {
    if (!validString(
      value,
    )) {
      return '';
    }
    if (value != null &&
        !validEmail(
          value,
        )) {
      // return Loc.invalid_email();
      return '';
    }
    return null;
  }
}
