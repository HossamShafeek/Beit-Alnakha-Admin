import 'package:beit_alnakha_admin/core/helper/extensions_helper.dart';
import 'package:beit_alnakha_admin/core/responsive_helper/responsive_app_extensions.dart';
import 'package:beit_alnakha_admin/core/responsive_helper/responsive_pattern_layout.dart';
import 'package:beit_alnakha_admin/core/responsive_helper/screen_width_breakpoints.dart';
import 'package:beit_alnakha_admin/core/utils/app_assets.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/widgets/statistics_data_item.dart';
import 'package:flutter/material.dart';

class InfluencersStatisticsData extends StatelessWidget {
  const InfluencersStatisticsData({super.key});

  final List<String> influencersStatusIcon = const [
    AppAssets.users,
    AppAssets.activeUser,
    AppAssets.moneyCircleFill,
    AppAssets.pointsFill,
  ];

  final List<int> influencersStatusValues = const [1000, 300, 8450000, 20240];

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
      children: influencersStatusIcon.asMap().entries.map((e) {
        return StatisticsDataItem(
          imagePath: e.value,
          subtitle: AppStrings.influencersStatusForStatistics[e.key],
          title: e.key == 2
              ? influencersStatusValues[e.key]
                    .toFormatMoney()
                    .toWithIraqCurrency()
              : influencersStatusValues[e.key].toFormatMoney(),
        );
      }).toList(),
    );
  }
}
