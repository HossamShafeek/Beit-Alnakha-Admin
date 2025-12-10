import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

List<Color> getStatusColor(String status) {
  switch (status) {
    case AppStrings.newText:
      return [AppColors.blueE0,AppColors.blueE0WithOpacity10];
    case AppStrings.preparing:
      return [AppColors.yellow3D,AppColors.yellow3DWithOpacity10];
    case AppStrings.prepared:
      return [AppColors.teal,AppColors.tealWithOpacity10];
    case AppStrings.delivering:
      return [AppColors.purple,AppColors.purpleWithOpacity10];
    case AppStrings.deliveredForTabBar:
      return [AppColors.green,AppColors.greenWithOpacity10];
    default:
      return [AppColors.red,AppColors.redWithOpacity10];
  }
}