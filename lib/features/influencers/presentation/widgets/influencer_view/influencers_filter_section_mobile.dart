import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';
import 'package:beit_alnakha_admin/features/influencers/presentation/widgets/influencer_view/add_influencer_button.dart';
import 'package:beit_alnakha_admin/features/influencers/presentation/widgets/influencer_view/influencers_search_field.dart';
import 'package:flutter/material.dart';

class InfluencersFilterSectionMobile extends StatelessWidget {
  const InfluencersFilterSectionMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSize.size16),
      child: Column(
        spacing: AppSize.size8,
        children: [
          Row(
            spacing: AppSize.size8,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.influencersMenu,
                style: AppStyles.semiBold20(context),
              ),
            ],
          ),
          Row(
            spacing: AppSize.size8,
            children: [
              Expanded(child: InfluencersSearchField()),
              AddInfluencerButton(),
            ],
          ),
        ],
      ),
    );
  }
}
