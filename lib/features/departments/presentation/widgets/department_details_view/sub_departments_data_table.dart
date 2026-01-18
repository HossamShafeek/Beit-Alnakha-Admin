import 'package:beit_alnakha_admin/core/functions/build_popup_menu_items.dart';
import 'package:beit_alnakha_admin/core/helper/enums.dart';
import 'package:beit_alnakha_admin/core/utils/app_assets.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_data_table.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_network_image.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_popup_menu_button.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_switch.dart';
import 'package:beit_alnakha_admin/features/departments/presentation/views/update_sub_department_view.dart';
import 'package:beit_alnakha_admin/features/departments/presentation/widgets/department_details_view/delete_sub_department_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SubDepartmentsDataTable extends StatelessWidget {
  const SubDepartmentsDataTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSize.size16),
      child: Column(
        children: [
          CustomDataTable(
            columns: _buildColumns(context),
            rows: _buildRows(context),
          ),
        ],
      ),
    );
  }

  List<DataColumn> _buildColumns(BuildContext context) {
    return AppStrings.columnsNameForSubDepartmentsDataTable
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
        .toList();
  }

  List<DataRow> _buildRows(BuildContext context) {
    final subDepartments = [
      SubDepartmentModel(
        departmentName: 'برجر لحم',
        subDepartmentPrice: '5.000 د.ع',
        addedDate: '2025-03-12',
        imageUrl: '',
        isActive: true,
      ),
      SubDepartmentModel(
        departmentName: 'برجر دجاج',
        subDepartmentPrice: '200 وجبة',
        addedDate: '2025-03-12',
        imageUrl: '',
        isActive: true,
      ),
      SubDepartmentModel(
        departmentName: 'برجر نباتي',
        subDepartmentPrice: '200 وجبة',
        addedDate: '2025-03-12',
        imageUrl: '',
        isActive: false,
      ),
    ];

    return subDepartments.asMap().entries.map((e) {
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
          textDataCell(context: context, text: value.subDepartmentPrice),
          textDataCell(context: context, text: value.addedDate),
          widgetDataCell(
            widget: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: AppSize.size8,
              children: [
                CustomSwitch(value: value.isActive, onChanged: (value) {}),
                CustomPopupMenuButton(
                  onSelected: (menuValue) {
                    if (menuValue == MenuActionEnum.edit) {
                      showUpdateSubDepartmentDialog(context: context);
                    } else if (menuValue == MenuActionEnum.delete) {
                      showDeleteSubDepartmentDialog(context: context);
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
    }).toList();
  }

  void showUpdateSubDepartmentDialog({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (context) {
        return UpdateSubDepartmentView();
      },
    );
  }

  void showDeleteSubDepartmentDialog({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (context) {
        return DeleteSubDepartmentDialog();
      },
    );
  }
}

class SubDepartmentModel {
  final String departmentName;
  final String subDepartmentPrice;
  final String addedDate;
  final String imageUrl;
  final bool isActive;

  SubDepartmentModel({
    required this.departmentName,
    required this.subDepartmentPrice,
    required this.addedDate,
    required this.imageUrl,
    required this.isActive,
  });
}
