import 'package:beit_alnakha_admin/core/helper/extensions_helper.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_divider_widget.dart';
import 'package:beit_alnakha_admin/features/ratings/presentation/widgets/ratings_view/ratings_data_table.dart';
import 'package:beit_alnakha_admin/features/ratings/presentation/widgets/ratings_view/ratings_data_table_pagination.dart';
import 'package:beit_alnakha_admin/features/ratings/presentation/widgets/ratings_view/ratings_filter_section_desktop.dart';
import 'package:beit_alnakha_admin/features/ratings/presentation/widgets/ratings_view/ratings_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RatingsViewDesktop extends StatelessWidget {
  const RatingsViewDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSize.size16),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverGap(AppSize.size16),
          RatingsFilterSectionDesktop().toSliver(),
          SliverGap(AppSize.size16),
          CustomDividerWidget().toSliver(),
          SliverGap(AppSize.size16),
          RatingsTabBar().toSliver(),
          SliverGap(AppSize.size16),
          RatingsDataTable().toSliver(),
          SliverGap(AppSize.size16),
          SliverFillRemaining(
            hasScrollBody: false,
            child: RatingsDataTablePagination(),
          ),
        ],
      ),
    );
  }
}
