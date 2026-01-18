import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';
import 'package:beit_alnakha_admin/features/departments/presentation/widgets/departments_view/add_department_button.dart';
import 'package:beit_alnakha_admin/features/departments/presentation/widgets/departments_view/departments_date_range_picker.dart';
import 'package:beit_alnakha_admin/features/departments/presentation/widgets/departments_view/departments_search_field.dart';
import 'package:flutter/material.dart';

class DepartmentsFilterSectionDesktop extends StatelessWidget {
  const DepartmentsFilterSectionDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSize.size24),
      child: Row(
        spacing: AppSize.size10,
        children: [
          Expanded(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerRight,
              child: Text(
                AppStrings.departmentsMenu,
                maxLines: 1,
                style: AppStyles.semiBold20(context),
              ),
            ),
          ),
          DepartmentsSearchField(),
          DepartmentsDateRangePicker(),
          AddDepartmentButton(),
        ],
      ),
    );
  }
}
