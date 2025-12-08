import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/features/requests/presentation/widgets/requests_details_view/requests_bills_data.dart';
import 'package:beit_alnakha_admin/features/requests/presentation/widgets/requests_details_view/requests_delivery_information.dart';
import 'package:beit_alnakha_admin/features/requests/presentation/widgets/requests_details_view/requests_features_data_table.dart';
import 'package:beit_alnakha_admin/features/requests/presentation/widgets/requests_details_view/requests_meal_details_data_table.dart';
import 'package:beit_alnakha_admin/features/requests/presentation/widgets/requests_details_view/requests_details_customer_data.dart';
import 'package:beit_alnakha_admin/features/requests/presentation/widgets/requests_details_view/requests_summary_and_points.dart';
import 'package:flutter/material.dart';

class RequestsDetailsViewDesktop extends StatelessWidget {
  const RequestsDetailsViewDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.size24),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: AppSize.size24),
        child: Row(
          spacing: AppSize.size12,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                spacing: AppSize.size12,
                children: [
                  RequestsSummaryAndPoints(),
                  RequestsMealsDetailsDataTable(),
                  RequestsDeliveryInformation(),
                ],
              ),
            ),
            Expanded(
              child: Column(
                spacing: AppSize.size12,
                children: [
                  RequestDetailsCustomerData(),
                  RequestsFeaturesDataTable(),
                  RequestsBillsData(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}




