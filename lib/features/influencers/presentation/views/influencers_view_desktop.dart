import 'package:beit_alnakha_admin/core/helper/extensions_helper.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_divider_widget.dart';
import 'package:beit_alnakha_admin/features/influencers/presentation/widgets/influencer_view/influencers_data_table.dart';
import 'package:beit_alnakha_admin/features/influencers/presentation/widgets/influencer_view/influencers_data_table_pagination.dart';
import 'package:beit_alnakha_admin/features/influencers/presentation/widgets/influencer_view/influencers_filter_section_desktop.dart';
import 'package:beit_alnakha_admin/features/influencers/presentation/widgets/influencer_view/influencers_statistics_data.dart';
import 'package:beit_alnakha_admin/features/influencers/presentation/widgets/influencer_view/influencers_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class InfluencersViewDesktop extends StatelessWidget {
  const InfluencersViewDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverGap(AppSize.size16),
        InfluencersStatisticsData().toSliver(),
        SliverGap(AppSize.size16),
        InfluencersFilterSectionDesktop().toSliver(),
        SliverGap(AppSize.size16),
        CustomDividerWidget().toSliver(),
        SliverGap(AppSize.size16),
        InfluencersTabBar().toSliver(),
        SliverGap(AppSize.size16),
        InfluencersDataTable().toSliver(),
        SliverGap(AppSize.size16),
        SliverFillRemaining(
          hasScrollBody: false,
          child: InfluencersDataTablePagination(),
        ),
      ],
    );
  }
}
