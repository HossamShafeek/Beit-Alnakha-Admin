import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';
import 'package:beit_alnakha_admin/features/departments/presentation/widgets/departments_view/add_department_button.dart';
import 'package:beit_alnakha_admin/features/departments/presentation/widgets/departments_view/departments_search_field.dart';
import 'package:flutter/material.dart';

class DepartmentsFilterSectionMobile extends StatelessWidget {
  const DepartmentsFilterSectionMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSize.size16),
      child: Column(
        spacing: AppSize.size8,
        children: [
          Row(
            spacing: AppSize.size8,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.departmentsMenu,
                style: AppStyles.semiBold20(context),
              ),
            ],
          ),
          Row(
            spacing: AppSize.size8,
            children: [
              Expanded(child: DepartmentsSearchField()),
              AddDepartmentButton(),
            ],
          ),
        ],
      ),
    );
  }
}
