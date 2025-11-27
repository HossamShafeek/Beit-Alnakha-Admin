import 'package:beit_alnakha_admin/core/responsive_helper/responsive_app_extensions.dart';
import 'package:beit_alnakha_admin/core/responsive_helper/screen_width_breakpoints.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';
import 'package:beit_alnakha_admin/features/agents/presentation/widgets/add_agent_button.dart';
import 'package:beit_alnakha_admin/features/agents/presentation/widgets/agents_search_field.dart';
import 'package:beit_alnakha_admin/features/drivers/presentation/widgets/add_driver_button.dart';
import 'package:flutter/material.dart';

class AgentsFilterSection extends StatelessWidget {
  const AgentsFilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return context.width > ScreenWidthBreakpoints.tablet
        ? Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.withFormFactor(
          onMobile: AppSize.size16,
          onTablet: AppSize.size24,
          onDesktop: AppSize.size24,
        ),
      ),
            child: Row(
              spacing: AppSize.size10,
              children: [
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerRight,
                    child: Text(
                      AppStrings.agentsMenu,
                      maxLines: 1,
                      style: AppStyles.semiBold20(context),
                    ),
                  ),
                ),
                AgentsSearchField(),
                AddAgentButton(),
              ],
            ),
          )
        : Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.withFormFactor(
          onMobile: AppSize.size16,
          onTablet: AppSize.size24,
          onDesktop: AppSize.size24,
        ),
      ),
            child: Column(
              spacing: AppSize.size8,
              children: [
                Row(
                  spacing: AppSize.size8,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.requestsMenu,
                      style: AppStyles.semiBold20(context),
                    ),
                  ],
                ),
                Row(
                  spacing: AppSize.size8,
                  children: [
                    Expanded(child: AgentsSearchField()),
                    AddDriverButton(),
                  ],
                ),
              ],
            ),
          );
  }
}
