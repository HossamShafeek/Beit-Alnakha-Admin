import 'package:beit_alnakha_admin/core/helper/extensions_helper.dart';
import 'package:beit_alnakha_admin/core/responsive_helper/responsive_pattern_layout.dart';
import 'package:beit_alnakha_admin/core/responsive_helper/screen_width_breakpoints.dart';
import 'package:beit_alnakha_admin/core/utils/app_assets.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/widgets/statistics_data_item.dart';
import 'package:flutter/material.dart';

class InfluencerDetailsStatisticsData extends StatelessWidget {
  const InfluencerDetailsStatisticsData({super.key});

  final List<String> influencerStatusIcon = const [
    AppAssets.requestsFill,
    AppAssets.moneyCircleFill,
    AppAssets.ordersCancelled,
    AppAssets.moneyCircle,
  ];

  final List<int> influencerDetailsStatusValues = const [
    10000,
    500000,
    50000,
    50000,
  ];

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
      children: influencerStatusIcon
          .asMap()
          .entries
          .map(
            (e) => StatisticsDataItem(
              imagePath: e.value,
              subtitle: AppStrings.influencerDetailsStatusForStatistics[e.key],
              title: influencerDetailsStatusValues[e.key].toFormatMoney(),
            ),
          )
          .toList(),
    );
  }
}
