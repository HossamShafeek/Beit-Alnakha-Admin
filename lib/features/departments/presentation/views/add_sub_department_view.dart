import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_responsive_dialog.dart';
import 'package:beit_alnakha_admin/core/widgets/dialog_actions.dart';
import 'package:beit_alnakha_admin/core/widgets/pic_photo_widget.dart';
import 'package:beit_alnakha_admin/features/departments/presentation/widgets/department_details_view/add_sub_department_texts_fields_section.dart';
import 'package:flutter/material.dart';

class AddSubDepartmentView extends StatelessWidget {
  const AddSubDepartmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: AppSize.size16,
        right: AppSize.size16,
        left: AppSize.size16,
      ),
      child: CustomResponsiveDialog(
        title: AppStrings.addSubDepartment,
        bottomWidget: DialogActions(onPressed: () {}),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(
              top: AppSize.size16,
              right: AppSize.size16,
              left: AppSize.size16,
            ),
            child: Column(
              spacing: AppSize.size12,
              children: [
                PicPhotoWidget(
                  title: AppStrings.pressToUploadSubDepartmentImage,
                ),
                AddSubDepartmentTextsFieldsSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
