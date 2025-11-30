import 'package:beit_alnakha_admin/core/responsive_helper/adaptive_layout.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/features/requests/presentation/views/requests_view_desktop.dart';
import 'package:beit_alnakha_admin/features/requests/presentation/views/requests_view_mobile.dart';
import 'package:flutter/material.dart';

class RequestsLayout extends StatelessWidget {
  const RequestsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: AppStrings.requestsStatusForTabBar.length,
      child: Padding(
        padding: const EdgeInsets.only(bottom: AppSize.size16),
        child: AdaptiveLayout(
          useFullScreenWidth: true,
          mobileLayout:(context) =>  RequestsViewMobile(),
          tabletLayout: (context) => RequestsViewDesktop(),
          desktopLayout: (context) => RequestsViewDesktop(),
        ),
      ),
    );
  }
}
