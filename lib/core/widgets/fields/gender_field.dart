import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shopyneer/core/widgets/picture.dart';
import 'package:size_config/size_config.dart';

import '../../../config/localization/loc_keys.dart';
import '../../../config/theme/colors.dart';
import '../../../config/theme/styles_manager.dart';
import '../../utils/get_asset_path.dart';
import '../../utils/vaildData/valid_data.dart';

class GenderField extends StatefulWidget {
  const GenderField(
      {super.key,
      required this.controller,
      this.focusNode,
      this.confirm,
      this.onValidated,
      this.onFeMaleSelected,
      this.validator,
      this.onMaleSelected,
      this.onContainerShown});

  final TextEditingController controller;
  final FocusNode? focusNode;
  final ValueChanged<String>? confirm;
  final ValueChanged<bool>? onValidated;
  final void Function()? onMaleSelected;
  final void Function()? onFeMaleSelected;
  final String? Function(String?)? validator;
  final VoidCallback? onContainerShown; // Add this callback

  @override
  State<GenderField> createState() => _GenderFieldState();
}

class _GenderFieldState extends State<GenderField>
    with SingleTickerProviderStateMixin {
  ValueNotifier<bool> counter = ValueNotifier<bool>(false);
  final Duration _animationDuration = const Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: counter,
      builder: (context, value, child) {
        if (value && widget.onContainerShown != null) {
          // Notify the parent when the container is shown
          WidgetsBinding.instance.addPostFrameCallback((_) {
            widget.onContainerShown!();
          });
        }

        return Column(
          children: [
            GestureDetector(
              onTap: () {
                counter.value = !counter.value;
              },
              child: TextFormField(
                controller: widget.controller,
                focusNode: widget.focusNode,
                style: getRegularBlack16Style(),
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
                onFieldSubmitted: widget.confirm,
                textAlign: TextAlign.start,
                keyboardType: TextInputType.emailAddress,
                textInputAction: widget.confirm == null
                    ? TextInputAction.next
                    : TextInputAction.done,
                validator: widget.validator,
                decoration: InputDecoration(
                  hintText: Loc.gender(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: primary.withOpacity(0.1),
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: primary.withOpacity(0.1),
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: primary.withOpacity(0.1),
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  labelStyle: getRegularBlack14Style(),
                  enabled: false,
                  prefixIcon: Container(
                    width: 60.w,
                    margin: EdgeInsets.only(left: 10.w),
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: primary.withOpacity(0.1),
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(15.h),
                      child: Picture(
                        getAssetIcon('gender.svg'),
                        color: primary,
                      ),
                    ),
                  ),
                  suffixIcon: AnimatedSwitcher(
                    duration: _animationDuration,
                    child: Container(
                      key: ValueKey(counter.value),
                      width: 60.w,
                      margin: EdgeInsets.only(left: 10.w),
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            color: primary.withOpacity(0.1),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(15.h),
                        child: Picture(
                          getAssetIcon(counter.value
                              ? 'arrow_down.svg'
                              : 'arrow_top.svg'),
                        ),
                      ),
                    ),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
            Gap(10.h),
            AnimatedSize(
              duration: _animationDuration,
              curve: Curves.easeInOut,
              child: counter.value
                  ? Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.grey.withOpacity(0.05), // Shadow color
                            spreadRadius: 0, // How far the shadow spreads
                            blurRadius: 16, // How blurry the shadow is
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.h),
                        child: SizedBox(
                          height: 115.h,
                          child: Card(
                            shadowColor: grey4A,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.h),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      if (widget.onMaleSelected != null) {
                                        widget.onMaleSelected!();
                                      }
                                      counter.value = false;
                                    },
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10.h),
                                          child: Text(
                                            Loc.male(),
                                            style: getRegularBlack16Style(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Divider(
                                    thickness: 1,
                                    color: greyF4,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      if (widget.onFeMaleSelected != null) {
                                        widget.onFeMaleSelected!();
                                      }
                                      counter.value = false;
                                    },
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10.h),
                                          child: Text(
                                            Loc.female(),
                                            style: getRegularBlack16Style(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        );
      },
    );
  }

  String? validate(String? value) {
    if (!validString(value)) {
      return '';
    }
    if (value != null && !validEmail(value)) {
      return '';
    }
    return null;
  }
}
