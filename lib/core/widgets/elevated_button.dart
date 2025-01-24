import 'package:flutter/material.dart';
import 'package:size_config/size_config.dart';

import '../../config/theme/colors.dart';
import '../../config/theme/styles_manager.dart';
import 'loading_widget.dart';

class CustomElevatedButton extends StatelessWidget {
  final double? height;
  final double? width;
  final double? radius;
  final void Function()? onTap;
  Widget? buttonIcon;
  final AssetImage? image;
  final Color? buttonColor;
  final String buttonName;
  final bool? condition;
  final bool? removeShadow;
  final TextStyle? buttonTextStyle;

  CustomElevatedButton({
    super.key,
    this.height,
    this.width,
    this.radius,
    this.buttonIcon,
    this.image,
    required this.onTap,
    required this.buttonName,
    this.buttonColor,
    this.condition = true,
    this.removeShadow = false,
    this.buttonTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 50.h,
      child: condition == true
          ? ElevatedButton(
              style: ButtonStyle(
                elevation: const WidgetStatePropertyAll(0),
                padding: WidgetStateProperty.all(EdgeInsets.zero),
                backgroundColor: WidgetStateProperty.all(
                  buttonColor ?? primary,
                ),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(radius ?? 5),
                  ),
                ),
              ),
              onPressed: onTap,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buttonIcon ?? SizedBox(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      buttonName,
                      style: buttonTextStyle ?? getW700White16Style(),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ))
          : const Center(
              child: LoadingWidget(),
            ),
    );
  }
}
