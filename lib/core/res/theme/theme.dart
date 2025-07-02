
import 'package:flutter/material.dart';

import '../color.dart';
import '../decoration.dart';
import 'app_bar.dart';
import 'bottom_bar.dart';
import 'button.dart';
import 'text.dart';

ThemeData get lightTheme {
  return ThemeData(
    scaffoldBackgroundColor: scaffoldBackgroundColor,
    textTheme: textTheme,
    cardColor: cardColor,
    brightness: Brightness.light,
    splashColor: primaryColor,
    highlightColor: highlightColor,
    appBarTheme: appBarTheme,

    visualDensity: VisualDensity.adaptivePlatformDensity,
    hintColor: accentColor,
    hoverColor: hoverColor,
    floatingActionButtonTheme: floatingActionButtonTheme,
    dividerColor: dividerColor,
    // hintColor: textSecondary,
    primaryColor: primaryColor,
    primaryColorDark: primaryColorDark,
    bottomNavigationBarTheme: bottomNavigationBarTheme,
    buttonTheme: buttonTheme,
    // cursorColor: cursor,
    // textSelectionHandleColor: textSelectionHandle,
    // textSelectionColor: textSelection,
    unselectedWidgetColor: unselectedWidgetColor,
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
      TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
      TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
    }),

    primaryColorLight: primaryColorLight,
    disabledColor: unselectedWidgetColor,

    /// Text fields
    inputDecorationTheme: kInputDecorationTheme,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: primaryColor,
      onPrimary: scaffoldBackgroundColor,
      primaryContainer: primaryColor,
      onPrimaryContainer: scaffoldBackgroundColor,
      inversePrimary: primaryColor,

      surface: scaffoldBackgroundColor,
      onSurface: primaryColor,
      inverseSurface: scaffoldBackgroundColor,
      onInverseSurface: primaryColor,
      surfaceVariant: scaffoldBackgroundColor,
      onSurfaceVariant: primaryColor,

      secondary: primaryColorLight,
      onSecondary: scaffoldBackgroundColor,
      secondaryContainer: primaryColorDark,
      onSecondaryContainer: scaffoldBackgroundColor,

      background: backgroundColor,
      onBackground: primaryColor,

      error: errorColor,
      onError: scaffoldBackgroundColor,
      errorContainer: errorColor,
      onErrorContainer: scaffoldBackgroundColor,


      tertiary: primaryColor,
      onTertiary: scaffoldBackgroundColor,
      tertiaryContainer: primaryColor,
      onTertiaryContainer: scaffoldBackgroundColor,


      shadow: grayScaleLiteColor,
      outline: primaryColor,

             // primaryVariant: primaryColor,
             //  secondaryVariant: primaryColor
    ),
  );
}

ThemeData get darkTheme {
  return ThemeData.dark().copyWith(
    scaffoldBackgroundColor: scaffoldBackgroundColorDark,
    textTheme: textThemeDark,
    highlightColor: highlightColorDark,
    appBarTheme: appBarThemeDark,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    // accentColor: accentColorDark,
    floatingActionButtonTheme: floatingActionButtonThemeDark,
    dividerColor: dividerColorDark,
    hintColor: textSecondaryDark,
    primaryColor: primaryColorDark,
    bottomNavigationBarTheme: bottomNavigationBarThemeDark,
    buttonTheme: buttonThemeDark,
    // cursorColor: cursorDark,
    // textSelectionHandleColor: textSelectionHandleDark,
    // textSelectionColor: textSelectionDark,
  );
}
