import 'package:beit_alnakha_admin/core/utils/app_assets.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_constants.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_dialog.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class AddNoteRequestDialog extends StatelessWidget {
  const AddNoteRequestDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      iconSvgPath: AppAssets.addNote,
      iconSvgColor: AppColors.yellow3D,
      iconBackgroundColor: AppColors.yellow3DWithOpacity10,
      buttonTitleForPrimaryButton: AppStrings.addNote,
      buttonTitleForSecondaryButton: AppStrings.cancel,
      title: AppStrings.addNote,
      subtitle: AppStrings.addNoteForRequest,
      child: Form(
        child: CustomTextField(
          paddingForTop:    AppSize.size12,
          paddingForBottom: 0,
          maxLines: 3,
          maxLength: 100,
          enabledBorder: AppConstants.enabledBorder,
          hintText: AppStrings.enterYourNote,
          controller: TextEditingController(),
          validator: (value) {
            if (value!.isEmpty) {
              return AppStrings.pleaseEnterYourNote;
            }
            return null;
          },

        ),
      ),
    );
  }
}
