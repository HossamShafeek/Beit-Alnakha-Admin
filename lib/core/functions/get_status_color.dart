import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

List<Color> getStatusColor(String status) {
  switch (status) {
    case AppStrings.newText:
      return [AppColors.blueE0,AppColors.blueE0.withValues(alpha: 0.1)];
    case AppStrings.preparing:
      return [AppColors.yellow3D,AppColors.yellow3D.withValues(alpha: 0.1)];
    case AppStrings.prepared:
      return [AppColors.teal,AppColors.teal.withValues(alpha: 0.1)];
    case AppStrings.delivering:
      return [AppColors.purple,AppColors.purple.withValues(alpha: 0.1)];
    case AppStrings.deliveredForTabBar:
      return [AppColors.green,AppColors.green.withValues(alpha: 0.1)];
    default:
      return [AppColors.red,AppColors.red.withValues(alpha: 0.1)];
  }
}