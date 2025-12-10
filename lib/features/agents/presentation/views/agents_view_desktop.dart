import 'package:beit_alnakha_admin/core/helper/extensions_helper.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_divider_widget.dart';
import 'package:beit_alnakha_admin/features/agents/presentation/widgets/agent_view/agents_data_table.dart';
import 'package:beit_alnakha_admin/features/agents/presentation/widgets/agent_view/agents_data_table_pagination.dart';
import 'package:beit_alnakha_admin/features/agents/presentation/widgets/agent_view/agents_filter_section_desktop.dart';
import 'package:beit_alnakha_admin/features/agents/presentation/widgets/agent_view/agents_statistics_data.dart';
import 'package:beit_alnakha_admin/features/agents/presentation/widgets/agent_view/agents_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AgentsViewDesktop extends StatelessWidget {
  const AgentsViewDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverGap(AppSize.size16),
        AgentsStatisticsData().toSliver(),
        SliverGap(AppSize.size16),
        AgentsFilterSectionDesktop().toSliver(),
        SliverGap(AppSize.size16),
        CustomDividerWidget().toSliver(),
        SliverGap(AppSize.size16),
        AgentsTabBar().toSliver(),
        SliverGap(AppSize.size16),
        AgentsDataTable().toSliver(),
        SliverGap(AppSize.size16),
        SliverFillRemaining(
          hasScrollBody: false,
          child: AgentsDataTablePagination(),
        ),
      ],
    );
  }
}
