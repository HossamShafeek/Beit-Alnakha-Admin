import 'package:beit_alnakha_admin/core/responsive_helper/adaptive_layout.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_back_button.dart';
import 'package:beit_alnakha_admin/features/influencers/presentation/views/influencer_details_view_desktop.dart';
import 'package:beit_alnakha_admin/features/influencers/presentation/views/influencer_details_view_mobile.dart';
import 'package:flutter/material.dart';

class InfluencerDetailsLayout extends StatelessWidget {
  const InfluencerDetailsLayout({super.key, required this.influencerId});
  final String influencerId;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: AppStrings.requestsHistoryStatusForTabBar.length,
      child: Scaffold(
        appBar: AppBar(
          leading: CustomBackButton(),
          title: const Text('حسام شفيق'),
        ),
        body: AdaptiveLayout(
          useFullScreenWidth: true,
          mobileLayout: (context) => InfluencerDetailsViewMobile(),
          tabletLayout: (context) => InfluencerDetailsViewDesktop(),
          desktopLayout: (context) => InfluencerDetailsViewDesktop(),
        ),
      ),
    );
  }
}
