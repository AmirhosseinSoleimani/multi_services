import 'package:flutter/material.dart';

class ColorThemeExtension
    extends ThemeExtension<ColorThemeExtension> {
  final Color? darkOrange,
      grey4,
      yellow,
      darkBlue,
      blue,
      grey1,
      grey3,
      green,
      lightBlue,
      purple,
      black,
      backgroundLandingPage1,
      backgroundCustomer,
      backgroundCopyRight,
      backgroundFooter,
      backgroundLandingPage2,
      background3,
      backgroundTopMenu,
      backgroundTopDashboard,
      backgroundNumber,
      backgroundDashboard,
      grey5,
      greyLanguageButton,
      grey6,
      grey2,
      orange,
      lightOrange;

  ColorThemeExtension({
    required this.darkOrange,
    required this.grey4,
    required this.yellow,
    required this.darkBlue,
    required this.blue,
    required this.grey1,
    required this.grey3,
    required this.green,
    required this.lightBlue,
    required this.purple,
    required this.black,
    required this.backgroundLandingPage1,
    required this.backgroundCustomer,
    required this.backgroundCopyRight,
    required this.backgroundFooter,
    required this.backgroundLandingPage2,
    required this.background3,
    required this.backgroundTopMenu,
    required this.backgroundTopDashboard,
    required this.backgroundNumber,
    required this.backgroundDashboard,
    required this.grey5,
    required this.greyLanguageButton,
    required this.grey6,
    required this.grey2,
    required this.orange,
    required this.lightOrange,
  });

  @override
  ColorThemeExtension copyWith({
    Color? darkOrange,
    Color? grey4,
    Color? yellow,
    Color? darkBlue,
    Color? blue,
    Color? grey1,
    Color? grey3,
    Color? green,
    Color? lightBlue,
    Color? purple,
    Color? black,
    Color? backgroundLandingPage1,
    Color? backgroundCustomer,
    Color? backgroundCopyRight,
    Color? backgroundFooter,
    Color? backgroundLandingPage2,
    Color? background3,
    Color? backgroundTopMenu,
    Color? backgroundTopDashboard,
    Color? backgroundNumber,
    Color? backgroundDashboard,
    Color? grey5,
    Color? greyLanguageButton,
    Color? grey6,
    Color? grey2,
    Color? orange,
    Color? lightOrange,
  }) {
    return ColorThemeExtension(
      darkOrange: darkOrange ?? this.darkOrange,
      grey4: grey4 ?? this.grey4,
      yellow: yellow ?? this.yellow,
      darkBlue: darkBlue ?? this.darkBlue,
      blue: blue ?? this.blue,
      grey1: grey1 ?? this.grey1,
      grey3: grey3 ?? this.grey3,
      green: green ?? this.green,
      lightBlue: lightBlue ?? this.lightBlue,
      purple: purple ?? this.purple,
      black: black ?? this.black,
      backgroundLandingPage1:
      backgroundLandingPage1 ?? this.backgroundLandingPage1,
      backgroundCustomer: backgroundCustomer ?? this.backgroundCustomer,
      backgroundCopyRight: backgroundCopyRight ?? this.backgroundCopyRight,
      backgroundFooter: backgroundFooter ?? this.backgroundFooter,
      backgroundLandingPage2:
      backgroundLandingPage2 ?? this.backgroundLandingPage2,
      background3: background3 ?? this.background3,
      backgroundTopMenu: backgroundTopMenu ?? this.backgroundTopMenu,
      backgroundTopDashboard:
      backgroundTopDashboard ?? this.backgroundTopDashboard,
      backgroundNumber: backgroundNumber ?? this.backgroundNumber,
      backgroundDashboard: backgroundDashboard ?? this.backgroundDashboard,
      grey5: grey5 ?? this.grey5,
      greyLanguageButton: greyLanguageButton ?? this.greyLanguageButton,
      grey6: grey6 ?? this.grey6,
      grey2: grey2 ?? this.grey2,
      orange: orange ?? this.orange,
      lightOrange: lightOrange ?? this.lightOrange,
    );
  }

  factory ColorThemeExtension.dark() => ColorThemeExtension(
    darkOrange: _convertColor('#F1613A'),
    grey4: _convertColor('#464E59'),
    yellow: _convertColor('#FED304'),
    darkBlue: _convertColor('#1A2B3C'),
    blue: _convertColor('#294760'),
    grey1: _convertColor('#DCDEDD'),
    grey3: _convertColor('#2F353C'),
    green: _convertColor('#70C669'),
    lightBlue: _convertColor('#53CFF6'),
    purple: _convertColor('#59268F'),
    black: _convertColor('#000000'),
    backgroundLandingPage1: _convertColor('#1B1B1B'),
    backgroundCustomer: _convertColor('#1D1D1D'),
    backgroundCopyRight: _convertColor('#121417'),
    backgroundFooter: _convertColor('#131418'),
    backgroundLandingPage2: _convertColor('#282C34'),
    background3: _convertColor('#2D2F3B'),
    backgroundTopMenu: _convertColor('#30343D'),
    backgroundTopDashboard: _convertColor('#1C2125'),
    backgroundNumber: _convertColor('#1F1F1F'),
    backgroundDashboard: _convertColor('#21262C'),
    grey5: _convertColor('#D0D4D7'),
    greyLanguageButton: _convertColor('#2F353C'),
    grey6: _convertColor('#464E59'),
    grey2: _convertColor('#F2F2F2'),
    orange: _convertColor('#F79039'),
    lightOrange: _convertColor('#FABB77'),
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
      darkOrange: Color.lerp(darkOrange, other.darkOrange, t),
      grey4: Color.lerp(grey4, other.grey4, t),
      yellow: Color.lerp(yellow, other.yellow, t),
      darkBlue: Color.lerp(darkBlue, other.darkBlue, t),
      blue: Color.lerp(blue, other.blue, t),
      grey1: Color.lerp(grey1, other.grey1, t),
      grey3: Color.lerp(grey3, other.grey3, t),
      green: Color.lerp(green, other.green, t),
      lightBlue: Color.lerp(lightBlue, other.lightBlue, t),
      purple: Color.lerp(purple, other.purple, t),
      black: Color.lerp(black, other.black, t),
      backgroundLandingPage1:
      Color.lerp(backgroundLandingPage1, other.backgroundLandingPage1, t),
      backgroundCustomer:
      Color.lerp(backgroundCustomer, other.backgroundCustomer, t),
      backgroundCopyRight:
      Color.lerp(backgroundCopyRight, other.backgroundCopyRight, t),
      backgroundFooter: Color.lerp(backgroundFooter, other.backgroundFooter, t),
      backgroundLandingPage2:
      Color.lerp(backgroundLandingPage2, other.backgroundLandingPage2, t),
      background3: Color.lerp(background3, other.background3, t),
      backgroundTopMenu:
      Color.lerp(backgroundTopMenu, other.backgroundTopMenu, t),
      backgroundNumber: Color.lerp(backgroundNumber, other.backgroundNumber, t),
      backgroundTopDashboard:
      Color.lerp(backgroundTopDashboard, backgroundTopDashboard, t),
      backgroundDashboard:
      Color.lerp(backgroundDashboard, other.backgroundDashboard, t),
      grey5: Color.lerp(grey5, other.grey5, t),
      greyLanguageButton:
      Color.lerp(greyLanguageButton, other.greyLanguageButton, t),
      grey6: Color.lerp(grey6, other.grey6, t),
      grey2: Color.lerp(grey2, other.grey2, t),
      orange: Color.lerp(orange, other.orange, t),
      lightOrange: Color.lerp(lightOrange, other.lightOrange, t),
    );
  }
}
