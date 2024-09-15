import 'package:flutter/material.dart';

class TextThemeExtension
    extends ThemeExtension<TextThemeExtension> {
  final TextStyle mobileBold16;
  final TextStyle mobileRegular16;
  final TextStyle mobileLight16;
  final TextStyle mobileBold14;
  final TextStyle mobileRegular14;
  final TextStyle mobileLight14;
  final TextStyle mobileBold12;
  final TextStyle mobileRegular12;
  final TextStyle mobileLight12;
  final TextStyle mobileBold10;
  final TextStyle mobileRegular10;
  final TextStyle mobileLight10;
  final TextStyle lineChartTitle;

  TextThemeExtension({
    required this.mobileBold16,
    required this.mobileRegular16,
    required this.mobileLight16,
    required this.mobileBold14,
    required this.mobileRegular14,
    required this.mobileLight14,
    required this.mobileBold12,
    required this.mobileRegular12,
    required this.mobileLight12,
    required this.mobileBold10,
    required this.mobileRegular10,
    required this.mobileLight10,
    required this.lineChartTitle,
  });
  static const baseTextStyle = TextStyle(
    fontFamily: 'YekanBakhNoEn',
    package: 'component_library',
  );
  factory TextThemeExtension.dark() => TextThemeExtension(
    mobileBold16: baseTextStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      height: 24 / 16,
    ),
    mobileRegular16: baseTextStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 24 / 16,
    ),
    mobileLight16: baseTextStyle.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w300,
      height: 24 / 16,
    ),
    mobileBold14: baseTextStyle.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      height: 22 / 14,
    ),
    mobileRegular14: baseTextStyle.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 22 / 14,
    ),
    mobileLight14: baseTextStyle.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w300,
      height: 22 / 14,
    ),
    mobileBold12: baseTextStyle.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w700,
      height: 18 / 12,
    ),
    mobileRegular12: baseTextStyle.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 18 / 12,
    ),
    mobileLight12: baseTextStyle.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w300,
      height: 18 / 12,
    ),
    mobileBold10: baseTextStyle.copyWith(
      fontSize: 10,
      fontWeight: FontWeight.w700,
      height: 16 / 10,
    ),
    mobileRegular10: baseTextStyle.copyWith(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      height: 16 / 10,
    ),
    mobileLight10: baseTextStyle.copyWith(
      fontSize: 10,
      fontWeight: FontWeight.w300,
      height: 16 / 10,
    ),
    lineChartTitle: const TextStyle(
      fontFamily: 'RobotoMono',
      package: 'component_library',
      fontWeight: FontWeight.w700,
      fontSize: 10,
      height: 18 / 10,
    ),
  );

  @override
  ThemeExtension<TextThemeExtension> lerp(
      TextThemeExtension? other, double t) {
    if (other is! TextThemeExtension) return this;
    return TextThemeExtension.dark();
  }

  @override
  TextThemeExtension copyWith({
    TextStyle? mobileBold16,
    TextStyle? mobileRegular16,
    TextStyle? mobileLight16,
    TextStyle? mobileBold14,
    TextStyle? mobileRegular14,
    TextStyle? mobileLight14,
    TextStyle? mobileBold12,
    TextStyle? mobileRegular12,
    TextStyle? mobileLight12,
    TextStyle? mobileBold10,
    TextStyle? mobileRegular10,
    TextStyle? mobileLight10,
    TextStyle? lineChartTitle,
  }) {
    return TextThemeExtension(
      mobileBold16: mobileBold16 ?? this.mobileBold16,
      mobileRegular16: mobileRegular16 ?? this.mobileRegular16,
      mobileLight16: mobileLight16 ?? this.mobileLight16,
      mobileBold14: mobileBold14 ?? this.mobileBold14,
      mobileRegular14: mobileRegular14 ?? this.mobileRegular14,
      mobileLight14: mobileLight14 ?? this.mobileLight14,
      mobileBold12: mobileBold12 ?? this.mobileBold12,
      mobileRegular12: mobileRegular12 ?? this.mobileRegular12,
      mobileLight12: mobileLight12 ?? this.mobileLight12,
      mobileBold10: mobileBold10 ?? this.mobileBold10,
      mobileRegular10: mobileRegular10 ?? this.mobileRegular10,
      mobileLight10: mobileLight10 ?? this.mobileLight10,
      lineChartTitle: lineChartTitle ?? this.lineChartTitle,
    );
  }
}
