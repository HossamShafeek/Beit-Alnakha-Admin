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
import 'package:beit_alnakha_admin/features/awards/presentation/views/update_award_view.dart';
import 'package:beit_alnakha_admin/features/awards/presentation/widgets/awards_view/delete_award_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AwardsDataTable extends StatelessWidget {
  const AwardsDataTable({super.key});

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
            columns: AppStrings.columnsNameForAwardsDataTable
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
                  AwardModel(
                    awardName: 'رصيد محفظة 50 نقطة',
                    addedDate: '2025.03.12',
                    requiredPoints: '50 نقطة',
                    userType: 'سائق',
                    isActive: true,
                  ),
                  AwardModel(
                    awardName: 'رصيد محفظة 50 نقطة',
                    addedDate: '2025.03.12',
                    requiredPoints: '50 نقطة',
                    userType: 'وكيل',
                    isActive: true,
                  ),
                  AwardModel(
                    awardName: 'رصيد محفظة 50 نقطة',
                    addedDate: '2025.03.12',
                    requiredPoints: '50 نقطة',
                    userType: 'مشهور',
                    isActive: false,
                  ),
                  AwardModel(
                    awardName: 'رصيد محفظة 50 نقطة',
                    addedDate: '2025.03.12',
                    requiredPoints: '50 نقطة',
                    userType: 'زبون',
                    isActive: true,
                  ),
                  AwardModel(
                    awardName: 'رصيد محفظة 50 نقطة',
                    addedDate: '2025.03.12',
                    requiredPoints: '50 نقطة',
                    userType: 'سائق',
                    isActive: false,
                  ),
                  AwardModel(
                    awardName: 'رصيد محفظة 50 نقطة',
                    addedDate: '2025.03.12',
                    requiredPoints: '50 نقطة',
                    userType: 'سائق',
                    isActive: true,
                  ),
                  AwardModel(
                    awardName: 'رصيد محفظة 50 نقطة',
                    addedDate: '2025.03.12',
                    requiredPoints: '50 نقطة',
                    userType: 'سائق',
                    isActive: true,
                  ),
                  AwardModel(
                    awardName: 'رصيد محفظة 50 نقطة',
                    addedDate: '2025.03.12',
                    requiredPoints: '50 نقطة',
                    userType: 'زبون',
                    isActive: false,
                  ),
                  AwardModel(
                    awardName: 'رصيد محفظة 50 نقطة',
                    addedDate: '2025.03.12',
                    requiredPoints: '50 نقطة',
                    userType: 'زبون',
                    isActive: true,
                  ),
                  AwardModel(
                    awardName: 'رصيد محفظة 50 نقطة',
                    addedDate: '2025.03.12',
                    requiredPoints: '50 نقطة',
                    userType: 'وكيل',
                    isActive: false,
                  ),
                ].asMap().entries.map((e) {
                  final index = e.key;
                  final value = e.value;
                  return DataRow(
                    cells: [
                      textDataCell(context: context, text: '${index + 1}'),
                      textDataCell(context: context, text: value.awardName),
                      textDataCell(context: context, text: value.addedDate),
                      textDataCell(
                        context: context,
                        text: value.requiredPoints,
                      ),
                      textDataCell(context: context, text: value.userType),
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
                              onSelected: (value) {
                                if (value == MenuActionEnum.edit) {
                                  showUpdateAwardDialog(context: context);
                                } else if (value == MenuActionEnum.delete) {
                                  showDeleteAwardDialog(context: context);
                                }
                              },
                              items: buildPopupMenuItems(context, [
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

  void showUpdateAwardDialog({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (context) {
        return UpdateAwardView();
      },
    );
  }

  void showDeleteAwardDialog({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (context) {
        return DeleteAwardDialog();
      },
    );
  }
}

class AwardModel {
  final String awardName;
  final String addedDate;
  final String requiredPoints;
  final String userType;
  final bool isActive;

  AwardModel({
    required this.awardName,
    required this.addedDate,
    required this.requiredPoints,
    required this.userType,
    required this.isActive,
  });
}
