import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';
import 'package:beit_alnakha_admin/features/requests/presentation/widgets/requests_view/requests_date_range_picker.dart';
import 'package:beit_alnakha_admin/features/requests/presentation/widgets/requests_view/requests_search_field.dart';
import 'package:beit_alnakha_admin/features/requests/presentation/widgets/requests_view/requests_type_drop_down.dart';
import 'package:flutter/material.dart';

class RequestsFilterSectionMobile extends StatelessWidget {
  const RequestsFilterSectionMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSize.size16,
      ),
      child: Column(
        spacing: AppSize.size8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.requestsMenu,
            style: AppStyles.semiBold20(context),
          ),
          Row(
            spacing: AppSize.size8,

            children: [
              Expanded(child: RequestsSearchField()),
              RequestsTypeDropDown(),
              RequestsDateRangePicker(),
            ],
          ),
        ],
      ),
    );
  }
}
