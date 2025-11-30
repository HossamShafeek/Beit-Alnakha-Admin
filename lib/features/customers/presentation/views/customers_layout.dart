import 'package:beit_alnakha_admin/core/responsive_helper/adaptive_layout.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/features/customers/presentation/views/customers_view_desktop.dart';
import 'package:beit_alnakha_admin/features/customers/presentation/views/customers_view_mobile.dart';
import 'package:flutter/material.dart';

class CustomersView extends StatelessWidget {
  const CustomersView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: AppStrings.customersStatusForTabBar.length,
      child: Padding(
        padding: const EdgeInsets.only(bottom: AppSize.size16),
        child: AdaptiveLayout(
          useFullScreenWidth: true,
          mobileLayout: (context) => CustomersViewMobile(),
          tabletLayout: (context) => CustomersViewDesktop(),
          desktopLayout: (context) => CustomersViewDesktop(),
        ),
      ),
    );
  }
}
