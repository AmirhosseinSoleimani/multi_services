import 'package:flutter/material.dart';
import 'package:multi_service/src/shared/theme/text_theme_extension.dart';

import 'color_theme_extension.dart';


abstract class AppThemeData {
  ThemeData get materialThemeData;
  ThemeData get cupertinoThemeData;
  ThemeData get materialAuthSectionsThemeData;
  ThemeData get cupertinoAuthSectionsThemeData;

  static const LinearGradient authLinearGradientBorder = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xff696DA5),
      Color(0xff434046),
    ],
  );
}

class DarkThemeData extends AppThemeData {
  @override
  ThemeData get materialThemeData => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    extensions: [
      TextThemeExtension.dark(),
      ColorThemeExtension.dark(),
    ],
  );

  @override
  // TODO: implement cupertinoAuthSectionsThemeData
  ThemeData get cupertinoAuthSectionsThemeData => throw UnimplementedError();

  @override
  // TODO: implement cupertinoThemeData
  ThemeData get cupertinoThemeData => throw UnimplementedError();

  @override
  // TODO: implement materialAuthSectionsThemeData
  ThemeData get materialAuthSectionsThemeData => throw UnimplementedError();
}

class LightThemeData extends AppThemeData {
  @override
  ThemeData get materialThemeData => ThemeData(
    brightness: Brightness.light,
    extensions: [
      ColorThemeExtension.dark(),
    ],
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          fontFamily: 'YekanBakhNoEn', package: 'component_library'),
    ),
  );

  @override
  // TODO: implement cupertinoAuthSectionsThemeData
  ThemeData get cupertinoAuthSectionsThemeData => throw UnimplementedError();

  @override
  // TODO: implement cupertinoThemeData
  ThemeData get cupertinoThemeData => throw UnimplementedError();

  @override
  // TODO: implement materialAuthSectionsThemeData
  ThemeData get materialAuthSectionsThemeData => throw UnimplementedError();

}
