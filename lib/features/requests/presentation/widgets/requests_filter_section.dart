import 'package:beit_alnakha_admin/core/responsive_helper/responsive_app_extensions.dart';
import 'package:beit_alnakha_admin/core/responsive_helper/screen_width_breakpoints.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';
import 'package:beit_alnakha_admin/features/requests/presentation/widgets/requests_date_range_picker.dart';
import 'package:beit_alnakha_admin/features/requests/presentation/widgets/requests_search_field.dart';
import 'package:beit_alnakha_admin/features/requests/presentation/widgets/requests_type_drop_down.dart';
import 'package:flutter/material.dart';

class RequestsFilterSection extends StatelessWidget {
  const RequestsFilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return context.width > ScreenWidthBreakpoints.desktop
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

                    Flexible(child: RequestsSearchField()),
                  ],
                ),
                Row(
                  spacing: AppSize.size8,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RequestsTypeDropDown(),
                    Flexible(child: RequestsDateRangePicker()),
                  ],
                ),
              ],
            ),
        );
  }
}
