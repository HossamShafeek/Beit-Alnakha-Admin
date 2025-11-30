import 'package:beit_alnakha_admin/core/helper/extensions_helper.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_divider_widget.dart';
import 'package:beit_alnakha_admin/features/drivers/presentation/widgets/drivers_data_table.dart';
import 'package:beit_alnakha_admin/features/drivers/presentation/widgets/drivers_data_table_pagination.dart';
import 'package:beit_alnakha_admin/features/drivers/presentation/widgets/drivers_filter_section_mobile.dart';
import 'package:beit_alnakha_admin/features/drivers/presentation/widgets/drivers_statistics_data.dart';
import 'package:beit_alnakha_admin/features/drivers/presentation/widgets/drivers_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DriversViewMobile extends StatelessWidget {
  const DriversViewMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverGap(AppSize.size16),
        DriversStatisticsData().toSliver(),
        SliverGap(AppSize.size16),
        DriversFilterSectionMobile().toSliver(),
        SliverGap(AppSize.size16),
        CustomDividerWidget().toSliver(),
        SliverGap(AppSize.size16),
        DriversTabBar().toSliver(),
        SliverGap(AppSize.size16),
        DriversDataTable().toSliver(),
        SliverGap(AppSize.size16),
        SliverFillRemaining(
          hasScrollBody: false,
          child: DriversDataTablePagination(),
        ),
      ],
    );
  }
}
