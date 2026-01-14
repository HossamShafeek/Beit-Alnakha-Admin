import 'package:beit_alnakha_admin/core/helper/extensions_helper.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_divider_widget.dart';
import 'package:beit_alnakha_admin/features/chefs/presentation/widgets/chef_view/chefs_data_table.dart';
import 'package:beit_alnakha_admin/features/chefs/presentation/widgets/chef_view/chefs_data_table_pagination.dart';
import 'package:beit_alnakha_admin/features/chefs/presentation/widgets/chef_view/chefs_filter_section_mobile.dart';
import 'package:beit_alnakha_admin/features/chefs/presentation/widgets/chef_view/chefs_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ChefsViewMobile extends StatelessWidget {
  const ChefsViewMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverGap(AppSize.size16),
        ChefsFilterSectionMobile().toSliver(),
        SliverGap(AppSize.size16),
        CustomDividerWidget().toSliver(),
        SliverGap(AppSize.size16),
        ChefsTabBar().toSliver(),
        SliverGap(AppSize.size16),
        ChefsDataTable().toSliver(),
        SliverGap(AppSize.size16),
        SliverFillRemaining(
          hasScrollBody: false,
          child: ChefsDataTablePagination(),
        ),
      ],
    );
  }
}
