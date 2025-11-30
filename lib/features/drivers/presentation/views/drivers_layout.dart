import 'package:beit_alnakha_admin/core/responsive_helper/adaptive_layout.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/features/drivers/presentation/views/drivers_view_desktop.dart';
import 'package:beit_alnakha_admin/features/drivers/presentation/views/drivers_view_mobile.dart';
import 'package:flutter/material.dart';

class DriversLayout extends StatelessWidget {
  const DriversLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: AppStrings.driversStatusForTabBar.length,
      child: Padding(
        padding: const EdgeInsets.only(bottom: AppSize.size16),
        child: AdaptiveLayout(
          useFullScreenWidth: true,
          mobileLayout: (context) => DriversViewMobile(),
          tabletLayout: (context) => DriversViewDesktop(),
          desktopLayout: (context) => DriversViewDesktop(),
        ),
      ),
    );
  }
}
