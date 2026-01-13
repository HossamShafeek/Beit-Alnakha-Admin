import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_container_with_title.dart';
import 'package:beit_alnakha_admin/features/influencers/presentation/widgets/influencer_details_view/influencer_details_data_section_app_bar.dart';
import 'package:beit_alnakha_admin/features/influencers/presentation/widgets/influencer_details_view/influencer_details_data_section_body.dart';
import 'package:flutter/material.dart';

class InfluencerDetailsDataSection extends StatelessWidget {
  const InfluencerDetailsDataSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainerWithTitle(
      child: Center(
        child: Column(
          spacing: AppSize.size10,
          children: [
            InfluencerDetailsDataSectionAppBar(),
            InfluencerDetailsDataSectionBody(),
          ],
        ),
      ),
    );
  }
}
