import 'package:beit_alnakha_admin/core/helper/extensions_helper.dart';
import 'package:beit_alnakha_admin/core/utils/app_assets.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_container_with_title.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_divider_widget.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_list_tile.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_responsive_dialog.dart';
import 'package:beit_alnakha_admin/features/departments/presentation/widgets/department_details_view/sub_departments_data_table.dart';
import 'package:beit_alnakha_admin/features/departments/presentation/widgets/department_details_view/sub_departments_data_table_pagination.dart';
import 'package:beit_alnakha_admin/features/departments/presentation/widgets/department_details_view/sub_departments_filter_section.dart';
import 'package:beit_alnakha_admin/features/departments/presentation/widgets/department_details_view/sub_departments_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DepartmentDetailsView extends StatelessWidget {
  const DepartmentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: CustomResponsiveDialog(
        widthInTabletAndDesktop: 800,
        title: AppStrings.departmentDetails,
        child: Padding(
          padding: const EdgeInsets.only(bottom:
              AppSize.size16),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverGap(AppSize.size16),
              SubDepartmentsFilterSection().toSliver(),
              SliverGap(AppSize.size16),
              CustomDividerWidget().toSliver(),
              SliverGap(AppSize.size16),
              SubDepartmentsTabBar(onTap: (index) {}).toSliver(),
              SliverGap(AppSize.size16),
              SubDepartmentsDataTable().toSliver(),
              SliverGap(AppSize.size16),
              SliverFillRemaining(
                hasScrollBody: false,
                child: SubDepartmentsDataTablePagination(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DepartmentDetailsSection extends StatelessWidget {
  const DepartmentDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainerWithTitle(
      child: Column(
        children: [
          CustomListTile(
            svgIconPath: AppAssets.departments,
            titleText: AppStrings.departmentName,
            trailingTitle: 'برجر',
          ),
          CustomListTile(
            svgIconPath: AppAssets.departments,
            titleText: AppStrings.subDepartments,
            trailingTitle: '5',
            paddingForTop: AppSize.size8,
          ),
          CustomListTile(
            svgIconPath: AppAssets.meals,
            titleText: AppStrings.productsCount,
            trailingTitle: '200 ${AppStrings.meal}',
            paddingForTop: AppSize.size8,
          ),
          CustomListTile(
            svgIconPath: AppAssets.date,
            titleText: AppStrings.addedDate,
            trailingTitle: '2025-03-12',
            paddingForTop: AppSize.size8,
          ),
          CustomListTile(
            svgIconPath: AppAssets.status,
            titleText: AppStrings.departmentStatus,
            trailingTitle: AppStrings.active,
            paddingForTop: AppSize.size8,
            paddingForBottom: AppSize.size8,
          ),
        ],
      ),
    );
  }
}
