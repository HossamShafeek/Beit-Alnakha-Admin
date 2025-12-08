import 'package:beit_alnakha_admin/core/responsive_helper/responsive_pattern_layout.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
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
        child: ResponsivePatternLayout(
          spacing: AppSize.size12,
          rowSpacing: AppSize.size12,
          children: [
            RequestsSummaryAndPoints(),
            RequestDetailsCustomerData(),
            RequestsMealsDetailsDataTable(),
            RequestsFeaturesDataTable(),
          ],
          patternBuilder: (width) {
            return [2,2,2,2,2];
          },
        ),
      ),
    );
  }
}

// class RequestsDetailsViewDesktop extends StatelessWidget {
//   const RequestsDetailsViewDesktop({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: AppSize.size24),
//       child: SingleChildScrollView(
//         physics: const BouncingScrollPhysics(),
//         padding: const EdgeInsets.symmetric(vertical: AppSize.size24),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           spacing: AppSize.size12,
//           children: [
//             const Row(
//               spacing: AppSize.size12,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Expanded(child: RequestsSummaryAndPoints()),
//                 Expanded(child: RequestDetailsCustomerData()),
//               ],
//             ),
//             const Row(
//               spacing: AppSize.size12,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Expanded(child: RequestsMealsDetailsDataTable()),
//                 Expanded(child: RequestsFeaturesDataTable()),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
