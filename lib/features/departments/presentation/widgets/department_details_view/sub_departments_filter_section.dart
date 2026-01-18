import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/features/departments/presentation/widgets/department_details_view/add_sub_department_button.dart';
import 'package:beit_alnakha_admin/features/departments/presentation/widgets/department_details_view/sub_departments_search_field.dart';
import 'package:flutter/material.dart';

class SubDepartmentsFilterSection extends StatelessWidget {
  const SubDepartmentsFilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSize.size16),
      child: Row(
        spacing: AppSize.size10,
        children: [
          Expanded(child: SubDepartmentsSearchField()),
          AddSubDepartmentButton(),
        ],
      ),
    );
  }
}
