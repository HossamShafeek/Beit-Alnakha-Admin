import 'package:beit_alnakha_admin/core/helper/extensions_helper.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_divider_widget.dart';
import 'package:beit_alnakha_admin/features/meals/presentation/widgets/meals_view/meals_data_table.dart';
import 'package:beit_alnakha_admin/features/meals/presentation/widgets/meals_view/meals_data_table_pagination.dart';
import 'package:beit_alnakha_admin/features/meals/presentation/widgets/meals_view/meals_filter_section_desktop.dart';
import 'package:beit_alnakha_admin/features/meals/presentation/widgets/meals_view/meals_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MealsViewDesktop extends StatelessWidget {
  const MealsViewDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverGap(AppSize.size16),
        MealsFilterSectionDesktop().toSliver(),
        SliverGap(AppSize.size16),
        CustomDividerWidget().toSliver(),
        SliverGap(AppSize.size16),
        MealsTabBar().toSliver(),
        SliverGap(AppSize.size16),
        MealsDataTable().toSliver(),
        SliverGap(AppSize.size16),
        SliverFillRemaining(
          hasScrollBody: false,
          child: MealsDataTablePagination(),
        ),
      ],
    );
  }
}
