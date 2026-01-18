import 'package:beit_alnakha_admin/core/functions/build_popup_menu_items.dart';
import 'package:beit_alnakha_admin/core/helper/enums.dart';
import 'package:beit_alnakha_admin/core/responsive_helper/responsive_app_extensions.dart';
import 'package:beit_alnakha_admin/core/utils/app_assets.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_data_table.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_network_image.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_popup_menu_button.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_switch.dart';
import 'package:beit_alnakha_admin/features/departments/presentation/views/update_department_view.dart';
import 'package:beit_alnakha_admin/features/departments/presentation/widgets/departments_view/delete_department_dialog.dart';
import 'package:beit_alnakha_admin/features/departments/presentation/views/department_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DepartmentsDataTable extends StatelessWidget {
  const DepartmentsDataTable({super.key});

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
            columns: AppStrings.columnsNameForDepartmentsDataTable
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
                  DepartmentModel(
                    departmentName: 'برجر',
                    subDepartments: 5,
                    productsCount: 200,
                    addedDate: '2025-03-12',
                    isActive: true,
                  ),
                  DepartmentModel(
                    departmentName: 'شاورما',
                    subDepartments: 5,
                    productsCount: 200,
                    addedDate: '2025-03-12',
                    isActive: true,
                  ),
                  DepartmentModel(
                    departmentName: 'ستيك',
                    subDepartments: 5,
                    productsCount: 200,
                    addedDate: '2025-03-12',
                    isActive: false,
                  ),
                  DepartmentModel(
                    departmentName: 'مشروبات',
                    subDepartments: 5,
                    productsCount: 200,
                    addedDate: '2025-03-12',
                    isActive: true,
                  ),
                  DepartmentModel(
                    departmentName: 'سلطات',
                    subDepartments: 5,
                    productsCount: 200,
                    addedDate: '2025-03-12',
                    isActive: false,
                  ),
                  DepartmentModel(
                    departmentName: 'آيس كريم',
                    subDepartments: 5,
                    productsCount: 200,
                    addedDate: '2025-03-12',
                    isActive: true,
                  ),
                  DepartmentModel(
                    departmentName: 'حلويات',
                    subDepartments: 5,
                    productsCount: 200,
                    addedDate: '2025-03-12',
                    isActive: true,
                  ),
                  DepartmentModel(
                    departmentName: 'بيتزا',
                    subDepartments: 5,
                    productsCount: 200,
                    addedDate: '2025-03-12',
                    isActive: false,
                  ),
                  DepartmentModel(
                    departmentName: 'معجنات',
                    subDepartments: 5,
                    productsCount: 200,
                    addedDate: '2025-03-12',
                    isActive: true,
                  ),
                  DepartmentModel(
                    departmentName: 'فطور',
                    subDepartments: 5,
                    productsCount: 200,
                    addedDate: '2025-03-12',
                    isActive: false,
                  ),
                ].asMap().entries.map((e) {
                  final index = e.key;
                  final value = e.value;
                  return DataRow(
                    cells: [
                      textDataCell(context: context, text: '${index + 1}'),

                      DataCell(
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          spacing: AppSize.size8,
                          children: [
                            CustomNetworkImage(
                                width: AppSize.size30,
                                height: AppSize.size30,
                                borderRadius: AppSize.size8,
                                image: 'https://static.vecteezy.com/system/resources/thumbnails/057/068/323/small/single-fresh-red-strawberry-on-table-green-background-food-fruit-sweet-macro-juicy-plant-image-photo.jpg'),
                            Text(value.departmentName, style: AppStyles.medium14(context)),
                          ],
                        ),
                      ),
                      textDataCell(
                        context: context,
                        text: '${value.subDepartments}',
                      ),
                      textDataCell(
                        context: context,
                        text: '${value.productsCount} ${AppStrings.meal}',
                      ),
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
                                if (value == MenuActionEnum.viewDetails) {
                                  showDepartmentDetailsDialog(context: context);
                                } else if (value == MenuActionEnum.edit) {
                                  showUpdateDepartmentDialog(context: context);
                                } else if (value == MenuActionEnum.delete) {
                                  showDeleteDepartmentDialog(context: context);
                                }
                              },
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

  void showDepartmentDetailsDialog({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (context) {
        return DepartmentDetailsView();
      },
    );
  }

  void showUpdateDepartmentDialog({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (context) {
        return UpdateDepartmentView();
      },
    );
  }

  void showDeleteDepartmentDialog({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (context) {
        return DeleteDepartmentDialog();
      },
    );
  }
}

class DepartmentModel {
  final String departmentName;
  final int subDepartments;
  final int productsCount;
  final String addedDate;
  final bool isActive;

  DepartmentModel({
    required this.departmentName,
    required this.subDepartments,
    required this.productsCount,
    required this.addedDate,
    required this.isActive,
  });
}
