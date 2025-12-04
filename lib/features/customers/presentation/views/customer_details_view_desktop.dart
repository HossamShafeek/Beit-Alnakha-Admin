import 'package:beit_alnakha_admin/core/helper/extensions_helper.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/features/customers/presentation/widgets/customer_view_details/customer_details_data_section.dart';
import 'package:beit_alnakha_admin/features/customers/presentation/widgets/customer_view_details/customer_details_statistics_data.dart';
import 'package:beit_alnakha_admin/features/customers/presentation/widgets/customer_view_details/requests_history_list_view.dart';
import 'package:beit_alnakha_admin/features/customers/presentation/widgets/customer_view_details/requests_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomerDetailsViewDesktop extends StatelessWidget {
  const CustomerDetailsViewDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSize.size24),
      child: CustomScrollView(
        slivers: [
          CustomerDetailsStatisticsData().toSliver(),
          SliverGap(AppSize.size24),
           CustomerDetailsDataSection().toSliver(),
           SliverGap(AppSize.size24),
           RequestsHistoryTabBar().toSliver(),
           SliverGap(AppSize.size12),
          RequestsHistoryListView(),
        ],
      ),
    );
  }
}







