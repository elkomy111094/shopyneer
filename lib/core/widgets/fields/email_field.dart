import 'package:flutter/material.dart';
import 'package:shopyneer/config/localization/loc_keys.dart';
import 'package:shopyneer/core/widgets/picture.dart';
import 'package:shopyneer/shared/theme/colors.dart';
import 'package:shopyneer/shared/theme/styles_manager.dart';
import 'package:size_config/size_config.dart';

import '../../utils/get_asset_path.dart';
import '../../utils/vaildData/valid_data.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    super.key,
    required this.controller,
    this.focusNode,
    this.showPreFixIcon = true,
    this.confirm,
    this.onValidated,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final ValueChanged<String>? confirm;
  final ValueChanged<bool>? onValidated;
  final bool? showPreFixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: getBoldPrimary14Style(),
      controller: controller,
      focusNode: focusNode,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      onFieldSubmitted: confirm,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.start,
      keyboardType: TextInputType.emailAddress,
      textInputAction:
          confirm == null ? TextInputAction.next : TextInputAction.done,
      autofillHints: const [
        AutofillHints.email,
      ],
      validator: (value) {
        final result = validate(value);
        return result;
      },
      decoration: InputDecoration(
        hintText: Loc.email(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: primary,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(
              10.h,
            ),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: greyFA,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(
              10.h,
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
        errorStyle: getBoldGreyD012Style().copyWith(color: Colors.red),
        labelStyle: getRegularBlack14Style(),
        prefixIcon: showPreFixIcon == false
            ? null
            : Container(
                width: 60.w,
                margin: EdgeInsets.only(
                  left: 10.w,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.h),
                  border: Border(
                    right: BorderSide(
                      color: primary.withOpacity(0.1),
                    ),
                    left: BorderSide(
                      color: primary.withOpacity(0.1),
                    ),
                  ),
                ),
                child: Picture(
                  getAssetIcon('email.svg'),
                  color: primary,
                ),
              ),
        fillColor: Colors.transparent,
        hintStyle: getBoldGreyD012Style(),
        filled: true,
      ),
    );
  }

  String? validate(String? value) {
    if (!validString(
      value,
    )) {
      return Loc.pleaseEnterEmail();
    }
    if (value != null &&
        !validEmail(
          value,
        )) {
      // return Loc.invalid_email();
      return Loc.pleaseEnterValidEmail();
    }
    return null;
  }
}
