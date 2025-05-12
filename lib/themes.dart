import 'package:cataliftapp/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryBlue,
    scaffoldBackgroundColor: AppColors.lightScaffoldBackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.lightAppBarBackground,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.lightBottomNavBarBackground,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      unselectedLabelStyle: TextStyle(fontSize: 12),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.lightGrey,
      hintStyle: const TextStyle(color: AppColors.mediumGrey),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: const BorderSide(color: AppColors.primaryBlue, width: 1.5),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide.none,
      ),
      contentPadding:
          const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
    ),
    cardTheme: CardTheme(
      elevation: 1,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      color: AppColors.lightCardBackground,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          color: AppColors.lightPrimaryText,
          fontWeight: FontWeight.bold,
          fontSize: 18),
      titleMedium: TextStyle(color: AppColors.lightSecondaryText, fontSize: 14),
      bodyLarge: TextStyle(
          color: AppColors.lightPrimaryText, fontSize: 16, height: 1.4),
      bodyMedium: TextStyle(color: AppColors.lightSecondaryText, fontSize: 14),
      labelLarge:
          TextStyle(color: AppColors.primaryBlue, fontWeight: FontWeight.bold),
    ).apply(fontFamily: 'Roboto'),
    iconTheme: const IconThemeData(color: AppColors.darkGrey),
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryBlue,
      secondary: AppColors.starColor,
      surface: AppColors.lightCardBackground,
      background: AppColors.lightScaffoldBackground,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: AppColors.lightPrimaryText,
      onBackground: AppColors.lightPrimaryText,
      error: Colors.redAccent,
      onError: Colors.white,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryBlue,
    scaffoldBackgroundColor: AppColors.darkScaffoldBackground,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkAppBarBackground,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkBottomNavBarBackground,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      unselectedLabelStyle: TextStyle(fontSize: 12),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.darkGrey.withOpacity(0.3),
      hintStyle: const TextStyle(color: AppColors.mediumGrey),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: const BorderSide(color: AppColors.primaryBlue, width: 1.5),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide.none,
      ),
      contentPadding:
          const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
    ),
    cardTheme: CardTheme(
      elevation: 1,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      color: AppColors.darkCardBackground,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          color: AppColors.darkPrimaryText,
          fontWeight: FontWeight.bold,
          fontSize: 18),
      titleMedium: TextStyle(color: AppColors.darkSecondaryText, fontSize: 14),
      bodyLarge: TextStyle(
          color: AppColors.darkPrimaryText, fontSize: 16, height: 1.4),
      bodyMedium: TextStyle(color: AppColors.darkSecondaryText, fontSize: 14),
      labelLarge:
          TextStyle(color: AppColors.primaryBlue, fontWeight: FontWeight.bold),
    ).apply(fontFamily: 'Roboto'),
    iconTheme: const IconThemeData(color: AppColors.mediumGrey),
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryBlue,
      secondary: AppColors.starColor,
      surface: AppColors.darkCardBackground,
      background: AppColors.darkScaffoldBackground,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: AppColors.darkPrimaryText,
      onBackground: AppColors.darkPrimaryText,
      error: Colors.redAccent,
      onError: Colors.white,
    ),
  );
}

class ThemeNotifier extends ValueNotifier<ThemeMode> {
  ThemeNotifier(ThemeMode value) : super(value);

  void toggleTheme() {
    value = value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }
}

final themeNotifier = ThemeNotifier(ThemeMode.light);
