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
import 'package:beit_alnakha_admin/features/employees/presentation/views/update_employee_view.dart';
import 'package:beit_alnakha_admin/features/employees/presentation/widgets/employee_view/delete_employee_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmployeesDataTable extends StatelessWidget {
  const EmployeesDataTable({super.key});

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
            columns: AppStrings.columnsNameForEmployeesDataTable
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
                  EmployeeModel(
                    employeeName: 'أحمد سعيد',
                    phoneNumber: '07701234567',
                    governorate: 'بغداد',
                    region: 'الكرادة',
                    addedDate: '2024-01-15',
                    isActive: true,
                  ),
                  EmployeeModel(
                    employeeName: 'محمد علي',
                    phoneNumber: '07702345678',
                    governorate: 'البصرة',
                    region: 'العشار',
                    addedDate: '2024-02-10',
                    isActive: true,
                  ),
                  EmployeeModel(
                    employeeName: 'سارة حسن',
                    phoneNumber: '07703456789',
                    governorate: 'أربيل',
                    region: 'عينكاوا',
                    addedDate: '2024-03-05',
                    isActive: false,
                  ),
                  EmployeeModel(
                    employeeName: 'علي رضا',
                    phoneNumber: '07704567890',
                    governorate: 'بغداد',
                    region: 'المنصور',
                    addedDate: '2024-04-20',
                    isActive: true,
                  ),
                  EmployeeModel(
                    employeeName: 'نور محمد',
                    phoneNumber: '07705678901',
                    governorate: 'النجف',
                    region: 'الكوفة',
                    addedDate: '2024-05-12',
                    isActive: false,
                  ),
                ].asMap().entries.map((e) {
                  final index = e.key;
                  final value = e.value;
                  return DataRow(
                    cells: [
                      textDataCell(context: context, text: '${index + 1}'),
                      textDataCell(context: context, text: value.employeeName),
                      textDataCell(context: context, text: value.phoneNumber),
                      textDataCell(context: context, text: value.governorate),
                      textDataCell(context: context, text: value.region),
                      textDataCell(context: context, text: value.addedDate),
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
                                  showUpdateEmployeeDialog(context: context);
                                } else if (value == MenuActionEnum.delete) {
                                  showDeleteEmployeeDialog(context: context);
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

  void showUpdateEmployeeDialog({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (context) {
        return UpdateEmployeeView();
      },
    );
  }

  void showDeleteEmployeeDialog({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (context) {
        return DeleteEmployeeDialog();
      },
    );
  }
}

class EmployeeModel {
  final String employeeName;
  final String phoneNumber;
  final String governorate;
  final String region;
  final String addedDate;
  final bool isActive;

  EmployeeModel({
    required this.employeeName,
    required this.phoneNumber,
    required this.governorate,
    required this.region,
    required this.addedDate,
    required this.isActive,
  });
}
