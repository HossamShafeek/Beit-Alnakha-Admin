import 'package:beit_alnakha_admin/core/utils/app_assets.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_dialog.dart';
import 'package:flutter/material.dart';

class DeleteSubDepartmentDialog extends StatelessWidget {
  const DeleteSubDepartmentDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      iconSvgPath: AppAssets.delete,
      iconSvgColor: AppColors.red,
      iconBackgroundColor: AppColors.redWithOpacity10,
      buttonColorForPrimaryButton: AppColors.red,
      buttonTitleForPrimaryButton: AppStrings.delete,
      buttonTitleForSecondaryButton: AppStrings.cancel,
      title: AppStrings.deleteSubDepartment,
      subtitle: AppStrings.youAreSureDeleteSubDepartment,
    );
  }
}
