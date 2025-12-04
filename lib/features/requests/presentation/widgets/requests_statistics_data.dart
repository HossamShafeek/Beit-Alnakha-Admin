import 'package:beit_alnakha_admin/core/helper/money_helper.dart';
import 'package:beit_alnakha_admin/core/responsive_helper/responsive_app_extensions.dart';
import 'package:beit_alnakha_admin/core/responsive_helper/responsive_pattern_layout.dart';
import 'package:beit_alnakha_admin/core/responsive_helper/screen_width_breakpoints.dart';
import 'package:beit_alnakha_admin/core/utils/app_assets.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/widgets/statistics_data_item.dart';
import 'package:flutter/material.dart';

class RequestsStatisticsData extends StatelessWidget {
  const RequestsStatisticsData({super.key});

  final List<String> requestsStatusIcon = const [
    AppAssets.orders,
    AppAssets.ordersWaiting,
    AppAssets.ordersDelivery,
    AppAssets.ordersDone,
    AppAssets.ordersCancelled,
  ];

  final List<int> requestsStatusValues = const [100000000, 300, 100, 600, 20];

  @override
  Widget build(BuildContext context) {
    return ResponsivePatternLayout(
      padding: EdgeInsets.symmetric(
        horizontal: context.withFormFactor(
          onMobile: AppSize.size16,
          onTablet: AppSize.size24,
          onDesktop: AppSize.size24,
        ),
      ),
      patternBuilder: (width) {
        if (width >= 1150) {
          return [5];
        } else if (width >= ScreenWidthBreakpoints.tablet) {
          return [3, 2];
        } else {
          return [1, 2, 2];
        }
      },
      children: requestsStatusIcon
          .asMap()
          .entries
          .map(
            (e) => StatisticsDataItem(
                imagePath: e.value,
                subtitle: AppStrings.requestsStatus[e.key],
                title: MoneyHelper.formatMoney(requestsStatusValues[e.key]),
              ),
          )
          .toList(),
    );
  }
}
