import 'package:beit_alnakha_admin/core/helper/extensions_helper.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_divider_widget.dart';
import 'package:beit_alnakha_admin/features/customers/presentation/widgets/customers_data_table.dart';
import 'package:beit_alnakha_admin/features/customers/presentation/widgets/customers_data_table_pagination.dart';
import 'package:beit_alnakha_admin/features/customers/presentation/widgets/customers_filter_section_desktop.dart';
import 'package:beit_alnakha_admin/features/customers/presentation/widgets/customers_statistics_data.dart';
import 'package:beit_alnakha_admin/features/customers/presentation/widgets/customers_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomersViewDesktop extends StatelessWidget {
  const CustomersViewDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverGap(AppSize.size16),
        CustomersStatisticsData().toSliver(),
        SliverGap(AppSize.size16),
        CustomersFilterSectionDesktop().toSliver(),
        SliverGap(AppSize.size16),
        CustomDividerWidget().toSliver(),
        SliverGap(AppSize.size16),
        CustomersTabBar().toSliver(),
        SliverGap(AppSize.size16),
        CustomersDataTable().toSliver(),
        SliverGap(AppSize.size16),
        SliverFillRemaining(
          hasScrollBody: false,
          child: CustomersDataTablePagination(),
        ),
      ],
    );
  }
}
