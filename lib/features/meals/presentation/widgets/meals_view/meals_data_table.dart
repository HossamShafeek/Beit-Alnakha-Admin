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
import 'package:beit_alnakha_admin/features/meals/presentation/widgets/meals_view/delete_meal_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MealsDataTable extends StatelessWidget {
  const MealsDataTable({super.key});

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
            columns: AppStrings.columnsNameForMealsDataTable
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
            rows: _buildRows(context),
          ),
        ],
      ),
    );
  }

  List<DataRow> _buildRows(BuildContext context) {
    final meals = [
      MealModel(
        mealName: 'برجر لحم كلاسيك',
        mealPrice: '5.000 د.ع',
        departmentName: 'برجر',
        subDepartmentName: 'برجر لحم',
        lastUpdate: '2025-03-12',
        imageUrl:
            'https://static.vecteezy.com/system/resources/thumbnails/057/068/323/small/single-fresh-red-strawberry-on-table-green-background-food-fruit-sweet-macro-juicy-plant-image-photo.jpg',
        isActive: true,
      ),
      MealModel(
        mealName: 'برجر دجاج مقرمش',
        mealPrice: '4.500 د.ع',
        departmentName: 'برجر',
        subDepartmentName: 'برجر دجاج',
        lastUpdate: '2025-03-10',
        imageUrl:
            'https://static.vecteezy.com/system/resources/thumbnails/057/068/323/small/single-fresh-red-strawberry-on-table-green-background-food-fruit-sweet-macro-juicy-plant-image-photo.jpg',
        isActive: true,
      ),
      MealModel(
        mealName: 'شاورما لحم',
        mealPrice: '3.500 د.ع',
        departmentName: 'شاورما',
        subDepartmentName: 'شاورما عربي',
        lastUpdate: '2025-03-08',
        imageUrl:
            'https://static.vecteezy.com/system/resources/thumbnails/057/068/323/small/single-fresh-red-strawberry-on-table-green-background-food-fruit-sweet-macro-juicy-plant-image-photo.jpg',
        isActive: false,
      ),
      MealModel(
        mealName: 'بيتزا مارغريتا',
        mealPrice: '8.000 د.ع',
        departmentName: 'بيتزا',
        subDepartmentName: 'بيتزا إيطالي',
        lastUpdate: '2025-03-05',
        imageUrl:
            'https://static.vecteezy.com/system/resources/thumbnails/057/068/323/small/single-fresh-red-strawberry-on-table-green-background-food-fruit-sweet-macro-juicy-plant-image-photo.jpg',
        isActive: true,
      ),
      MealModel(
        mealName: 'ستيك ريب آي',
        mealPrice: '15.000 د.ع',
        departmentName: 'ستيك',
        subDepartmentName: 'ستيك أمريكي',
        lastUpdate: '2025-03-01',
        imageUrl:
            'https://static.vecteezy.com/system/resources/thumbnails/057/068/323/small/single-fresh-red-strawberry-on-table-green-background-food-fruit-sweet-macro-juicy-plant-image-photo.jpg',
        isActive: true,
      ),
      MealModel(
        mealName: 'سلطة سيزر',
        mealPrice: '2.500 د.ع',
        departmentName: 'سلطات',
        subDepartmentName: 'سلطات خضراء',
        lastUpdate: '2025-02-28',
        imageUrl:
            'https://static.vecteezy.com/system/resources/thumbnails/057/068/323/small/single-fresh-red-strawberry-on-table-green-background-food-fruit-sweet-macro-juicy-plant-image-photo.jpg',
        isActive: false,
      ),
      MealModel(
        mealName: 'عصير برتقال طازج',
        mealPrice: '1.500 د.ع',
        departmentName: 'مشروبات',
        subDepartmentName: 'عصائر طبيعية',
        lastUpdate: '2025-02-25',
        imageUrl:
            'https://static.vecteezy.com/system/resources/thumbnails/057/068/323/small/single-fresh-red-strawberry-on-table-green-background-food-fruit-sweet-macro-juicy-plant-image-photo.jpg',
        isActive: true,
      ),
      MealModel(
        mealName: 'آيس كريم فانيلا',
        mealPrice: '2.000 د.ع',
        departmentName: 'آيس كريم',
        subDepartmentName: 'آيس كريم كلاسيك',
        lastUpdate: '2025-02-20',
        imageUrl:
            'https://static.vecteezy.com/system/resources/thumbnails/057/068/323/small/single-fresh-red-strawberry-on-table-green-background-food-fruit-sweet-macro-juicy-plant-image-photo.jpg',
        isActive: true,
      ),
      MealModel(
        mealName: 'كنافة نابلسية',
        mealPrice: '3.000 د.ع',
        departmentName: 'حلويات',
        subDepartmentName: 'حلويات شرقية',
        lastUpdate: '2025-02-15',
        imageUrl:
            'https://static.vecteezy.com/system/resources/thumbnails/057/068/323/small/single-fresh-red-strawberry-on-table-green-background-food-fruit-sweet-macro-juicy-plant-image-photo.jpg',
        isActive: false,
      ),
      MealModel(
        mealName: 'فطور عربي كامل',
        mealPrice: '6.000 د.ع',
        departmentName: 'فطور',
        subDepartmentName: 'فطور عربي',
        lastUpdate: '2025-02-10',
        imageUrl:
            'https://static.vecteezy.com/system/resources/thumbnails/057/068/323/small/single-fresh-red-strawberry-on-table-green-background-food-fruit-sweet-macro-juicy-plant-image-photo.jpg',
        isActive: true,
      ),
    ];

    return meals.asMap().entries.map((e) {
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
                  image: value.imageUrl,
                ),
                Text(value.mealName, style: AppStyles.medium14(context)),
              ],
            ),
          ),
          textDataCell(context: context, text: value.mealPrice),
          textDataCell(context: context, text: value.departmentName),
          textDataCell(context: context, text: value.subDepartmentName),
          textDataCell(context: context, text: value.lastUpdate),
          widgetDataCell(
            widget: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: AppSize.size8,
              children: [
                CustomSwitch(value: value.isActive, onChanged: (value) {}),
                CustomPopupMenuButton(
                  onSelected: (menuValue) {
                    if (menuValue == MenuActionEnum.edit) {
                      // TODO: showUpdateMealDialog(context: context);
                    } else if (menuValue == MenuActionEnum.delete) {
                      showDeleteMealDialog(context: context);
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
    }).toList();
  }

  void showDeleteMealDialog({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (context) {
        return DeleteMealDialog();
      },
    );
  }
}

class MealModel {
  final String mealName;
  final String mealPrice;
  final String departmentName;
  final String subDepartmentName;
  final String lastUpdate;
  final String imageUrl;
  final bool isActive;

  MealModel({
    required this.mealName,
    required this.mealPrice,
    required this.departmentName,
    required this.subDepartmentName,
    required this.lastUpdate,
    required this.imageUrl,
    required this.isActive,
  });
}
