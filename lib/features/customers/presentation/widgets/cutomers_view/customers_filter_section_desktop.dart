import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';
import 'package:beit_alnakha_admin/features/customers/presentation/widgets/cutomers_view/customers_date_range_picker.dart';
import 'package:beit_alnakha_admin/features/customers/presentation/widgets/cutomers_view/customers_search_field.dart';
import 'package:flutter/material.dart';

class CustomersFilterSectionDesktop extends StatelessWidget {
  const CustomersFilterSectionDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSize.size24,
      ),
          child: Row(
              spacing: AppSize.size10,
              children: [
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerRight,
                    child: Text(
                      AppStrings.customersMenu,
                      maxLines: 1,
                      style: AppStyles.semiBold20(context),
                    ),
                  ),
                ),
                CustomersSearchField(),
                CustomersDateRangePicker(),
              ],
            ),
        )
    ;
  }
}
