import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';
import 'package:beit_alnakha_admin/features/requests/presentation/widgets/requests_view/requests_date_range_picker.dart';
import 'package:beit_alnakha_admin/features/requests/presentation/widgets/requests_view/requests_search_field.dart';
import 'package:beit_alnakha_admin/features/requests/presentation/widgets/requests_view/requests_type_drop_down.dart';
import 'package:flutter/material.dart';

class RequestsFilterSectionDesktop extends StatelessWidget {
  const RequestsFilterSectionDesktop({super.key});

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
                AppStrings.requestsMenu,
                maxLines: 1,
                style: AppStyles.semiBold20(context),
              ),
            ),
          ),
          RequestsSearchField(),
          RequestsTypeDropDown(),
          RequestsDateRangePicker(),
        ],
      ),
    );
  }
}
