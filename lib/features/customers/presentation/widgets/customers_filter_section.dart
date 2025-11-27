import 'package:beit_alnakha_admin/core/responsive_helper/responsive_app_extensions.dart';
import 'package:beit_alnakha_admin/core/responsive_helper/screen_width_breakpoints.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';
import 'package:beit_alnakha_admin/features/customers/presentation/widgets/customers_date_range_picker.dart';
import 'package:beit_alnakha_admin/features/customers/presentation/widgets/customers_search_field.dart';
import 'package:flutter/material.dart';

class CustomersFilterSection extends StatelessWidget {
  const CustomersFilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return context.width > ScreenWidthBreakpoints.tablet
        ? Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.withFormFactor(
          onMobile: AppSize.size16,
          onTablet: AppSize.size24,
          onDesktop: AppSize.size24,
        ),
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
        : Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.withFormFactor(
          onMobile: AppSize.size16,
          onTablet: AppSize.size24,
          onDesktop: AppSize.size24,
        ),
      ),
          child: Column(
              spacing: AppSize.size8,
              children: [
                Row(
                  spacing: AppSize.size8,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.requestsMenu,
                      style: AppStyles.semiBold20(context),
                    ),

                    Flexible(child: CustomersSearchField()),
                  ],
                ),
                Row(
                  spacing: AppSize.size8,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(child: CustomersDateRangePicker()),
                  ],
                ),
              ],
            ),
        );
  }
}
