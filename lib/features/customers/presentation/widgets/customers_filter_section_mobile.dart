import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';
import 'package:beit_alnakha_admin/features/customers/presentation/widgets/customers_date_range_picker.dart';
import 'package:beit_alnakha_admin/features/customers/presentation/widgets/customers_search_field.dart';
import 'package:flutter/material.dart';

class CustomersFilterSectionMobile extends StatelessWidget {
  const CustomersFilterSectionMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSize.size16,
      ),
      child: Column(
        spacing: AppSize.size8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.customersMenu,
            style: AppStyles.semiBold20(context),
          ),
          Row(
            spacing: AppSize.size8,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: CustomersSearchField()),
              CustomersDateRangePicker(),
            ],
          ),
        ],
      ),
    );
  }
}
