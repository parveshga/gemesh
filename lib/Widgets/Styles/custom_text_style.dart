import 'package:flutter/material.dart';
import 'package:gemesh/Constants/size_constants.dart';
import 'package:gemesh/Widgets/Styles/theme_helper.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style

  static get headlineLargeLightblue90001 =>
      theme.textTheme.headlineLarge!.copyWith(
          color: appTheme.gray900,
          fontSize: 32.fSize,
          fontWeight: FontWeight.w500);
  static get bodyMediumBluegray100 => theme.textTheme.bodyMedium!.copyWith(
        color: Colors.grey,
        fontSize: 13,
      );
  static get bodyMediumIndigo5099 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.indigo5099,
        fontSize: 13,
      );
  static get bodyMediumLightblue300 => theme.textTheme.bodyMedium!
      .copyWith(color: appTheme.lightBlue300, fontSize: 16);
  static get bodyMediumWhiteA700 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 14,
      );
  static get bodyMediumffffffff => theme.textTheme.bodyMedium!.copyWith(
        color: const Color(0XFFFFFFFF),
        fontSize: 15,
      );
  static get bodySmall12 => theme.textTheme.bodySmall!.copyWith(
        fontSize: 12,
      );
  static get bodySmall99ebebf5 => theme.textTheme.bodySmall!.copyWith(
        color: const Color(0X99EBEBF5),
        fontSize: 13,
      );
  static get bodySmallBlack900 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.black900,
        fontSize: 16,
      );
  static get bodySmallBlack90011 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.black900,
        fontSize: 14,
      );
  static get bodySmallBlack90012 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.black900,
        fontSize: 14,
      );
  static get bodySmallBluegray100 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.blueGray100,
        fontSize: 13,
      );
  static get bodySmallGray800 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray800,
        fontSize: 15,
      );
  static get bodySmallGray900 => theme.textTheme.bodySmall!
      .copyWith(color: appTheme.gray900, fontSize: 14);
  static get bodySmallInterBlack900 =>
      theme.textTheme.bodySmall!.inter.copyWith(
        color: appTheme.black900,
        fontSize: 12,
      );
  // Display text style
  static get displayLargeWhiteA700 => theme.textTheme.displayLarge!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 60,
        fontWeight: FontWeight.w400,
      );
  // Label text style
  static get labelLargeBluegray100 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.blueGray100,
      );
  static get labelLargeBluegray300 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.blueGray300,
        fontWeight: FontWeight.w600,
      );
  static get labelLargeBold => theme.textTheme.labelLarge!.copyWith(
        fontWeight: FontWeight.w700,
      );
  static get labelLargeGray900 => theme.textTheme.labelLarge!.copyWith(
      color: appTheme.gray900, fontWeight: FontWeight.w600, fontSize: 16);
  static get labelLargeGray90013 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray900,
        fontSize: 16,
      );
  static get labelLargeGray900_1 => theme.textTheme.labelLarge!
      .copyWith(color: appTheme.gray900, fontSize: 16);
  static get labelLargeGreen700 => theme.textTheme.labelLarge!
      .copyWith(color: appTheme.green700, fontSize: 16);
  static get labelLargeLightblue300 => theme.textTheme.labelLarge!
      .copyWith(color: appTheme.lightBlue300, fontSize: 14);
  static get labelLargeLightblue300SemiBold =>
      theme.textTheme.labelLarge!.copyWith(
        color: appTheme.lightBlue300,
        fontWeight: FontWeight.w600,
      );
  static get labelLargeLightblue900 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.lightBlue900,
        fontWeight: FontWeight.w600,
      );
  static get labelLargeLightblue900_1 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.lightBlue900,
      );
  static get labelLargePrimary => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w600,
      );
  static get labelLargeSemiBold => theme.textTheme.labelLarge!
      .copyWith(fontWeight: FontWeight.w600, fontSize: 16);
  static get labelLargeWhiteA700 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w600,
      );
  static get labelLargeWhiteA700Bold => theme.textTheme.labelLarge!.copyWith(
      color: appTheme.whiteA700, fontWeight: FontWeight.w700, fontSize: 15);
  static get labelLargeWhiteA700_1 => theme.textTheme.labelLarge!
      .copyWith(color: appTheme.whiteA700, fontSize: 14);
  static get labelLargeff000000 => theme.textTheme.labelLarge!.copyWith(
      color: const Color(0XFF000000),
      fontWeight: FontWeight.w600,
      fontSize: 14);
  static get labelLargeff4db8f8 => theme.textTheme.labelLarge!.copyWith(
      color: const Color(0XFF4DB8F8),
      fontWeight: FontWeight.w600,
      fontSize: 14);
  static get labelMedium10 => theme.textTheme.labelMedium!.copyWith(
        fontSize: 16,
      );
  static get labelMediumBluegray100 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.blueGray100,
      );
  static get labelMediumBluegray10010 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.blueGray100,
        fontSize: 10,
      );
  static get labelMediumGray800 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.gray800,
        fontSize: 13,
      );
  static get labelMediumGray900 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.gray900,
        fontSize: 14,
      );
  static get labelMediumGray900SemiBold =>
      theme.textTheme.labelMedium!.copyWith(
        color: appTheme.gray900,
        fontWeight: FontWeight.w600,
      );
  static get labelMediumGray900_1 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.gray900,
      );
  static get labelMediumLightblue300 => theme.textTheme.labelMedium!.copyWith(
      color: appTheme.lightBlue900, fontSize: 14, fontWeight: FontWeight.w700);
  static get labelMediumLightblue900Bold =>
      theme.textTheme.labelMedium!.copyWith(
        color: appTheme.lightBlue300,
        fontSize: 14,
      );
  static get labelMediumPrimary => theme.textTheme.labelMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      );
  static get labelMediumSemiBold => theme.textTheme.labelMedium!.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      );
  static get labelMediumWhiteA700 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.whiteA700,
      );
  static get labelMediumWhiteA70010 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 15,
      );
  static get labelMediumWhiteA700SemiBold =>
      theme.textTheme.labelMedium!.copyWith(
          color: appTheme.whiteA700, fontWeight: FontWeight.w600, fontSize: 15);
  static get labelSmallGray800 => theme.textTheme.labelSmall!.copyWith(
        color: appTheme.gray800,
        fontSize: 12,
      );
  static get labelSmallRed500 => theme.textTheme.labelSmall!.copyWith(
        color: appTheme.red500,
      );

  static get labelSmallPrimary_1 => theme.textTheme.labelSmall!.copyWith(
        color: appTheme.primary,
      );
  // Title text style
  static get titleMediumBlack900 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallGray900 => theme.textTheme.titleSmall!
      .copyWith(color: appTheme.gray900, fontSize: 20);
  static get titleSmallGray900Medium => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray900,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallLightblue900 => theme.textTheme.titleSmall!.copyWith(
      color: appTheme.lightBlue900, fontWeight: FontWeight.w600, fontSize: 16);
  static get titleSmallMedium => theme.textTheme.titleSmall!.copyWith(
        fontWeight: FontWeight.w500,
      );
  static get titleSmallSemiBold => theme.textTheme.titleSmall!
      .copyWith(fontWeight: FontWeight.w600, fontSize: 16);
  static get titleSmallWhiteA700 => theme.textTheme.titleSmall!.copyWith(
      color: appTheme.whiteA700, fontWeight: FontWeight.w600, fontSize: 16);
  static get titleSmallWhiteA700Medium => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallWhiteA700_1 => theme.textTheme.titleSmall!
      .copyWith(color: appTheme.whiteA700, fontSize: 18);
}

extension on TextStyle {
  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }
}
