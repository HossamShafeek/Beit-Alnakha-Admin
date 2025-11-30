import 'package:beit_alnakha_admin/core/responsive_helper/adaptive_layout.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/features/agents/presentation/views/agents_view_desktop.dart';
import 'package:beit_alnakha_admin/features/agents/presentation/views/agents_view_mobile.dart';
import 'package:flutter/material.dart';

class AgentsLayout extends StatelessWidget {
  const AgentsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: AppStrings.agentsStatusForTabBar.length,
      child: Padding(
        padding: const EdgeInsets.only(bottom: AppSize.size16),
        child: AdaptiveLayout(
          useFullScreenWidth: true,
          mobileLayout: (context) => AgentsViewMobile(),
          tabletLayout: (context) => AgentsViewDesktop(),
          desktopLayout: (context) => AgentsViewDesktop(),
        ),
      ),
    );
  }
}
