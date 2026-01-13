import 'package:beit_alnakha_admin/core/helper/extensions_helper.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/features/agents/presentation/widgets/agent_details_view/agent_details_data_section.dart';
import 'package:beit_alnakha_admin/features/agents/presentation/widgets/agent_details_view/agent_details_statistics_data.dart';
import 'package:beit_alnakha_admin/features/agents/presentation/widgets/agent_details_view/agent_requests_history_list_view.dart';
import 'package:beit_alnakha_admin/features/agents/presentation/widgets/agent_details_view/agent_requests_history_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AgentDetailsViewMobile extends StatelessWidget {
  const AgentDetailsViewMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSize.size16),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          AgentDetailsStatisticsData().toSliver(),
          SliverGap(AppSize.size16),
          AgentDetailsDataSection().toSliver(),
          SliverGap(AppSize.size16),
           AgentRequestsHistoryTabBar().toSliver(),
           SliverGap(AppSize.size12),
           AgentRequestsHistoryListView(),
        ],
      ),
    );
  }
}
