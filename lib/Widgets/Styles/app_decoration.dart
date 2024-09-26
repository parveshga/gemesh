import 'package:flutter/material.dart';
import 'package:gemesh/Constants/size_constants.dart';
import 'package:gemesh/Widgets/Styles/theme_helper.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillBlack => BoxDecoration(
        color: appTheme.black900.withOpacity(0.2),
      );
  static BoxDecoration get fillBlue => BoxDecoration(
        color: appTheme.blue100,
      );
  static BoxDecoration get fillBlue50 => BoxDecoration(
        color: appTheme.blue50,
      );
  static BoxDecoration get fillBlue20001 => BoxDecoration(
        color: appTheme.blue20001,
      );
  static BoxDecoration get fillBlue10003 => BoxDecoration(
        color: appTheme.blue10003,
      );
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray900,
      );
  static BoxDecoration get fillGray900 => BoxDecoration(
        color: appTheme.gray900.withOpacity(0.25),
      );
  static BoxDecoration get fillGreen => BoxDecoration(
        color: appTheme.green700,
      );

  static BoxDecoration get fillGreenOn => BoxDecoration(
        color: appTheme.green5001,
      );
  static BoxDecoration get fillGreen5001 => BoxDecoration(
        color: appTheme.green5001,
      );
  static BoxDecoration get fillLightBlue => BoxDecoration(
        color: appTheme.lightBlue300,
      );
  static BoxDecoration get fillOnError => BoxDecoration(
        color: theme.colorScheme.onError,
      );
  static BoxDecoration get fillPrimary => BoxDecoration(
        color: theme.colorScheme.primary,
      );
  static BoxDecoration get fillPrimaryContainer => BoxDecoration(
        color: theme.colorScheme.primaryContainer,
      );
  static BoxDecoration get fillRed => BoxDecoration(
        color: appTheme.red100,
      );
  static BoxDecoration get fillWhiteA => BoxDecoration(
        color: appTheme.whiteA700,
      );

  // Gradient decorations
  static BoxDecoration get gradientLightBlueToOnErrorContainer => BoxDecoration(
        gradient: LinearGradient(
          begin: const Alignment(0.21, 0.77),
          end: const Alignment(1.05, 1.07),
          colors: [
            appTheme.lightBlue900,
            theme.colorScheme.onErrorContainer,
          ],
        ),
      );

  // Linear decorations
  static BoxDecoration get linear => BoxDecoration(
        gradient: LinearGradient(
          begin: const Alignment(-0.07, -0.08),
          end: const Alignment(1.05, 1.07),
          colors: [
            appTheme.lightBlue900,
            theme.colorScheme.onErrorContainer,
          ],
        ),
      );

  // Outline decorations
  static BoxDecoration get outlineBlack => BoxDecoration(
        color: appTheme.whiteA700,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.05),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(
              0,
              2,
            ),
          ),
        ],
      );

  static BoxDecoration get outlineGreen => BoxDecoration(
        color: appTheme.whiteA700,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.05),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(
              0,
              2,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBlack900 => const BoxDecoration();
  static BoxDecoration get outlineLightBlue => BoxDecoration(
        color: appTheme.whiteA700,
        border: Border.all(
          color: appTheme.lightBlue300,
          width: 1,
        ),
      );
  static BoxDecoration get outlineLightBlue3001 => BoxDecoration(
        color: appTheme.blue20001,
        border: Border.all(
          color: appTheme.lightBlue300,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineLightBlue3002 => BoxDecoration(
        color: appTheme.blue20001,
        border: Border.all(
          color: appTheme.lightBlue300,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlinePrimary => BoxDecoration(
        color: theme.colorScheme.primary,
        border: Border.all(
          color: theme.colorScheme.primary,
          width: 1,
        ),
      );
  static BoxDecoration get outlinePrimary1 => BoxDecoration(
        border: Border.all(
          color: theme.colorScheme.primary,
          width: 1,
        ),
      );

  // P decorations
  static BoxDecoration get p3 => BoxDecoration(
        color: appTheme.gray5001,
      );

  static BoxDecoration get p1 => BoxDecoration(
        color: appTheme.lightBlue300,
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder15 => BorderRadius.circular(
        15,
      );
  static BorderRadius get circleBorder13 => BorderRadius.circular(
        13,
      );
  static BorderRadius get circleBorder16 => BorderRadius.circular(
        16,
      );
  static BorderRadius get circleBorder18 => BorderRadius.circular(
        18,
      );
  static BorderRadius get circleBorder21 => BorderRadius.circular(
        21,
      );
  static BorderRadius get circleBorder27 => BorderRadius.circular(
        27,
      );
  static BorderRadius get circleBorder30 => BorderRadius.circular(
        30,
      );
  static BorderRadius get circleBorder31 => BorderRadius.circular(
        31,
      );
  static BorderRadius get circleBorder38 => BorderRadius.circular(
        38,
      );
  static BorderRadius get circleBorder42 => BorderRadius.circular(
        42,
      );

  // Custom borders
  static BorderRadius get customBorderBL4 => const BorderRadius.vertical(
        bottom: Radius.circular(4),
      );
  static BorderRadius get customBorderBL8 => const BorderRadius.vertical(
        bottom: Radius.circular(8),
      );
  static BorderRadius get customBorderTL20 => const BorderRadius.vertical(
        top: Radius.circular(20),
      );
  static BorderRadius get customBorderTL4 => const BorderRadius.vertical(
        top: Radius.circular(4),
      );
  static BorderRadius get customBorderTL8 => const BorderRadius.vertical(
        top: Radius.circular(8),
      );

  // Rounded borders
  static BorderRadius get roundedBorder => BorderRadius.circular(
        20,
      );
  static BorderRadius get roundedBorder11 => BorderRadius.circular(
        11,
      );
  static BorderRadius get roundedBorder5 => BorderRadius.circular(
        5,
      );
  static BorderRadius get roundedBorder6 => BorderRadius.circular(
        20,
      );
  static BorderRadius get roundedBorder8 => BorderRadius.circular(
        8,
      );
  static BorderRadius get roundedBorder16 => BorderRadius.circular(
        16,
      );
  static BorderRadius get roundedBorder34 => BorderRadius.circular(
        34,
      );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
    