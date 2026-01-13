import 'package:beit_alnakha_admin/core/responsive_helper/responsive_app_extensions.dart';
import 'package:beit_alnakha_admin/core/responsive_helper/screen_width_breakpoints.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_tab_bar.dart';
import 'package:flutter/material.dart';

class InfluencerRequestsHistoryTabBar extends StatelessWidget {
  const InfluencerRequestsHistoryTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    if (context.width < ScreenWidthBreakpoints.tablet) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppSize.size8,
        children: [_TabBarTitle(), _BuildTabBar()],
      );
    } else {
      return Row(
        spacing: AppSize.size8,
        children: [
          _TabBarTitle(),
          Flexible(child: _BuildTabBar()),
        ],
      );
    }
  }
}

class _BuildTabBar extends StatelessWidget {
  const _BuildTabBar();

  @override
  Widget build(BuildContext context) {
    return CustomTabBar(
      onTap: (index) {},
      paddingForLeft: 0,
      paddingForRight: 0,
      titles: AppStrings.requestsHistoryStatusForTabBar,
    );
  }
}

class _TabBarTitle extends StatelessWidget {
  const _TabBarTitle();

  @override
  Widget build(BuildContext context) {
    return Text(
      AppStrings.requestsHistory,
      style: AppStyles.semiBold16(context).copyWith(color: AppColors.black),
    );
  }
}
