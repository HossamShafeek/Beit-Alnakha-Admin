import 'package:beit_alnakha_admin/core/responsive_helper/adaptive_layout.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_back_button.dart';
import 'package:beit_alnakha_admin/features/customers/presentation/views/customer_details_view_desktop.dart';
import 'package:beit_alnakha_admin/features/customers/presentation/views/customer_details_view_mobile.dart';
import 'package:flutter/material.dart';

class CustomerDetailsViewLayout extends StatelessWidget {
  const CustomerDetailsViewLayout({
    super.key,
    required this.customerId,

  });
  final String customerId;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: AppStrings.requestsHistoryStatusForTabBar.length,
      child: Scaffold(
        appBar: AppBar(leading: CustomBackButton(), title: const Text('حسام شفيق')),
        body: AdaptiveLayout(
          useFullScreenWidth: true,
          mobileLayout: (context) => CustomerDetailsViewMobile(),
          tabletLayout: (context) => CustomerDetailsViewDesktop(),
          desktopLayout: (context) => CustomerDetailsViewDesktop(),
        ),
      ),
    );
  }
}
