import 'package:beit_alnakha_admin/config/routes/routes.dart';
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
import 'package:beit_alnakha_admin/features/influencers/presentation/views/update_influencer_view.dart';
import 'package:beit_alnakha_admin/features/influencers/presentation/widgets/influencer_view/delete_influencer_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class InfluencersDataTable extends StatelessWidget {
  const InfluencersDataTable({super.key});

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
            columns: AppStrings.columnsNameForInfluencersDataTable
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
                  InfluencerModel(
                    influencerName: 'محمد علي',
                    phone: 'INF0096',
                    points: '87',
                    requests: '15',
                    totalProfits: '10000 ${AppStrings.iraqCurrency}',

                    isActive: true,
                  ),
                  InfluencerModel(
                    influencerName: 'محمد علي',
                    phone: 'INF0096',
                    points: '87',
                    requests: '15',
                    totalProfits: '10000 ${AppStrings.iraqCurrency}',

                    isActive: true,
                  ),
                  InfluencerModel(
                    influencerName: 'محمد علي',
                    phone: 'INF0096',
                    points: '87',
                    requests: '15',
                    totalProfits: '10000 ${AppStrings.iraqCurrency}',

                    isActive: false,
                  ),
                  InfluencerModel(
                    influencerName: 'محمد علي',
                    phone: 'INF0096',
                    points: '87',
                    requests: '15',
                    totalProfits: '10000 ${AppStrings.iraqCurrency}',

                    isActive: true,
                  ),
                  InfluencerModel(
                    influencerName: 'محمد علي',
                    phone: 'INF0096',
                    points: '87',
                    requests: '15',
                    totalProfits: '10000 ${AppStrings.iraqCurrency}',

                    isActive: false,
                  ),
                  InfluencerModel(
                    influencerName: 'محمد علي',
                    phone: 'INF0096',
                    points: '87',
                    requests: '15',
                    totalProfits: '10000 ${AppStrings.iraqCurrency}',

                    isActive: true,
                  ),
                  InfluencerModel(
                    influencerName: 'محمد علي',
                    phone: 'INF0096',
                    points: '87',
                    requests: '15',
                    totalProfits: '10000 ${AppStrings.iraqCurrency}',

                    isActive: true,
                  ),
                  InfluencerModel(
                    influencerName: 'محمد علي',
                    phone: 'INF0096',
                    points: '87',
                    requests: '15',
                    totalProfits: '10000 ${AppStrings.iraqCurrency}',

                    isActive: false,
                  ),
                  InfluencerModel(
                    influencerName: 'محمد علي',
                    phone: 'INF0096',
                    points: '87',
                    requests: '15',
                    totalProfits: '10000 ${AppStrings.iraqCurrency}',

                    isActive: true,
                  ),
                  InfluencerModel(
                    influencerName: 'محمد علي',
                    phone: 'INF0096',
                    points: '87',
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
                      textDataCell(
                        context: context,
                        text: value.influencerName,
                      ),
                      textDataCell(
                        context: context,
                        text: value.phone,
                      ),
                      textDataCell(
                        context: context,
                        text: '${value.points} ${AppStrings.point}',
                      ),
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
                              onSelected: (value) {
                                if (value == MenuActionEnum.viewDetails) {
                                  context.pushNamed(
                                    Routes.influencerDetailsView,
                                    pathParameters: {'influencerId': '112000'},
                                  );
                                } else if (value == MenuActionEnum.edit) {
                                  showUpdateInfluencerDialog(context: context);
                                } else if (value == MenuActionEnum.delete) {
                                  showDeleteInfluencerDialog(context: context);
                                } else if (value ==
                                    MenuActionEnum.whatsappContact) {}
                              },
                              items: buildPopupMenuItems(context, [
                                MenuActionEnum.viewDetails,
                                MenuActionEnum.addFeature,
                                MenuActionEnum.edit,
                                MenuActionEnum.delete,
                                MenuActionEnum.whatsappContact,
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

  void showUpdateInfluencerDialog({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (context) {
        return UpdateInfluencerView();
      },
    );
  }

  void showDeleteInfluencerDialog({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (context) {
        return DeleteInfluencerDialog();
      },
    );
  }
}

class InfluencerModel {
  final String influencerName;
  final String phone;
  final String points;
  final String requests;
  final String totalProfits;
  final bool isActive;

  InfluencerModel({
    required this.influencerName,
    required this.phone,
    required this.points,
    required this.requests,
    required this.totalProfits,
    required this.isActive,
  });
}
