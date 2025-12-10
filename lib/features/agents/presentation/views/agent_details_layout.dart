import 'package:beit_alnakha_admin/core/responsive_helper/adaptive_layout.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_back_button.dart';
import 'package:beit_alnakha_admin/features/agents/presentation/views/agent_details_view_desktop.dart';
import 'package:beit_alnakha_admin/features/agents/presentation/views/agent_details_view_mobile.dart';
import 'package:flutter/material.dart';

class AgentDetailsLayout extends StatelessWidget {
  const AgentDetailsLayout({
    super.key,
    required this.agentId,

  });
  final String agentId;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: AppStrings.requestsHistoryStatusForTabBar.length,
      child: Scaffold(
        appBar: AppBar(leading: CustomBackButton(), title: const Text('حسام شفيق')),
        body: AdaptiveLayout(
          useFullScreenWidth: true,
          mobileLayout: (context) => AgentDetailsViewMobile(),
          tabletLayout: (context) => AgentDetailsViewDesktop(),
          desktopLayout: (context) => AgentDetailsViewDesktop(),
        ),
      ),
    );
  }
}
