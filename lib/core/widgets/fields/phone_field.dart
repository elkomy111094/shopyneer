import 'package:shopyneer/config/theme/consts.dart';
import 'package:shopyneer/core/utils/media_query_values.dart';
import 'package:shopyneer/core/widgets/picture.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:size_config/size_config.dart';

import '../../../config/localization/loc_keys.dart';
import '../../../config/theme/colors.dart';
import '../../../config/theme/styles_manager.dart';
import '../../utils/get_asset_path.dart';
import '../../utils/vaildData/valid_data.dart';

class PhoneField extends StatefulWidget {
  const PhoneField({
    super.key,
    required this.controller,
    this.showHint = false,
    this.autoFocus = false,
    this.isAddPersonPage = false,
    this.focusNode,
    this.confirm,
    this.onValidated,
    this.getChosenPhoneCode,
    this.addPenIcon,
    this.onChange,
    this.initialValue,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final ValueChanged<String>? confirm;
  final ValueChanged<String>? getChosenPhoneCode;
  final String? Function(String?)? onValidated;
  final ValueChanged<String>? onChange;
  final String? initialValue;
  final bool showHint;
  final bool autoFocus;
  final bool isAddPersonPage;
  final bool? addPenIcon;

  @override
  State<PhoneField> createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State<PhoneField> {
  Country? countryCode;
  @override
  void initState() {
    countryCode = CountryParser.parseCountryCode(widget.initialValue ?? 'SA');
    super.initState();
  }

  Country getCountryCode() {
    countryCode = CountryParser.parseCountryCode(widget.controller.text);
    return countryCode!;
  }

  //get initial country by getInitialCountry
  late final ValueNotifier<Country> _country =
      ValueNotifier(getInitialCountry(widget.initialValue));

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      textDirection: TextDirection.ltr,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      onFieldSubmitted: widget.confirm,
      textAlign: TextAlign.start,
      keyboardType: TextInputType.phone,
      autofocus: widget.autoFocus,
      onChanged: widget.onChange,
      textInputAction:
          widget.confirm == null ? TextInputAction.next : TextInputAction.done,
      autofillHints: const [
        AutofillHints.telephoneNumber,
        AutofillHints.telephoneNumberLocal,
        AutofillHints.telephoneNumberNational,
        AutofillHints.telephoneNumberDevice,
      ],
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(11),
      ],
      validator: validate,
      decoration: InputDecoration(
        fillColor: Colors.white,

        suffixIcon: Padding(
          padding: EdgeInsets.only(
            top: 8.h,
            bottom: 8.h,
            left: 3.h,
          ),
          child: ValueListenableBuilder<Country>(
            valueListenable: _country,
            builder: (context, value, child) {
              return InkWell(
                onTap: () {
                  showCountryPicker(
                    context: context,
                    onSelect: (d) {
                      _country.value = d;
                      widget.getChosenPhoneCode!(
                        d.countryCode,
                      );
                    },
                    onClosed: () {},
                    useSafeArea: true,
                    // showPhoneCode: true,
                    countryListTheme: CountryListThemeData(
                      inputDecoration: InputDecoration(
                        label: Row(
                          children: [
                            const Icon(Icons.search),
                            const Expanded(child: SizedBox()),
                            Text(Loc.searchInCountries()),
                          ],
                        ),
                        // icon: Icon(Icons.search),
                      ),
                      bottomSheetHeight: context.height - 100.h,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(
                          10,
                        ),
                        topLeft: Radius.circular(
                          10,
                        ),
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      5,
                    ),
                    color: widget.showHint ? Colors.transparent : Colors.white,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.keyboard_arrow_down,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        _country.value.phoneCode,
                        style: getRegularBlack14Style(),
                      ),
                      Gap(
                        5.w,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        // backgroundImage: MemoryImage(_country.value.flagEmoji),
                        radius: 15,
                        child: Text(
                          _country.value.flagEmoji,
                          style: TextStyle(fontSize: 20.sp),
                        ),
                      ),
                      if (widget.addPenIcon != null &&
                          widget.addPenIcon == true)
                        Gap(
                          5.w,
                        ),
                      if (widget.addPenIcon != null &&
                          widget.addPenIcon == true)
                        SizedBox(
                          // width and height make no effect, to be fixed
                          width: 15.w,
                          height: 15.h,
                          child: Picture(
                            getAssetIcon('pen.svg'),
                            // width: 10,
                            // height: 10,
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        label: widget.showHint ? Text(Loc.phoneNumber()) : null,
        hintText: Loc.phone_number(),
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
        // prefixIcon: Container(
        //   width: 60.w,
        //   margin: EdgeInsets.only(left: 10.w),
        //   decoration: BoxDecoration(
        //     border: Border(
        //       right: BorderSide(
        //         color: primary.withOpacity(0.1),
        //       ),
        //       left: BorderSide(
        //         color: primary.withOpacity(0.1),
        //       ),
        //     ),
        //   ),
        //   child: Picture(
        //     getAssetIcon('phone.svg'),
        //   ),
        // ),
        filled: true,
        // labelText: Loc.phone(),
      ),
    );
  }

  String? validate(String? value) {
    if (!validString(value)) {
      return Loc.emptyPhoneNumber();
    } else if (!isPhoneNumberValid(value, _country.value.phoneCode)) {
      if (_country.value.phoneCode == '20') {
        return Loc.egyptUnvaildPhoneNumber();
      } else {
        return Loc.generalUnvaildPhoneNumber();
      }
    }
    return null;
  }
}
