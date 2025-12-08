import 'package:beit_alnakha_admin/core/helper/extensions_helper.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_divider_widget.dart';
import 'package:beit_alnakha_admin/features/requests/presentation/widgets/requests_view/requests_data_table.dart';
import 'package:beit_alnakha_admin/features/requests/presentation/widgets/requests_view/requests_data_table_pagination.dart';
import 'package:beit_alnakha_admin/features/requests/presentation/widgets/requests_view/requests_filter_section_desktop.dart';
import 'package:beit_alnakha_admin/features/requests/presentation/widgets/requests_view/requests_statistics_data.dart';
import 'package:beit_alnakha_admin/features/requests/presentation/widgets/requests_view/requests_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RequestsViewDesktop extends StatelessWidget {
  const RequestsViewDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSize.size16),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverGap(AppSize.size16),
          RequestsStatisticsData().toSliver(),
          SliverGap(AppSize.size16),
          RequestsFilterSectionDesktop().toSliver(),
          SliverGap(AppSize.size16),
          CustomDividerWidget().toSliver(),
          SliverGap(AppSize.size16),
          RequestsTabBar().toSliver(),
          SliverGap(AppSize.size16),
          RequestsDataTable().toSliver(),
          SliverGap(AppSize.size16),
          SliverFillRemaining(
            hasScrollBody: false,
            child: RequestsDataTablePagination(),
          ),
        ],
      ),
    );
  }
}
