import 'package:beit_alnakha_admin/core/responsive_helper/responsive_app_extensions.dart';
import 'package:beit_alnakha_admin/core/responsive_helper/screen_width_breakpoints.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_tab_bar.dart';
import 'package:flutter/material.dart';

class RequestsHistoryTabBar extends StatelessWidget {
  const RequestsHistoryTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    if (context.width < ScreenWidthBreakpoints.tablet) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppSize.size8,
        children: [
          _buildTabBarTitle(
            title: AppStrings.requestsHistory,
            context: context,
          ),
          _buildTabBar(),
        ],
      );
    } else {
      return Row(
        spacing: AppSize.size8,
        children: [
          _buildTabBarTitle(
            title: AppStrings.requestsHistory,
            context: context,
          ),
          Flexible(child: _buildTabBar()),
        ],
      );
    }
  }

  Widget _buildTabBarTitle({
    required String title,
    required BuildContext context,
  }) {
    return Text(
      AppStrings.requestsHistory,
      style: AppStyles.semiBold16(
        context,
      ).copyWith(color: AppColors.primaryBlack),
    );
  }

  Widget _buildTabBar() {
    return CustomTabBar(
      onTap: (index) {},
      paddingForLeft: 0,
      paddingForRight: 0,
      titles: AppStrings.requestsHistoryStatusForTabBar,
    );
  }
}
