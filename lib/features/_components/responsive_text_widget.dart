import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/theme_utils.dart';

// default font size 16
// default font weight regular 400

TextStyle responsiveTextStyle(
  BuildContext context, {
  Color? color,
  double defaultFontSize = 16,
  double? desktopFontSize,
  double? tabletFontSize,
  TextDecoration? decoration,
  FontWeight defaultFontWeight = FontWeight.w400,
  FontWeight? desktopFontWeight,
}) {
  return textTheme(context).titleMedium!.copyWith(
        color: color,
        fontWeight: ResponsiveValue<FontWeight?>(
          context,
          defaultValue: defaultFontWeight,
          conditionalValues: [
            Condition.largerThan(
              name: TABLET,
              value: desktopFontWeight,
            ),
          ],
        ).value,
        decoration: decoration,
        fontSize: ResponsiveValue(
          context,
          defaultValue: defaultFontSize,
          conditionalValues: [
            Condition.equals(
              name: TABLET,
              value: tabletFontSize,
            ),
            Condition.largerThan(
              name: TABLET,
              value: desktopFontSize,
            ),
          ],
        ).value,
      );
}

class AppText extends StatelessWidget {
  final String text;
  final String? desktopText;
  final Color? color;
  final double defaultFontSize;
  final double? desktopFontSize;
  final double? tabletFontSize;
  final FontWeight defaultFontWeight;
  final TextDecoration? decoration;
  final FontWeight? desktopFontWeight;
  final TextAlign? defaultTextAlign;
  final TextAlign? desktopTextAlign;
  final int? maxLines;
  const AppText(
    this.text, {
    super.key,
    this.color = kcDarkBlue,
    this.defaultFontSize = 16,
    this.tabletFontSize,
    this.desktopFontSize,
    this.defaultFontWeight = FontWeight.w400,
    this.desktopFontWeight,
    this.defaultTextAlign,
    this.desktopTextAlign,
    this.desktopText,
    this.decoration,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      ResponsiveValue<String>(
        context,
        defaultValue: text,
        conditionalValues: [
          Condition.largerThan(
            name: TABLET,
            value: desktopText ?? text,
          ),
        ],
      ).value!,
      maxLines: maxLines,
      overflow: maxLines == null ? null : TextOverflow.ellipsis,
      style: responsiveTextStyle(
        context,
        color: color,
        defaultFontSize: defaultFontSize,
        decoration: decoration,
        desktopFontSize: desktopFontSize,
        tabletFontSize: tabletFontSize,
        defaultFontWeight: defaultFontWeight,
        desktopFontWeight: desktopFontWeight,
      ),
      textAlign: ResponsiveValue<TextAlign?>(
        context,
        defaultValue: defaultTextAlign,
        conditionalValues: [
          Condition.largerThan(
            name: TABLET,
            value: desktopTextAlign,
          ),
        ],
      ).value,
    );
  }
}
