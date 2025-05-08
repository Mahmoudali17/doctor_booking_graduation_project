import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AppTheme {
  const AppTheme._();

  // Made for FlexColorScheme version 7.0.5. Make sure you
// use same or higher package version, but still same major version.
// If you use a lower version, some properties may not be supported.
// In that case remove them after copying this theme to your app.
  static final ThemeData light = FlexThemeData.light(
    // You can keep the scheme as fallback, or set to material
    scheme: FlexScheme.material,

    // Override the color scheme completely
    colors: const FlexSchemeColor(
      primary: Color(0xff6200ea),             // Purple
      primaryContainer: Color(0xffbb86fc),
      secondary: Color(0xff03dac6),           // Teal accent
      secondaryContainer: Color(0xff66fff9),
      tertiary: Color(0xff018786),            // Subtle deep teal
      tertiaryContainer: Color(0xffa7ffeb),
      appBarColor: Color(0xff3700b3),
      error: Color(0xffb00020),               // Standard error red
    ),

    // Optional if you're using your own colorScheme:
    // colorScheme: yourCustomColorScheme,

    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 7,
    subThemesData: FlexSubThemesData(
      blendOnLevel: 10,
      blendOnColors: false,
      useTextTheme: true,
      useM2StyleDividerInM3: true,
      alignedDropdown: true,
      useInputDecoratorThemeInDialogs: true,
      bottomSheetElevation: 0,
      bottomNavigationBarSelectedIconSize: 47.h,
      bottomNavigationBarUnselectedIconSize: 47.h,
      appBarCenterTitle: true,
      textButtonRadius: 8.0,
      filledButtonRadius: 8.0,
      elevatedButtonRadius: 8.0,
      outlinedButtonRadius: 8.0,
      inputDecoratorRadius: 8.0,
      inputDecoratorUnfocusedBorderIsColored: false,
      inputDecoratorBorderWidth: 0.5,
      inputDecoratorFocusedBorderWidth: 2,
      cardRadius: 8.0,
      popupMenuRadius: 8.0,
      menuRadius: 8.0,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    swapLegacyOnMaterial3: true,
    fontFamily: 'Gelion',
  );

  static final ThemeData dark = FlexThemeData.dark(
    scheme: FlexScheme.blue,
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 13,
    subThemesData: FlexSubThemesData(
      useTextTheme: true,
      alignedDropdown: true,
      useInputDecoratorThemeInDialogs: true,
      bottomSheetElevation: 0,
      bottomNavigationBarSelectedIconSize: 47.h,
      bottomNavigationBarUnselectedIconSize: 47.h,
      appBarCenterTitle: true,
      blendOnLevel: 20,
      useM2StyleDividerInM3: true,
      textButtonRadius: 8.0,
      filledButtonRadius: 8.0,
      elevatedButtonRadius: 8.0,
      outlinedButtonRadius: 8.0,
      inputDecoratorRadius: 8.0,
      inputDecoratorUnfocusedBorderIsColored: false,
      inputDecoratorBorderWidth: 0.5,
      inputDecoratorFocusedBorderWidth: 2,
      cardRadius: 8.0,
      popupMenuRadius: 8.0,
      menuRadius: 8.0,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    swapLegacyOnMaterial3: true,
    fontFamily: 'Gelion',
  );
}
