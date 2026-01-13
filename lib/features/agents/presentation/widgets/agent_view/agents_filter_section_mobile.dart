import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';
import 'package:beit_alnakha_admin/features/agents/presentation/widgets/agent_view/add_agent_button.dart';
import 'package:beit_alnakha_admin/features/agents/presentation/widgets/agent_view/agents_search_field.dart';
import 'package:flutter/material.dart';

class AgentsFilterSectionMobile extends StatelessWidget {
  const AgentsFilterSectionMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSize.size16,
      ),
      child: Column(
        spacing: AppSize.size8,
        children: [
          Row(
            spacing: AppSize.size8,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.agentsMenu,
                style: AppStyles.semiBold20(context),
              ),
            ],
          ),
          Row(
            spacing: AppSize.size8,
            children: [
              Expanded(child: AgentsSearchField()),
              AddAgentButton(),
            ],
          ),
        ],
      ),
    );
  }
}
