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
import 'package:beit_alnakha_admin/features/chefs/presentation/views/update_chef_view.dart';
import 'package:beit_alnakha_admin/features/chefs/presentation/widgets/chef_view/delete_chef_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChefsDataTable extends StatelessWidget {
  const ChefsDataTable({super.key});

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
            columns: AppStrings.columnsNameForChefsDataTable
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
                  ChefModel(
                    chefName: 'محمد علي',
                    phoneNumber: '07701234567',
                    governorate: 'بغداد',
                    region: 'الكرادة',
                    stats: 'متاح',
                    isActive: true,
                  ),
                  ChefModel(
                    chefName: 'أحمد حسن',
                    phoneNumber: '07702345678',
                    governorate: 'البصرة',
                    region: 'العشار',
                    stats: 'متاح',
                    isActive: true,
                  ),
                  ChefModel(
                    chefName: 'علي كريم',
                    phoneNumber: '07703456789',
                    governorate: 'أربيل',
                    region: 'عينكاوا',
                    stats: 'متاح',
                    isActive: false,
                  ),
                  ChefModel(
                    chefName: 'حسين محمود',
                    phoneNumber: '07704567890',
                    governorate: 'بغداد',
                    region: 'المنصور',
                    stats: 'متاح',
                    isActive: true,
                  ),
                  ChefModel(
                    chefName: 'عمر صالح',
                    phoneNumber: '07705678901',
                    governorate: 'النجف',
                    region: 'الكوفة',
                    stats: 'متاح',
                    isActive: false,
                  ),
                  ChefModel(
                    chefName: 'يوسف عبدالله',
                    phoneNumber: '07706789012',
                    governorate: 'بغداد',
                    region: 'الجادرية',
                    stats: 'متاح',
                    isActive: true,
                  ),
                  ChefModel(
                    chefName: 'سعد جواد',
                    phoneNumber: '07707890123',
                    governorate: 'كربلاء',
                    region: 'المركز',
                    stats: 'متاح',
                    isActive: true,
                  ),
                  ChefModel(
                    chefName: 'خالد ناصر',
                    phoneNumber: '07708901234',
                    governorate: 'بغداد',
                    region: 'زيونة',
                    stats: 'متاح',
                    isActive: false,
                  ),
                  ChefModel(
                    chefName: 'مصطفى رياض',
                    phoneNumber: '07709012345',
                    governorate: 'الموصل',
                    region: 'الدواسة',
                    stats: 'متاح',
                    isActive: true,
                  ),
                  ChefModel(
                    chefName: 'فاضل عبدالرحمن',
                    phoneNumber: '07710123456',
                    governorate: 'بغداد',
                    region: 'البياع',
                    stats: 'متاح',
                    isActive: false,
                  ),
                ].asMap().entries.map((e) {
                  final index = e.key;
                  final value = e.value;
                  return DataRow(
                    cells: [
                      textDataCell(context: context, text: '${index + 1}'),
                      textDataCell(context: context, text: value.chefName),
                      textDataCell(context: context, text: value.phoneNumber),
                      textDataCell(context: context, text: value.governorate),
                      textDataCell(context: context, text: value.region),
                      textDataCell(context: context, text: value.stats),
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
                                  showUpdateChefDialog(context: context);
                                } else if (value == MenuActionEnum.delete) {
                                  showDeleteChefDialog(context: context);
                                } else if (value ==
                                    MenuActionEnum.whatsappContact) {}
                              },
                              items: buildPopupMenuItems(context, [
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

  void showUpdateChefDialog({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (context) {
        return UpdateChefView();
      },
    );
  }

  void showDeleteChefDialog({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (context) {
        return DeleteChefDialog();
      },
    );
  }
}

class ChefModel {
  final String chefName;
  final String phoneNumber;
  final String governorate;
  final String region;
  final String stats;
  final bool isActive;

  ChefModel({
    required this.chefName,
    required this.phoneNumber,
    required this.governorate,
    required this.region,
    required this.stats,
    required this.isActive,
  });
}
