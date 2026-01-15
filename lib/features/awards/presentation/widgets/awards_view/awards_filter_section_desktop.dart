import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';
import 'package:beit_alnakha_admin/features/awards/presentation/widgets/awards_view/add_award_button.dart';
import 'package:beit_alnakha_admin/features/awards/presentation/widgets/awards_view/awards_search_field.dart';
import 'package:beit_alnakha_admin/features/awards/presentation/widgets/awards_view/awards_user_type_drop_down.dart';
import 'package:flutter/material.dart';

class AwardsFilterSectionDesktop extends StatelessWidget {
  const AwardsFilterSectionDesktop({super.key});

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
                AppStrings.awardsMenu,
                maxLines: 1,
                style: AppStyles.semiBold20(context),
              ),
            ),
          ),
          AwardsSearchField(),
          AwardsUserTypeDropDown(),
          AddAwardButton(),
        ],
      ),
    );
  }
}
