import 'package:flutter/material.dart';
import 'package:shopyneer/core/widgets/picture.dart';
import 'package:shopyneer/shared/theme/colors.dart';
import 'package:shopyneer/shared/theme/styles_manager.dart';
import 'package:size_config/size_config.dart';

import '../../../config/localization/loc_keys.dart';
import '../../utils/get_asset_path.dart';
import '../../utils/vaildData/valid_data.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
    required this.controller,
    this.focusNode,
    this.confirm,
    this.onValidated,
    this.label,
    this.confirmedPassword,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final ValueChanged<String>? confirm;
  final ValueChanged<bool>? onValidated;
  final String? label;
  final String? confirmedPassword;

  @override
  Widget build(BuildContext context) {
    bool obscurePass = true;
    return StatefulBuilder(
      builder: (context, setState) => TextFormField(
        controller: controller,
        focusNode: focusNode,
        textDirection: TextDirection.ltr,
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        onFieldSubmitted: confirm,
        obscureText: obscurePass,
        textAlign: TextAlign.start,
        textInputAction:
            confirm == null ? TextInputAction.next : TextInputAction.done,
        autofillHints: const [
          AutofillHints.password,
          AutofillHints.newPassword,
        ],
        validator: (value) {
          final result = validate(value);
          onValidated?.call(result == null);
          return result;
        },
        decoration: InputDecoration(
          hintText: label ?? Loc.password(),
          errorMaxLines: 3,
          suffixIcon: ExcludeFocus(
            child: IconButton(
              onPressed: () => setState.call(() => obscurePass = !obscurePass),
              icon: Icon(
                obscurePass
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: greyA9,
              ),
            ),
          ),
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
          labelStyle: getRegularBlack14Style(),
          prefixIcon: Container(
            width: 60.w,
            margin: EdgeInsets.only(left: 10.w),
            decoration: BoxDecoration(
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
              getAssetIcon('lock.svg'),
            ),
          ),
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }

  String? validate(String? value) {
    if (!validString(value)) {
      // return Loc.invalid_password();
      return '';
    }
    if (validString(confirmedPassword)) {
      if (value != confirmedPassword) {
        // return Loc.password_mismatch();
        return '';
      }
    } else {
      if (value != null && !validPassword(value)) {
        return Loc.password_weak();
      }
      if (value != null && !validatePassword(value)) {
        return Loc.password_must_contain();
      }
    }
    return null;
  }
}
