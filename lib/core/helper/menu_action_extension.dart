import 'package:beit_alnakha_admin/core/helper/enums.dart';
import 'package:beit_alnakha_admin/core/utils/app_assets.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

extension MenuActionEnumExtension on MenuActionEnum {
  String get title {
    switch (this) {
      case MenuActionEnum.viewDetails:
        return AppStrings.viewDetails;
      case MenuActionEnum.edit:
        return AppStrings.edit;
      case MenuActionEnum.delete:
        return AppStrings.delete;
      case MenuActionEnum.whatsappContact:
        return AppStrings.whatsAppContact;
      case MenuActionEnum.updateStatus:
        return AppStrings.updateStatus;
      case MenuActionEnum.addNote:
        return AppStrings.addNote;
    }
  }

  String get icon {
    switch (this) {
      case MenuActionEnum.viewDetails:
        return AppAssets.show;
      case MenuActionEnum.edit:
        return AppAssets.edit;
      case MenuActionEnum.delete:
        return AppAssets.delete;
      case MenuActionEnum.whatsappContact:
        return AppAssets.whatsApp;
      case MenuActionEnum.updateStatus:
        return AppAssets.status;
      case MenuActionEnum.addNote:
        return AppAssets.addNote;
    }
  }

  Color get color {
    switch (this) {
      case MenuActionEnum.delete:
        return AppColors.red;
      case MenuActionEnum.whatsappContact:
        return AppColors.primary;
      default:
        return AppColors.secondaryBlack;
    }
  }
}
