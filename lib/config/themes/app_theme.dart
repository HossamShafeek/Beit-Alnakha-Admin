import 'package:flutter/material.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';

MaterialColor getMaterialColor(Color color) {
  int r = color.red;
  int g = color.green;
  int b = color.blue;

  return MaterialColor(color.value, {
    50: Color.fromRGBO(r, g, b, 0.1),
    100: Color.fromRGBO(r, g, b, 0.2),
    200: Color.fromRGBO(r, g, b, 0.3),
    300: Color.fromRGBO(r, g, b, 0.4),
    400: Color.fromRGBO(r, g, b, 0.5),
    500: Color.fromRGBO(r, g, b, 0.6),
    600: Color.fromRGBO(r, g, b, 0.7),
    700: Color.fromRGBO(r, g, b, 0.8),
    800: Color.fromRGBO(r, g, b, 0.9),
    900: Color.fromRGBO(r, g, b, 1.0),
  });
}

ThemeData appTheme(BuildContext context) {
  return ThemeData(
    primarySwatch: getMaterialColor(AppColors.primary),
    useMaterial3: false,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      elevation: 0.8,
      shadowColor: AppColors.greyE7,
      titleTextStyle: AppStyles.medium20(
        context,
      ).copyWith(color: AppColors.secondaryBlack),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.white,
      showSelectedLabels: true,
      elevation: 5,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.grey7A,
      unselectedLabelStyle: AppStyles.medium15(context),
      selectedLabelStyle: AppStyles.medium15(
        context,
      ).copyWith(color: AppColors.primary),
    ),
  );
}
