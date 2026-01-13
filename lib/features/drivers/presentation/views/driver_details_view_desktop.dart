import 'package:beit_alnakha_admin/core/helper/extensions_helper.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/features/drivers/presentation/widgets/driver_details_view/driver_details_data_section.dart';
import 'package:beit_alnakha_admin/features/drivers/presentation/widgets/driver_details_view/driver_details_statistics_data.dart';
import 'package:beit_alnakha_admin/features/drivers/presentation/widgets/driver_details_view/driver_requests_history_list_view.dart';
import 'package:beit_alnakha_admin/features/drivers/presentation/widgets/driver_details_view/driver_requests_history_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DriverDetailsViewDesktop extends StatelessWidget {
  const DriverDetailsViewDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSize.size24),
      child: CustomScrollView(
        slivers: [
          DriverDetailsStatisticsData().toSliver(),
          SliverGap(AppSize.size24),
           DriverDetailsDataSection().toSliver(),
           SliverGap(AppSize.size24),
            DriverRequestsHistoryTabBar().toSliver(),
            SliverGap(AppSize.size12),
           DriverRequestsHistoryListView(),
        ],
      ),
    );
  }
}







