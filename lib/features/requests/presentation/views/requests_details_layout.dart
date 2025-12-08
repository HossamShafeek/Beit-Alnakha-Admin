import 'package:beit_alnakha_admin/core/responsive_helper/adaptive_layout.dart';
import 'package:beit_alnakha_admin/core/responsive_helper/responsive_app_extensions.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_back_button.dart';
import 'package:beit_alnakha_admin/features/requests/presentation/views/requests_details_view_desktop.dart';
import 'package:beit_alnakha_admin/features/requests/presentation/views/requests_details_view_mobile.dart';
import 'package:beit_alnakha_admin/features/requests/presentation/widgets/requests_details_view/requests_change_status_popup_menu.dart';
import 'package:flutter/material.dart';

class RequestsDetailsLayout extends StatelessWidget {
  const RequestsDetailsLayout({super.key, required this.requestId});

  final String requestId;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: AppSize.size12,
          children: [
            Flexible(child: Text('${AppStrings.requestsDetails} - $requestId')),
            RequestsChangeStatusPopupMenu(),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          bottom: context.withFormFactor(
            onMobile: AppSize.size16,
            onTablet: AppSize.size24,
            onDesktop: AppSize.size24,
          ),
        ),
        child: AdaptiveLayout(
          useFullScreenWidth: true,
          mobileLayout: (context) => RequestsDetailsViewMobile(),
          tabletLayout: (context) => RequestsDetailsViewMobile(),
          desktopLayout: (context) => RequestsDetailsViewDesktop(),
        ),
      ),
    );
  }
}
