import 'package:beit_alnakha_admin/core/responsive_helper/adaptive_layout.dart';
import 'package:beit_alnakha_admin/core/responsive_helper/responsive_app_extensions.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/features/meals/presentation/views/meals_view_desktop.dart';
import 'package:beit_alnakha_admin/features/meals/presentation/views/meals_view_mobile.dart';
import 'package:flutter/material.dart';

class MealsLayout extends StatelessWidget {
  const MealsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: AppStrings.mealsStatusForTabBar.length,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: context.withFormFactor(
            onMobile: AppSize.size16,
            onTablet: AppSize.size24,
            onDesktop: AppSize.size24,
          ),
        ),
        child: AdaptiveLayout(
          useFullScreenWidth: true,
          mobileLayout: (context) => MealsViewMobile(),
          tabletLayout: (context) => MealsViewDesktop(),
          desktopLayout: (context) => MealsViewDesktop(),
        ),
      ),
    );
  }
}
