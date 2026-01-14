import 'package:beit_alnakha_admin/core/helper/extensions_helper.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_divider_widget.dart';
import 'package:beit_alnakha_admin/features/employees/presentation/widgets/employee_view/employees_data_table.dart';
import 'package:beit_alnakha_admin/features/employees/presentation/widgets/employee_view/employees_data_table_pagination.dart';
import 'package:beit_alnakha_admin/features/employees/presentation/widgets/employee_view/employees_filter_section_desktop.dart';
import 'package:beit_alnakha_admin/features/employees/presentation/widgets/employee_view/employees_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class EmployeesViewDesktop extends StatelessWidget {
  const EmployeesViewDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverGap(AppSize.size16),
        EmployeesFilterSectionDesktop().toSliver(),
        SliverGap(AppSize.size16),
        CustomDividerWidget().toSliver(),
        SliverGap(AppSize.size16),
        EmployeesTabBar().toSliver(),
        SliverGap(AppSize.size16),
        EmployeesDataTable().toSliver(),
        SliverGap(AppSize.size16),
        SliverFillRemaining(
          hasScrollBody: false,
          child: EmployeesDataTablePagination(),
        ),
      ],
    );
  }
}
