import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';
import 'package:beit_alnakha_admin/features/chefs/presentation/widgets/chef_view/add_chef_button.dart';
import 'package:beit_alnakha_admin/features/chefs/presentation/widgets/chef_view/chefs_search_field.dart';
import 'package:flutter/material.dart';

class ChefsFilterSectionDesktop extends StatelessWidget {
  const ChefsFilterSectionDesktop({super.key});

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
                AppStrings.chefsMenu,
                maxLines: 1,
                style: AppStyles.semiBold20(context),
              ),
            ),
          ),
          ChefsSearchField(),
          AddChefButton(),
        ],
      ),
    );
  }
}
