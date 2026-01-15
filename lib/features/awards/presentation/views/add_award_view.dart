import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_responsive_dialog.dart';
import 'package:beit_alnakha_admin/core/widgets/dialog_actions.dart';
import 'package:beit_alnakha_admin/features/awards/presentation/widgets/awards_view/add_award_texts_fields_section.dart';
import 'package:flutter/material.dart';

class AddAwardView extends StatelessWidget {
  const AddAwardView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomResponsiveDialog(
      title: AppStrings.addAward,
      bottomWidget: DialogActions(

          onPressed: () {}),
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
            children: [AddAwardTextsFieldsSection()],
          ),
        ),
      ),
    );
  }
}
