import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_responsive_dialog.dart';
import 'package:beit_alnakha_admin/core/widgets/dialog_actions.dart';
import 'package:beit_alnakha_admin/core/widgets/pic_photo_widget.dart';
import 'package:beit_alnakha_admin/features/agents/presentation/widgets/agent_view/add_agent_texts_fields_section.dart';
import 'package:flutter/material.dart';

class UpdateAgentView extends StatelessWidget {
  const UpdateAgentView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomResponsiveDialog(
      title: AppStrings.updateAgent,
      bottomWidget: DialogActions(
          buttonTitle: AppStrings.update,
          onPressed: () {}),
      child: Padding(
        padding: const EdgeInsets.only(
          top: AppSize.size16,
          right: AppSize.size16,
          left: AppSize.size16,
        ),
        child: SingleChildScrollView(
          child: Column(
            spacing: AppSize.size12,
            children: [PicPhotoWidget(
              title: AppStrings.pressToUploadAgentImage,
            ), AddAgentTextsFieldsSection()],
          ),
        ),
      ),
    );
  }
}


