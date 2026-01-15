import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';
import 'package:beit_alnakha_admin/features/awards/presentation/widgets/awards_view/add_award_button.dart';
import 'package:beit_alnakha_admin/features/awards/presentation/widgets/awards_view/awards_search_field.dart';
import 'package:beit_alnakha_admin/features/awards/presentation/widgets/awards_view/awards_user_type_drop_down.dart';
import 'package:flutter/material.dart';

class AwardsFilterSectionMobile extends StatelessWidget {
  const AwardsFilterSectionMobile({super.key});

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
              Text(AppStrings.awardsMenu, style: AppStyles.semiBold20(context)),
            ],
          ),
          Row(
            spacing: AppSize.size8,
            children: [
              Expanded(child: AwardsSearchField()),
              AwardsUserTypeDropDown(),
              AddAwardButton(),
            ],
          ),
        ],
      ),
    );
  }
}
