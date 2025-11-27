import 'package:beit_alnakha_admin/core/helper/money_helper.dart';
import 'package:beit_alnakha_admin/core/responsive_helper/responsive_app_extensions.dart';
import 'package:beit_alnakha_admin/core/responsive_helper/responsive_pattern_layout.dart';
import 'package:beit_alnakha_admin/core/responsive_helper/screen_width_breakpoints.dart';
import 'package:beit_alnakha_admin/core/utils/app_assets.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/widgets/statistics_data_item.dart';
import 'package:flutter/material.dart';

class AgentsStatisticsData extends StatelessWidget {
  const AgentsStatisticsData({super.key});

  final List<String> agentsStatusIcon = const [
    AppAssets.users,
    AppAssets.activeUser,
    AppAssets.money,
    AppAssets.points,
  ];

  final List<int> agentsStatusValues = const [1000, 300, 8450000, 20240];

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
        if (width >= ScreenWidthBreakpoints.desktop) {
          return [4];
        } else {
          return [2, 2];
        }
      },
      children: agentsStatusIcon.asMap().entries.map((e) {
        return StatisticsDataItem(
          statisticModel: StatisticModel(
            imagePath: e.value,
            subtitle: AppStrings.agentsStatus[e.key],
            title: e.key == 2
                ? '${MoneyHelper.formatMoney(agentsStatusValues[e.key])} ${AppStrings.iraqCurrency}'
                : MoneyHelper.formatMoney(agentsStatusValues[e.key]),
          ),
        );
      }).toList(),
    );
  }
}
