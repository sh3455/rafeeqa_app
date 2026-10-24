import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rafeeqa/core/utils/styles.dart';

class AppTheme {
  static const Color backgroundApp = Color(0XFFFEF2ED);
  static const Color primary = Color(0xFFFD5F93);
  static const Color secondary = Color(0xFF26B1AE);

  static const Color white = Color(0xFFFEF7F3);

  // Dark Palette
  static const Color darkBackground = Color(0xFF0B1624);
  static const Color darkSurface = Color(0xFF101E2E);
  static const Color darkCard = Color(0xFF162434);

  static const Color inactiveGrey = Color(0xFF8C96A8);

  // Text / icons (light)
  static const Color navy = Color(0xFF1F4E79);

  // Borders
  static const Color lightBorder = Color(0xFFF6D9DF);
  static const Color darkBorder = Color(0xFF223650);

  // ================= Light Theme =================

  static ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    primaryColor: primary,
    scaffoldBackgroundColor: backgroundApp,
    canvasColor: white,
    cardColor: Colors.white,
    dividerColor: const Color(0xFFF1E4E0),
    hintColor: navy,

    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: primary,
      onPrimary: Colors.white,
      secondary: secondary,
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      surface: Colors.white,
      onSurface: navy,
    ),

    textTheme: Typography.material2021().black.apply(
      bodyColor: navy,
      displayColor: navy,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: backgroundApp,
      foregroundColor: navy,
      elevation: 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),

    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primary,
      foregroundColor: Colors.white,
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      elevation: 10,
      selectedItemColor: primary,
      unselectedItemColor: inactiveGrey,
      showSelectedLabels: false,
      showUnselectedLabels: true,
      unselectedLabelStyle: Styles.textStyle400.copyWith(
        color: inactiveGrey,
        fontSize: 12,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: primary,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 55),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      hintStyle: const TextStyle(color: inactiveGrey),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: lightBorder),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: lightBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: primary, width: 1.5),
      ),
    ),

    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.all(Colors.white),
      trackColor: WidgetStateProperty.resolveWith(
        (states) =>
            states.contains(WidgetState.selected) ? primary : lightBorder,
      ),
    ),

    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: secondary,
      linearTrackColor: lightBorder,
      circularTrackColor: lightBorder,
    ),
  );

  // ================= Dark Theme =================

  static ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    primaryColor: primary,
    scaffoldBackgroundColor: darkBackground,
    canvasColor: darkBackground,
    cardColor: darkCard,
    dividerColor: const Color(0xFF1A2940),
    hintColor: Colors.white70,

    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: primary,
      onPrimary: Colors.white,
      secondary: secondary,
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      surface: darkSurface,
      onSurface: Colors.white,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: darkSurface,
      foregroundColor: Colors.white,
      elevation: 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
      ),
    ),

    cardTheme: CardThemeData(
      color: darkCard,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primary,
      foregroundColor: Colors.white,
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: darkSurface,
      elevation: 10,
      selectedItemColor: primary,
      unselectedItemColor: inactiveGrey,
      showSelectedLabels: false,
      showUnselectedLabels: true,
      unselectedLabelStyle: Styles.textStyle400.copyWith(
        color: inactiveGrey,
        fontSize: 12,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: primary,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 55),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: darkCard,
      hintStyle: const TextStyle(color: inactiveGrey),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: darkBorder),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: darkBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: primary, width: 1.5),
      ),
    ),

    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.all(Colors.white),
      trackColor: WidgetStateProperty.resolveWith(
        (states) =>
            states.contains(WidgetState.selected) ? primary : darkBorder,
      ),
    ),

    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: secondary,
      linearTrackColor: darkBorder,
      circularTrackColor: darkBorder,
    ),
  );
}
