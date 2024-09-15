import 'package:flutter/material.dart';

class ColorThemeExtension
    extends ThemeExtension<ColorThemeExtension> {
  final Color? lightSilver,
      white,
      black;

  ColorThemeExtension({
    required this.lightSilver,
    required this.black,
    required this.white,
  });

  @override
  ColorThemeExtension copyWith({
    Color? lightSilver,
    Color? black,
    Color? white,
  }) {
    return ColorThemeExtension(
      lightSilver: lightSilver ?? this.lightSilver,
      black: black ?? this.black,
      white: white ?? this.white
    );
  }

  factory ColorThemeExtension.dark() => ColorThemeExtension(
    lightSilver: _convertColor('#dfdfdf'),
    black: _convertColor('#000000'),
    white: _convertColor('#ffffff'),
  );

  static Color _convertColor(String hexCode) =>
      Color(int.parse('0xFF${hexCode.replaceAll('#', '')}'));

  @override
  ThemeExtension<ColorThemeExtension> lerp(
      ColorThemeExtension? other, double t) {
    if (other is! ColorThemeExtension) {
      return this;
    }

    return ColorThemeExtension(
      lightSilver: Color.lerp(lightSilver, other.lightSilver, t),
      black: Color.lerp(black, other.black, t),
      white: Color.lerp(white, other.white, t)
    );
  }
}
