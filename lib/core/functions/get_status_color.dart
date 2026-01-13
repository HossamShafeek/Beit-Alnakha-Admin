import 'package:beit_alnakha_admin/core/helper/enums.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

List<Color> getStatusColor(RequestStatusEnum status) {
  switch (status) {
    case RequestStatusEnum.newText:
      return [AppColors.blueE0,AppColors.blueE0WithOpacity10];
    case RequestStatusEnum.preparing:
      return [AppColors.yellow3D,AppColors.yellow3DWithOpacity10];
    case RequestStatusEnum.prepared:
      return [AppColors.teal,AppColors.tealWithOpacity10];
    case RequestStatusEnum.delivering:
      return [AppColors.purple,AppColors.purpleWithOpacity10];
    case RequestStatusEnum.delivered:
      return [AppColors.green,AppColors.greenWithOpacity10];
    case RequestStatusEnum.cancelled:
      return [AppColors.red,AppColors.redWithOpacity10];
  }
}