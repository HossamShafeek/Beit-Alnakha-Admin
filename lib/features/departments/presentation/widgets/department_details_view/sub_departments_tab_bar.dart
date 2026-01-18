import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_tab_bar.dart';
import 'package:flutter/material.dart';

class SubDepartmentsTabBar extends StatelessWidget {
  final Function(int) onTap;

  const SubDepartmentsTabBar({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return CustomTabBar(
      onTap: onTap,
      titles: AppStrings.subDepartmentsStatusForTabBar,
    );
  }
}
