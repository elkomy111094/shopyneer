import 'package:flutter/material.dart';

import '../../../config/localization/loc_keys.dart';
import '../../../config/theme/colors.dart';
import '../../../config/theme/styles_manager.dart';
import '../../utils/vaildData/valid_data.dart';

class IDField extends StatelessWidget {
  const IDField({
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
    this.autoFocus = false,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final ValueChanged<String>? confirm;
  final ValueChanged<String>? onChange;
  final ValueChanged<bool>? onValidated;
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
      textDirection: TextDirection.ltr,
      textInputAction:
      confirm == null ? TextInputAction.next : TextInputAction.done,
      maxLength: 10,
      validator: (value) {
        final result = validate(value);
        onValidated?.call(result == null);
        return result;
      },
      decoration: InputDecoration(
        hintText: Loc.IDNumber(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: primary.withOpacity(0.1),
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(
              5,
            ),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: primary.withOpacity(0.1),
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(
              5,
            ),
          ),
        ),
        labelStyle: getRegularBlack14Style(),
        fillColor: Colors.white,
        filled: true,
      ),
    );
  }

  String? validate(String? value) {
    if (!validString(value)) {
      return Loc.emptyIdNumber();
    }
    if (value != null &&
        !validNationalId(
          value,
        )) {
      // return Loc.invalid_email();
      return Loc.invalidIdNumber();
    }
    return null;
  }
}