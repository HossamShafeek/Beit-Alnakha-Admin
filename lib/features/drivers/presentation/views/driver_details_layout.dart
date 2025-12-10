import 'package:beit_alnakha_admin/core/responsive_helper/adaptive_layout.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_back_button.dart';
import 'package:beit_alnakha_admin/features/drivers/presentation/views/driver_details_view_desktop.dart';
import 'package:beit_alnakha_admin/features/drivers/presentation/views/driver_details_view_mobile.dart';
import 'package:flutter/material.dart';

class DriverDetailsLayout extends StatelessWidget {
  const DriverDetailsLayout({
    super.key,
    required this.driverId,

  });
  final String driverId;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: AppStrings.driverDetailsStatusForTabBar.length,
      child: Scaffold(
        appBar: AppBar(leading: CustomBackButton(), title: const Text('حسام شفيق')),
        body: AdaptiveLayout(
          useFullScreenWidth: true,
          mobileLayout: (context) => DriverDetailsViewMobile(),
          tabletLayout: (context) => DriverDetailsViewDesktop(),
          desktopLayout: (context) => DriverDetailsViewDesktop(),
        ),
      ),
    );
  }
}
