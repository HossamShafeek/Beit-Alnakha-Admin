import 'package:beit_alnakha_admin/core/responsive_helper/adaptive_layout.dart';
import 'package:beit_alnakha_admin/core/responsive_helper/responsive_app_extensions.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/features/ratings/presentation/views/ratings_view_desktop.dart';
import 'package:beit_alnakha_admin/features/ratings/presentation/views/ratings_view_mobile.dart';
import 'package:flutter/material.dart';

class RatingsLayout extends StatelessWidget {
  const RatingsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: AppStrings.ratingsStarsForTabBar.length,
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
          mobileLayout: (context) => RatingsViewMobile(),
          tabletLayout: (context) => RatingsViewDesktop(),
          desktopLayout: (context) => RatingsViewDesktop(),
        ),
      ),
    );
  }
}
