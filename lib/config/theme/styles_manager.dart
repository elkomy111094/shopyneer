import 'package:flutter/material.dart';
import 'package:shopyneer/config/theme/theme.dart';
import 'package:size_config/size_config.dart';

import 'colors.dart';

TextStyle _getTextStyle(
  double fontSize,
  FontWeight fontWeight,
  Color color,
) {
  return TextStyle(
    fontSize: fontSize.sp + 1,
    fontWeight: fontWeight,
    fontFamily: cairo,
    color: color,
  );
}

//New
TextStyle getBoldBlack18Style() {
  return _getTextStyle(
    18,
    FontWeight.bold,
    Colors.black,
  );
}

TextStyle getBoldBlack32Style() {
  return _getTextStyle(
    32,
    FontWeight.bold,
    Colors.black,
  );
}

TextStyle getBoldBlue16Style() {
  return _getTextStyle(
    16,
    FontWeight.w600,
    primary,
  );
}

TextStyle getRegularRed16Style() {
  return _getTextStyle(
    16,
    FontWeight.w400,
    Colors.red,
  );
}

TextStyle getRegularRed12Style() {
  return _getTextStyle(
    12,
    FontWeight.w400,
    Colors.red,
  );
}

TextStyle getMeduimRed18Style() {
  return _getTextStyle(
    18,
    FontWeight.w500,
    Colors.red,
  );
}

TextStyle getBoldBlack16Style() {
  return _getTextStyle(
    14,
    FontWeight.w700,
    Colors.black,
  );
}

TextStyle getBoldPrimary16Style() {
  return _getTextStyle(
    16,
    FontWeight.w700,
    primary,
  );
}

TextStyle getBoldPrimary19Style() {
  return _getTextStyle(
    19,
    FontWeight.w700,
    primary,
  );
}

TextStyle getBoldBlack12Style() {
  return _getTextStyle(
    12,
    FontWeight.w700,
    Colors.black,
  );
}

TextStyle getBoldBlack14Style() {
  return _getTextStyle(
    14,
    FontWeight.w700,
    Colors.black,
  );
}

TextStyle getBoldWhite16Style() {
  return _getTextStyle(
    16,
    FontWeight.bold,
    Colors.white,
  );
}

TextStyle getBoldWhite32Style() {
  return _getTextStyle(
    32,
    FontWeight.bold,
    Colors.white,
  );
}

TextStyle getRegularWhite14Style() {
  return _getTextStyle(
    14,
    FontWeight.w400,
    Colors.white,
  );
}

TextStyle getW700White16Style() {
  return _getTextStyle(
    16,
    FontWeight.bold,
    Colors.white,
  );
}

TextStyle getHeavyBlack18Style() {
  return _getTextStyle(
    18,
    FontWeight.w900,
    Colors.black,
  );
}

TextStyle getBoldBlack22Style() {
  return _getTextStyle(
    22,
    FontWeight.w700,
    Colors.black,
  );
}

TextStyle getLightGray18Style() {
  return _getTextStyle(
    18,
    FontWeight.w300,
    grey71,
  );
}

TextStyle getBoldBlack20Style() {
  return _getTextStyle(
    20,
    FontWeight.w700,
    Colors.black,
  );
}

TextStyle getBoldGray18Style() {
  return _getTextStyle(
    18,
    FontWeight.bold,
    greyMedium,
  );
}

TextStyle getRegularBlack16Style() {
  return _getTextStyle(
    16,
    FontWeight.w400,
    Colors.black,
  );
}

TextStyle getBoldGreyD016Style() {
  return _getTextStyle(
    16,
    FontWeight.w700,
    greyD0,
  );
}

TextStyle getBoldGreyD014Style() {
  return _getTextStyle(
    14,
    FontWeight.w600,
    greyMedium,
  );
}

TextStyle getVBoldWhite16Style() {
  return _getTextStyle(
    16,
    FontWeight.bold,
    Colors.white,
  );
}

TextStyle getRegularBlack20Style() {
  return _getTextStyle(
    20,
    FontWeight.w400,
    Colors.black,
  );
}

TextStyle getPrimaryBoldStyle20Style() {
  return _getTextStyle(
    20,
    FontWeight.bold,
    primary,
  );
}

TextStyle getPrimaryBoldStyle30Style() {
  return _getTextStyle(
    30,
    FontWeight.bold,
    primary,
  );
}

TextStyle getRegularGray16Style() {
  return _getTextStyle(
    16,
    FontWeight.w400,
    greyMedium,
  );
}

TextStyle getRegularBlack14Style() {
  return _getTextStyle(
    14,
    FontWeight.w400,
    Colors.black,
  );
}

TextStyle getRegularPrimary14Style() {
  return _getTextStyle(
    14,
    FontWeight.w400,
    primary,
  );
}

