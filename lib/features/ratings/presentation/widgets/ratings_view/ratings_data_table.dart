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
import 'package:beit_alnakha_admin/features/ratings/presentation/widgets/ratings_view/delete_rating_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RatingsDataTable extends StatelessWidget {
  const RatingsDataTable({super.key});

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
            columns: AppStrings.columnsNameForRatingsDataTable
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
                  RatingModel(
                    starsCount: 4,
                    customerName: 'محمود جمعة',
                    requestNumber: '#ORD_40213',
                    driverName: 'أحمد جمال',
                    date: '2025-03-12',
                    isActive: true,
                  ),
                  RatingModel(
                    starsCount: 4,
                    customerName: 'محمود جمعة',
                    requestNumber: '#ORD_40213',
                    driverName: 'أحمد جمال',
                    date: '2025-03-12',
                    isActive: true,
                  ),
                  RatingModel(
                    starsCount: 4,
                    customerName: 'محمود جمعة',
                    requestNumber: '#ORD_40213',
                    driverName: 'أحمد جمال',
                    date: '2025-03-12',
                    isActive: false,
                  ),
                  RatingModel(
                    starsCount: 4,
                    customerName: 'محمود جمعة',
                    requestNumber: '#ORD_40213',
                    driverName: 'أحمد جمال',
                    date: '2025-03-12',
                    isActive: true,
                  ),
                  RatingModel(
                    starsCount: 4,
                    customerName: 'محمود جمعة',
                    requestNumber: '#ORD_40213',
                    driverName: 'أحمد جمال',
                    date: '2025-03-12',
                    isActive: false,
                  ),
                  RatingModel(
                    starsCount: 4,
                    customerName: 'محمود جمعة',
                    requestNumber: '#ORD_40213',
                    driverName: 'أحمد جمال',
                    date: '2025-03-12',
                    isActive: true,
                  ),
                  RatingModel(
                    starsCount: 4,
                    customerName: 'محمود جمعة',
                    requestNumber: '#ORD_40213',
                    driverName: 'أحمد جمال',
                    date: '2025-03-12',
                    isActive: true,
                  ),
                  RatingModel(
                    starsCount: 4,
                    customerName: 'محمود جمعة',
                    requestNumber: '#ORD_40213',
                    driverName: 'أحمد جمال',
                    date: '2025-03-12',
                    isActive: false,
                  ),
                  RatingModel(
                    starsCount: 4,
                    customerName: 'محمود جمعة',
                    requestNumber: '#ORD_40213',
                    driverName: 'أحمد جمال',
                    date: '2025-03-12',
                    isActive: true,
                  ),
                  RatingModel(
                    starsCount: 4,
                    customerName: 'محمود جمعة',
                    requestNumber: '#ORD_40213',
                    driverName: 'أحمد جمال',
                    date: '2025-03-12',
                    isActive: false,
                  ),
                ].asMap().entries.map((e) {
                  final index = e.key;
                  final value = e.value;
                  return DataRow(
                    cells: [
                      textDataCell(context: context, text: '${index + 1}'),
                      widgetDataCell(
                        widget: Row(
                          mainAxisSize: MainAxisSize.min,
                          spacing: AppSize.size4,
                          children: [
                            Text(
                              '${value.starsCount}',
                              style: AppStyles.medium14(context),
                            ),
                            Icon(
                              Icons.star,
                              color: AppColors.primary,
                              size: AppSize.size16,
                            ),
                          ],
                        ),
                      ),
                      textDataCell(context: context, text: value.customerName),
                      textDataCell(context: context, text: value.requestNumber),
                      textDataCell(context: context, text: value.driverName),
                      textDataCell(context: context, text: value.date),
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
                                if (value == MenuActionEnum.delete) {
                                  showDeleteRatingDialog(context: context);
                                }
                              },
                              items: buildPopupMenuItems(context, [
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

  void showDeleteRatingDialog({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (context) {
        return DeleteRatingDialog();
      },
    );
  }
}

class RatingModel {
  final int starsCount;
  final String customerName;
  final String requestNumber;
  final String driverName;
  final String date;
  final bool isActive;

  RatingModel({
    required this.starsCount,
    required this.customerName,
    required this.requestNumber,
    required this.driverName,
    required this.date,
    required this.isActive,
  });
}
