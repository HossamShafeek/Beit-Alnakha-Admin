import 'package:beit_alnakha_admin/core/functions/build_popup_menu_items.dart';
import 'package:beit_alnakha_admin/core/helper/enums.dart';
import 'package:beit_alnakha_admin/core/responsive_helper/responsive_app_extensions.dart';
import 'package:beit_alnakha_admin/core/utils/app_assets.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_data_table.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_popup_menu_button.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AgentsDataTable extends StatelessWidget {
  const AgentsDataTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.withFormFactor(
          onMobile: AppSize.size16,
          onTablet: AppSize.size24,
          onDesktop: AppSize.size24,
        ),
      ),
      child: Column(
        children: [
          CustomDataTable(
            columns: AppStrings.columnsNameForAgentsDataTable
                .map(
                  (e) => DataColumn(
                label: Expanded(
                  child: Center(
                    child: Text(
                      e,
                      style: AppStyles.medium14(
                        context,
                      ).copyWith(color: AppColors.grey7A),
                    ),
                  ),
                ),
              ),
            )
                .toList(),
            rows:
            [
              AgentModel(
                agentName: 'محمد علي',
                agentCode: 'AGX0096',
                points: '87${AppStrings.point}',
                requests: '15',
                totalProfits: '10000 ${AppStrings.iraqCurrency}',

                isActive: true,
              ),
              AgentModel(
                agentName: 'محمد علي',
                agentCode: 'AGX0096',
                points: '87${AppStrings.point}',
                requests: '15',
                totalProfits: '10000 ${AppStrings.iraqCurrency}',

                isActive: true,
              ),
              AgentModel(
                agentName: 'محمد علي',
                agentCode: 'AGX0096',
                points: '87${AppStrings.point}',
                requests: '15',
                totalProfits: '10000 ${AppStrings.iraqCurrency}',

                isActive: false,
              ),
              AgentModel(
                agentName: 'محمد علي',
                agentCode: 'AGX0096',
                points: '87${AppStrings.point}',
                requests: '15',
                totalProfits: '10000 ${AppStrings.iraqCurrency}',

                isActive: true,
              ),
              AgentModel(
                agentName: 'محمد علي',
                agentCode: 'AGX0096',
                points: '87${AppStrings.point}',
                requests: '15',
                totalProfits: '10000 ${AppStrings.iraqCurrency}',

                isActive: false,
              ),
              AgentModel(
                agentName: 'محمد علي',
                agentCode: 'AGX0096',
                points: '87${AppStrings.point}',
                requests: '15',
                totalProfits: '10000 ${AppStrings.iraqCurrency}',

                isActive: true,
              ),
              AgentModel(
                agentName: 'محمد علي',
                agentCode: 'AGX0096',
                points: '87${AppStrings.point}',
                requests: '15',
                totalProfits: '10000 ${AppStrings.iraqCurrency}',

                isActive: true,
              ),
              AgentModel(
                agentName: 'محمد علي',
                agentCode: 'AGX0096',
                points: '87${AppStrings.point}',
                requests: '15',
                totalProfits: '10000 ${AppStrings.iraqCurrency}',

                isActive: false,
              ),
              AgentModel(
                agentName: 'محمد علي',
                agentCode: 'AGX0096',
                points: '87${AppStrings.point}',
                requests: '15',
                totalProfits: '10000 ${AppStrings.iraqCurrency}',

                isActive: true,
              ),
              AgentModel(
                agentName: 'محمد علي',
                agentCode: 'AGX0096',
                points: '87${AppStrings.point}',
                requests: '15',
                totalProfits: '10000 ${AppStrings.iraqCurrency}',

                isActive: false,
              ),
            ].asMap().entries.map((e) {
              final index = e.key;
              final value = e.value;
              return DataRow(
                cells: [
                  textDataCell(context: context, text: '${index + 1}'),
                  textDataCell(context: context, text: value.agentName),
                  textDataCell(
                    context: context,
                    text: value.agentCode,

                  ),
                  textDataCell(context: context, text: value.points,),
                  textDataCell(context: context, text: value.requests),
                  textDataCell(context: context, text: value.totalProfits),

                  widgetDataCell(
                    widget: Row(
                      mainAxisSize: MainAxisSize.min,
                      spacing: AppSize.size8,
                      children: [
                        CustomSwitch(
                          value: value.isActive,
                          onChanged: (value) {},
                        ),
                        CustomPopupMenuButton(
                          onSelected: (value) {},
                          items: buildPopupMenuItems(context, [
                            MenuActionEnum.viewDetails,
                            MenuActionEnum.edit,
                            MenuActionEnum.delete,
                          ]),
                          child: Padding(
                            padding: const EdgeInsets.all(AppSize.size6),
                            child: SvgPicture.asset(
                              AppAssets.more,
                              height: AppSize.size24,
                              width: AppSize.size24,
                              colorFilter: const ColorFilter.mode(
                                AppColors.secondaryBlack,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class AgentModel {
  final String agentName;
  final String agentCode;
  final String points;
  final String requests;
  final String totalProfits;
  final bool isActive;

  AgentModel({
    required this.agentName,
    required this.agentCode,
    required this.points,
    required this.requests,
    required this.totalProfits,
    required this.isActive,
  });
}
