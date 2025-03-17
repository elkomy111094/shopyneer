import 'package:flutter/material.dart';
import 'package:shopyneer/config/navigation/nav.dart';
import 'package:shopyneer/core/utils/get_asset_path.dart';
import 'package:shopyneer/core/widgets/picture.dart';
import 'package:shopyneer/shared/theme/colors.dart';
import 'package:shopyneer/shared/theme/styles_manager.dart';
import 'package:size_config/size_config.dart';

class AnimatedSearchField extends StatefulWidget {
  void Function(String)? onSubmit;
  String? hint;

  AnimatedSearchField({this.onSubmit, this.hint});

  @override
  _AnimatedSearchFieldState createState() => _AnimatedSearchFieldState();
}

class _AnimatedSearchFieldState extends State<AnimatedSearchField>
    with SingleTickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _searchController,
          onSubmitted: widget.onSubmit,
          style: getRegularPrimary14Style(),
          decoration: InputDecoration(
            hintText: widget.hint ?? "بتدوري علي أيه ... ؟",
            hintStyle: getBoldGreyD014Style(),
            prefixIcon: InkWell(
              onTap: () {
                Nav.searchPage(context, _searchController.text);
              },
              child: Container(
                width: 20.h,
                height: 20.h,
                child: Padding(
                  padding: EdgeInsets.all(10.h),
                  child: Picture(
                    getAssetIcon("search_icon.svg"),
                    width: 20.h,
                    height: 20.h,
                    fit: BoxFit.contain,
                    color: primary,
                  ),
                ),
              ),
            ),
            contentPadding: EdgeInsets.zero,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.h),
                borderSide: BorderSide(color: primary.withOpacity(.5))),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.h),
                borderSide: BorderSide(color: primary.withOpacity(.5))),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.h),
                borderSide: BorderSide(color: primary.withOpacity(.5))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.h),
                borderSide: BorderSide(
                  color: primary,
                )),
          ),
        ),
      ],
    );
  }
}