TextStyle getBoldPrimary18Style() {
  return _getTextStyle(
    18,
    FontWeight.bold,
    primary,
  );
}

TextStyle getRegularGreyA414Style() {
  return _getTextStyle(
    14,
    FontWeight.w400,
    grey4A,
  );
}

TextStyle getRegularBlack12Style() {
  return _getTextStyle(
    12,
    FontWeight.w400,
    Colors.black,
  );
}

TextStyle getRegularPrimary12Style() {
  return _getTextStyle(
    12,
    FontWeight.w400,
    primary,
  );
}

TextStyle getRegularGrey12Style() {
  return _getTextStyle(
    12,
    FontWeight.w400,
    grey80,
  );
}

TextStyle getRegularPrimaryBold12Style() {
  return _getTextStyle(
    12,
    FontWeight.w700,
    primary,
  );
}

TextStyle getRegularGrey13Style() {
  return _getTextStyle(
    13,
    FontWeight.w400,
    greyMedium,
  );
}

TextStyle getRegularGrey18Style() {
  return _getTextStyle(
    18,
    FontWeight.w500,
    greyMedium,
  );
}

TextStyle getMediumGrey18Style() {
  return _getTextStyle(
    18,
    FontWeight.w500,
    greyMedium,
  );
}

TextStyle getMediumGrey14Style() {
  return _getTextStyle(
    14,
    FontWeight.w500,
    greyMedium,
  );
}

TextStyle getMediumBlack16Style() {
  return _getTextStyle(
    16,
    FontWeight.w500,
    Colors.black,
  );
}

TextStyle getMediumPrimary16Style() {
  return _getTextStyle(
    16,
    FontWeight.w500,
    primary,
  );
}

TextStyle getMediumBlack12Style() {
  return _getTextStyle(
    12,
    FontWeight.w500,
    Colors.black,
  );
}

TextStyle getMediumBlack14Style() {
  return _getTextStyle(
    14,
    FontWeight.w500,
    Colors.black,
  );
}

TextStyle getMediumBlue14Style() {
  return _getTextStyle(
    14,
    FontWeight.w500,
    primary,
  );
}

TextStyle getBoldBlue14Style() {
  return _getTextStyle(
    14,
    FontWeight.w700,
    primary,
  );
}

TextStyle getBoldBlue12Style() {
  return _getTextStyle(
    12,
    FontWeight.w700,
    primary,
  );
}

TextStyle getMediumBlue16Style() {
  return _getTextStyle(
    16,
    FontWeight.w500,
    primary,
  );
}

TextStyle getMediumBlue10Style() {
  return _getTextStyle(
    10,
    FontWeight.w500,
    primary,
  );
}

TextStyle getRegularBlue14Style() {
  return _getTextStyle(
    14,
    FontWeight.w400,
    primary,
  );
}

TextStyle getMediumBlack23Style() {
  return _getTextStyle(
    23,
    FontWeight.w500,
    Colors.black,
  );
}

TextStyle getMediumBlack18Style() {
  return _getTextStyle(
    18,
    FontWeight.w500,
    Colors.black,
  );
}

TextStyle getMediumPrimary18Style() {
  return _getTextStyle(
    18,
    FontWeight.w500,
    primary,
  );
}

TextStyle getMediumBlack20Style() {
  return _getTextStyle(
    20,
    FontWeight.w500,
    Colors.black,
  );
}

TextStyle getMediumWhite20Style() {
  return _getTextStyle(
    20,
    FontWeight.w500,
    Colors.white,
  );
}

TextStyle getBoldWhite22Style() {
  return _getTextStyle(
    22,
    FontWeight.bold,
    Colors.white,
  );
}

TextStyle getMediumWhite12Style() {
  return _getTextStyle(
    12,
    FontWeight.w500,
    Colors.white,
  );
}

TextStyle getThinGrey16Style() {
  return _getTextStyle(
    16,
    FontWeight.w300,
    greyMedium,
  );
}

TextStyle getThinGrey14Style() {
  return _getTextStyle(
    14,
    FontWeight.w200,
    greyMedium,
  );
}

TextStyle getLightGrey14Style() {
  return _getTextStyle(
    14,
    FontWeight.w300,
    greyMedium,
  );
}

TextStyle getLightGrey16Style() {
  return _getTextStyle(
    16,
    FontWeight.w300,
    greyMedium,
  );
}

TextStyle getLightBlack16Style() {
  return _getTextStyle(
    16,
    FontWeight.w300,
    Colors.black,
  );
}

TextStyle getRegularGrey14Style() {
  return _getTextStyle(
    14,
    FontWeight.w400,
    greyMedium,
  );
}

TextStyle getRegularGreen14Style() {
  return _getTextStyle(
    14,
    FontWeight.w400,
    Colors.green,
  );
}
