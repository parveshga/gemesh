import 'package:flutter/material.dart';
import 'package:gemesh/Widgets/Styles/theme_helper.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    this.alignment,
    this.height,
    this.width,
    this.padding,
    this.decoration,
    this.child,
    this.onTap,
  });

  final Alignment? alignment;

  final double? height;

  final double? width;

  final EdgeInsetsGeometry? padding;

  final BoxDecoration? decoration;

  final Widget? child;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: iconButtonWidget,
          )
        : iconButtonWidget;
  }

  Widget get iconButtonWidget => SizedBox(
        height: height ?? 0,
        width: width ?? 0,
        child: IconButton(
          padding: EdgeInsets.zero,
          icon: Container(
            height: height ?? 0,
            width: width ?? 0,
            padding: padding ?? EdgeInsets.zero,
            decoration: decoration ??
                BoxDecoration(
                  color: appTheme.whiteA700,
                  borderRadius: BorderRadius.circular(6),
                ),
            child: child,
          ),
          onPressed: onTap,
        ),
      );
}

/// Extension on [CustomIconButton] to facilitate inclusion of all types of border style etc
extension IconButtonStyleHelper on CustomIconButton {
  static BoxDecoration get fillPrimary => BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(15),
      );
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray5001,
        borderRadius: BorderRadius.circular(17),
      );
  static BoxDecoration get gradientLightBlueToOnErrorContainer => BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          begin: const Alignment(-0.07, 0),
          end: const Alignment(1.05, 1),
          colors: [
            appTheme.lightBlue900,
            theme.colorScheme.onErrorContainer,
          ],
        ),
      );
  static BoxDecoration get fillWhiteA => BoxDecoration(
        color: appTheme.whiteA700,
        borderRadius: BorderRadius.circular(30),
      );
  static BoxDecoration get gradientLightBlueToOnErrorContainerTL8 =>
      BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          begin: const Alignment(-0.07, 0),
          end: const Alignment(1.05, 1),
          colors: [
            appTheme.lightBlue900,
            theme.colorScheme.onErrorContainer,
          ],
        ),
      );
  static BoxDecoration get fillPrimaryTL6 => BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(6),
      );
  static BoxDecoration get gradientLightBlueToOnErrorContainerTL20 =>
      BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: const Alignment(-0.07, 0),
          end: const Alignment(1.05, 1),
          colors: [
            appTheme.lightBlue900,
            theme.colorScheme.onErrorContainer,
          ],
        ),
      );
  static BoxDecoration get fillPrimaryTL11 => BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(11),
      );
  static BoxDecoration get fillLightBlue => BoxDecoration(
        color: appTheme.lightBlue300,
        borderRadius: BorderRadius.circular(21),
      );
  static BoxDecoration get outlinePrimary => BoxDecoration(
        color: appTheme.whiteA700,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: theme.colorScheme.primary,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.18),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(
              0,
              5,
            ),
          ),
        ],
      );
  static BoxDecoration get fillWhiteATL14 => BoxDecoration(
        color: appTheme.whiteA700,
        borderRadius: BorderRadius.circular(14),
      );
  static BoxDecoration get fillLightBlueTL14 => BoxDecoration(
        color: appTheme.lightBlue800,
        borderRadius: BorderRadius.circular(14),
      );
  static BoxDecoration get outlineBlack => BoxDecoration(
        color: appTheme.whiteA700,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.18),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(
              0,
              5,
            ),
          ),
        ],
      );
  static BoxDecoration get fillBlue => BoxDecoration(
        color: appTheme.blue100,
        borderRadius: BorderRadius.circular(20),
      );
  static BoxDecoration get fillLightBlueTL6 => BoxDecoration(
        color: appTheme.lightBlue900,
        borderRadius: BorderRadius.circular(6),
      );
  static BoxDecoration get outlineLightBlue => BoxDecoration(
        color: appTheme.whiteA700,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: appTheme.lightBlue300,
          width: 1,
        ),
      );
  static BoxDecoration get outlineLightBlue1 => BoxDecoration(
        color: appTheme.whiteA700,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: Colors.white,
          width: 1,
        ),
      );
}
