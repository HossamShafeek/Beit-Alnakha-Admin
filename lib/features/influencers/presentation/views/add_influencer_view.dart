import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_responsive_dialog.dart';
import 'package:beit_alnakha_admin/core/widgets/dialog_actions.dart';
import 'package:beit_alnakha_admin/core/widgets/pic_photo_widget.dart';
import 'package:beit_alnakha_admin/core/widgets/pic_video_widget.dart';
import 'package:beit_alnakha_admin/features/influencers/presentation/widgets/influencer_view/add_influencer_texts_fields_section.dart';
import 'package:flutter/material.dart';

class AddInfluencerView extends StatelessWidget {
  const AddInfluencerView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomResponsiveDialog(
      widthInTabletAndDesktop: 650,
      title: AppStrings.addInfluencer,
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
              PicVideoWidget(title: AppStrings.pressToUploadInfluencerVideo),
              Row(
                spacing: AppSize.size12,
                children: [
                  Expanded(child: PicPhotoWidget(title: AppStrings.pressToUploadInfluencerImage)),
                  Expanded(child: PicPhotoWidget(title: AppStrings.pressToUploadCoverImage)),
                ],
              ),
              AddInfluencerTextsFieldsSection(),
            ],
          ),
        ),
      ),
    );
  }
}
