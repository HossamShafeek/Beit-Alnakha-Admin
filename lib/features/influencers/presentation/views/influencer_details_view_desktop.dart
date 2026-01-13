import 'package:beit_alnakha_admin/core/helper/extensions_helper.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/features/influencers/presentation/widgets/influencer_details_view/influencer_details_data_section.dart';
import 'package:beit_alnakha_admin/features/influencers/presentation/widgets/influencer_details_view/influencer_details_statistics_data.dart';
import 'package:beit_alnakha_admin/features/influencers/presentation/widgets/influencer_details_view/influencer_requests_history_list_view.dart';
import 'package:beit_alnakha_admin/features/influencers/presentation/widgets/influencer_details_view/influencer_requests_history_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class InfluencerDetailsViewDesktop extends StatelessWidget {
  const InfluencerDetailsViewDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSize.size24),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          InfluencerDetailsStatisticsData().toSliver(),
          SliverGap(AppSize.size24),
          InfluencerDetailsDataSection().toSliver(),
          SliverGap(AppSize.size24),
          InfluencerRequestsHistoryTabBar().toSliver(),
          SliverGap(AppSize.size12),
          InfluencerRequestsHistoryListView(),
        ],
      ),
    );
  }
}
