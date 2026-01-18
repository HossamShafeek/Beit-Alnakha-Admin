import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';
import 'package:beit_alnakha_admin/features/ratings/presentation/widgets/ratings_view/ratings_date_range_picker.dart';
import 'package:beit_alnakha_admin/features/ratings/presentation/widgets/ratings_view/ratings_search_field.dart';
import 'package:beit_alnakha_admin/features/ratings/presentation/widgets/ratings_view/ratings_request_type_drop_down.dart';
import 'package:flutter/material.dart';

class RatingsFilterSectionDesktop extends StatelessWidget {
  const RatingsFilterSectionDesktop({super.key});

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
                AppStrings.ratingsMenu,
                maxLines: 1,
                style: AppStyles.semiBold20(context),
              ),
            ),
          ),
          RatingsSearchField(),
          RatingsRequestTypeDropDown(),
          RatingsDateRangePicker(),
        ],
      ),
    );
  }
}
