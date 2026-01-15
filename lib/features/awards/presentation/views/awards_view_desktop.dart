import 'package:beit_alnakha_admin/core/helper/extensions_helper.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_divider_widget.dart';
import 'package:beit_alnakha_admin/features/awards/presentation/widgets/awards_view/awards_data_table.dart';
import 'package:beit_alnakha_admin/features/awards/presentation/widgets/awards_view/awards_data_table_pagination.dart';
import 'package:beit_alnakha_admin/features/awards/presentation/widgets/awards_view/awards_filter_section_desktop.dart';
import 'package:beit_alnakha_admin/features/awards/presentation/widgets/awards_view/awards_statistics_data.dart';
import 'package:beit_alnakha_admin/features/awards/presentation/widgets/awards_view/awards_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AwardsViewDesktop extends StatelessWidget {
  const AwardsViewDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverGap(AppSize.size16),
        AwardsStatisticsData().toSliver(),
        SliverGap(AppSize.size16),
        AwardsFilterSectionDesktop().toSliver(),
        SliverGap(AppSize.size16),
        CustomDividerWidget().toSliver(),
        SliverGap(AppSize.size16),
        AwardsTabBar().toSliver(),
        SliverGap(AppSize.size16),
        AwardsDataTable().toSliver(),
        SliverGap(AppSize.size16),
        SliverFillRemaining(
          hasScrollBody: false,
          child: AwardsDataTablePagination(),
        ),
      ],
    );
  }
}
