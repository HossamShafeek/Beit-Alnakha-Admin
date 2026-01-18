import 'package:beit_alnakha_admin/core/utils/app_assets.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_container_with_title.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_list_tile.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_responsive_dialog.dart';
import 'package:flutter/material.dart';

class DepartmentDetailsView extends StatelessWidget {
  const DepartmentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomResponsiveDialog(
      title: AppStrings.departmentDetails,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(
            top: AppSize.size16,
            right: AppSize.size16,
            left: AppSize.size16,
            bottom: AppSize.size16,
          ),
          child: Column(
            spacing: AppSize.size12,
            children: [DepartmentDetailsSection()],
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
