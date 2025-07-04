import 'package:flutter/material.dart';

import '../color.dart';
import '../decoration.dart';

/// The `displayColor` is applied to [headline4], [headline3], [headline2],
/// [headline1], and [caption]. The `bodyColor` is applied to the remaining
/// text styles.

// light
TextTheme textTheme = ThemeData.light().textTheme.copyWith().apply(
      bodyColor: textSecondary, // bodyText1 (secondary text color)
      displayColor: textPrimary, // caption ( primary text color)
      // fontFamily: FontFamily.almerai,
    );

// dark
TextTheme textThemeDark = ThemeData.dark().textTheme.copyWith().apply(
      bodyColor: textSecondaryDark,
      displayColor: textPrimaryDark,
      // fontFamily: FontFamily.almerai,
    );

// appBar Text Style
TextTheme appBarTextTheme = textTheme.copyWith(
// center text style
  headlineMedium: appBarTextStyle.copyWith(color: appBarTextColor),
// Side text style
  bodyMedium: appBarTextStyle.copyWith(color: appBarTextColor),
);

TextTheme appBarTextThemeDark = textTheme.copyWith(
  headlineLarge: appBarTextStyle.copyWith(color: appBarTextColorDark),
  bodyMedium: appBarTextStyle.copyWith(color: appBarTextColorDark),
);
