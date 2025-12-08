import 'package:beit_alnakha_admin/core/responsive_helper/responsive_app_extensions.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/features/requests/presentation/widgets/requests_details_view/requests_bills_data.dart';
import 'package:beit_alnakha_admin/features/requests/presentation/widgets/requests_details_view/requests_delivery_information.dart';
import 'package:beit_alnakha_admin/features/requests/presentation/widgets/requests_details_view/requests_details_customer_data.dart';
import 'package:beit_alnakha_admin/features/requests/presentation/widgets/requests_details_view/requests_features_data_table.dart';
import 'package:beit_alnakha_admin/features/requests/presentation/widgets/requests_details_view/requests_meal_details_data_table.dart';
import 'package:beit_alnakha_admin/features/requests/presentation/widgets/requests_details_view/requests_summary_and_points.dart';
import 'package:flutter/material.dart';

class RequestsDetailsViewMobile extends StatelessWidget {
  const RequestsDetailsViewMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.withFormFactor(
          onMobile: AppSize.size16,
          onTablet: AppSize.size24,
          onDesktop: AppSize.size24,
        ),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding:  EdgeInsets.symmetric(vertical: context.withFormFactor(
          onMobile: AppSize.size16,
          onTablet: AppSize.size24,
          onDesktop: AppSize.size24,
        ),),
        child: Column(
          spacing: AppSize.size12,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RequestsSummaryAndPoints(),
            RequestDetailsCustomerData(),
            RequestsMealsDetailsDataTable(),
            RequestsFeaturesDataTable(),
            RequestsDeliveryInformation(),
            RequestsBillsData(),
          ],
        ),
      ),
    );
  }
}
