import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_container_with_title.dart';
import 'package:beit_alnakha_admin/features/agents/presentation/widgets/agent_details_view/agent_details_data_section_app_bar.dart';
import 'package:beit_alnakha_admin/features/agents/presentation/widgets/agent_details_view/agent_details_data_section_body.dart';
import 'package:flutter/material.dart';

class AgentDetailsDataSection extends StatelessWidget {
  const AgentDetailsDataSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainerWithTitle(
      child: Center(
        child: Column(
          spacing: AppSize.size10,
          children: [
            AgentDetailsDataSectionAppBar(),
            AgentDetailsDataSectionBody(),
          ],
        ),
      ),
    );
  }
}
