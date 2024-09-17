import 'package:flutter/material.dart';
import 'package:super_app_behpardaz/src/shared/resources/color_manager.dart';
import 'package:super_app_behpardaz/src/shared/resources/font_manager.dart';
import 'package:super_app_behpardaz/src/shared/resources/style_manager.dart';
import 'package:super_app_behpardaz/src/shared/resources/value_manager.dart';


abstract class AppThemeData {
  ThemeData get materialThemeData;
  ThemeData get cupertinoThemeData;
}

class DarkThemeData extends AppThemeData {
  @override
  ThemeData get materialThemeData => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme(
      primary: ColorDarkManager.primary,
      onPrimary: ColorDarkManager.green,

      secondary: ColorDarkManager.lightBlack,
      onSecondary: ColorDarkManager.darkWhite,

      error: ColorDarkManager.red,
      onError: ColorDarkManager.white,

      surface: ColorDarkManager.black,
      onSurface: ColorDarkManager.white,
      secondaryContainer: ColorDarkManager.gold,


      brightness: Brightness.light,
    ),
      textTheme: TextTheme(
        headlineLarge: getBoldStyle(fontSize: AppSize.s20, color: ColorDarkManager.white),
        headlineMedium: getSemiBoldStyle(fontSize: AppSize.s20, color: ColorDarkManager.white),
        headlineSmall: getRegularStyle(fontSize: AppSize.s20, color: ColorDarkManager.white),

        titleLarge: getBoldStyle(fontSize: AppSize.s18, color: ColorDarkManager.white),
        titleMedium: getSemiBoldStyle(fontSize: AppSize.s18, color: ColorDarkManager.white),
        titleSmall: getRegularStyle(fontSize: AppSize.s18, color: ColorDarkManager.white),

        displayLarge: getBoldStyle(fontSize: AppSize.s16, color: ColorDarkManager.white),
        displayMedium: getSemiBoldStyle(fontSize: AppSize.s16, color: ColorDarkManager.white),
        displaySmall: getRegularStyle(fontSize: AppSize.s16, color: ColorDarkManager.white),

        bodyLarge: getBoldStyle(fontSize: AppSize.s14, color: ColorDarkManager.white),
        bodyMedium: getSemiBoldStyle(fontSize: AppSize.s14, color: ColorDarkManager.white),
        bodySmall: getRegularStyle(fontSize: AppSize.s14, color: ColorDarkManager.white),

        labelLarge: getBoldStyle(fontSize: AppSize.s12, color: ColorDarkManager.white),
        labelMedium: getSemiBoldStyle(fontSize: AppSize.s12, color: ColorDarkManager.white),
        labelSmall: getRegularStyle(fontSize: AppSize.s12, color: ColorDarkManager.white),
      ).apply(fontFamily: FontConstants.fontFamily)

  );


  @override
  // TODO: implement cupertinoThemeData
  ThemeData get cupertinoThemeData => throw UnimplementedError();

}

class LightThemeData extends AppThemeData {
  @override
  ThemeData get materialThemeData => ThemeData(
    brightness: Brightness.light,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          fontFamily: 'YekanBakhNoEn', package: 'component_library'),
    ),
  );

  @override
  // TODO: implement cupertinoThemeData
  ThemeData get cupertinoThemeData => throw UnimplementedError();


}
