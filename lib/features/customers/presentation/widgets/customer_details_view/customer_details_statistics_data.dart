import 'package:beit_alnakha_admin/core/helper/extensions_helper.dart';
import 'package:beit_alnakha_admin/core/responsive_helper/responsive_pattern_layout.dart';
import 'package:beit_alnakha_admin/core/responsive_helper/screen_width_breakpoints.dart';
import 'package:beit_alnakha_admin/core/utils/app_assets.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/widgets/statistics_data_item.dart';
import 'package:flutter/material.dart';

class CustomerDetailsStatisticsData extends StatelessWidget {
  const CustomerDetailsStatisticsData({super.key});

  final List<String> customersStatusIcon = const [
    AppAssets.ordersVector,
    AppAssets.moneyVector,
    AppAssets.pointsVector,
    AppAssets.phoneVector,
  ];

  final List<int> customerDetailsStatusValues = const [1000, 50000, 5000, 5];

  @override
  Widget build(BuildContext context) {
    return ResponsivePatternLayout(
      patternBuilder: (width) {
        if (width >= ScreenWidthBreakpoints.desktop) {
          return [4];
        } else {
          return [2, 2];
        }
      },
      children: customersStatusIcon
          .asMap()
          .entries
          .map(
            (e) => StatisticsDataItem(
              disableColor: true,
              imagePath: e.value,

              subtitle: AppStrings.customerDetailsStatus[e.key],
              title:_formattedTitle(e.key),
            ),
          )
          .toList(),
    );
  }
  String _formattedTitle(int index) {
    final value = customerDetailsStatusValues[index];
    switch (index) {
      case 1:
        return value.toFormatMoney().toWithIraqCurrency();
      case 3:
        return '${AppStrings.allWithoutAl} ${value.toFormatMoney()} ${AppStrings.days}';
        default:
          return value.toFormatMoney();
    }
  }
}
