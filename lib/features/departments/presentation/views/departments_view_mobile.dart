import 'package:beit_alnakha_admin/core/helper/extensions_helper.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_divider_widget.dart';
import 'package:beit_alnakha_admin/features/departments/presentation/widgets/departments_view/departments_data_table.dart';
import 'package:beit_alnakha_admin/features/departments/presentation/widgets/departments_view/departments_data_table_pagination.dart';
import 'package:beit_alnakha_admin/features/departments/presentation/widgets/departments_view/departments_filter_section_mobile.dart';
import 'package:beit_alnakha_admin/features/departments/presentation/widgets/departments_view/departments_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DepartmentsViewMobile extends StatelessWidget {
  const DepartmentsViewMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverGap(AppSize.size16),
        DepartmentsFilterSectionMobile().toSliver(),
        SliverGap(AppSize.size16),
        CustomDividerWidget().toSliver(),
        SliverGap(AppSize.size16),
        DepartmentsTabBar().toSliver(),
        SliverGap(AppSize.size16),
        DepartmentsDataTable().toSliver(),
        SliverGap(AppSize.size16),
        SliverFillRemaining(
          hasScrollBody: false,
          child: DepartmentsDataTablePagination(),
        ),
      ],
    );
  }
}
