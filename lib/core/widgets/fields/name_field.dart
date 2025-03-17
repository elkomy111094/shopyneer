import 'package:flutter/material.dart';
import 'package:shopyneer/shared/theme/colors.dart';
import 'package:shopyneer/shared/theme/styles_manager.dart';

import '../../../config/localization/loc_keys.dart';
import '../../utils/vaildData/valid_data.dart';

class NameField extends StatelessWidget {
  NameField({
    super.key,
    required this.controller,
    this.focusNode,
    this.confirm,
    this.onChange,
    this.onValidated,
    this.label,
    this.color,
    this.textAlign,
    this.keyboardType,
    this.maxLines,
    this.suffix,
    this.hint,
    this.autoFocus = false,
  });

  String? hint;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final ValueChanged<String>? confirm;
  final ValueChanged<String>? onChange;
  final String? Function(String?)? onValidated;
  final String? label;
  final Color? color;
  final TextInputType? keyboardType;
  final TextAlign? textAlign;
  final int? maxLines;
  final Widget? suffix;
  final bool autoFocus;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      onFieldSubmitted: confirm,
      textAlign: textAlign ?? TextAlign.start,
      keyboardType: keyboardType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      maxLines: maxLines,
      onChanged: onChange,
      autofocus: autoFocus,
      textInputAction:
          confirm == null ? TextInputAction.next : TextInputAction.go,
      autofillHints: const [
        AutofillHints.name,
        AutofillHints.middleName,
        AutofillHints.familyName,
        AutofillHints.givenName,
        AutofillHints.nickname,
        AutofillHints.username,
        AutofillHints.newUsername,
      ],
      validator: validate,
      style: getBoldPrimary14Style(),
      decoration: InputDecoration(
        hintText: hint ?? "الإسم",
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: primary,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(
              5,
            ),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: greyFA,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(
              5,
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
        labelStyle: getRegularBlack14Style(),
        fillColor: Colors.white,
        hintStyle: getRegularGrey12Style(),
        filled: true,
      ),
    );
  }

  String? validate(String? value) {
    if (!validString(value)) {
      return Loc.emptyName();
    }
    return null;
  }
}
