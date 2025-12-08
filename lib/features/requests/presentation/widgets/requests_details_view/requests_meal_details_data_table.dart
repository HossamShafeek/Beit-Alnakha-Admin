import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_container_with_title.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_data_table.dart';
import 'package:flutter/material.dart';

class RequestsMealsDetailsDataTable extends StatelessWidget {
  const RequestsMealsDetailsDataTable({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainerWithTitle(
      title: AppStrings.meals,
      child: CustomDataTable(
        shrinkWrap: true,
        columnColor: AppColors.grey200,
        horizontalDividerColor:   AppColors.grey200,
        physics: const NeverScrollableScrollPhysics(),
        columns: AppStrings.columnsNameForMealsDetailsDataTable
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
        rows: [
          MealsDetailsModel(
            mealName: 'برجر بالبزنجان',
            quantity: 1,
            type: 'أساسية',
            price: 500,
            total: 500,
          ),
          MealsDetailsModel(
            mealName: 'كفتة بالبزنجان',
            quantity: 5,
            type: 'أساسية',
            price: 200,
            total: 1000,
          ),
          MealsDetailsModel(
            mealName: 'حواوشي بالبزنجان',
            quantity: 1,
            type: 'أساسية',
            price: 200,
            total: 200,
          ),
          MealsDetailsModel(
            mealName: 'مشروب غازي',
            quantity: 2,
            type: 'إضافية',
            price: 150,
            total: 300,
          ),
          MealsDetailsModel(
            mealName: 'تشيز كيك',
            quantity: 2,
            type: 'إضافية',
            price: 600,
            total: 1200,
          ),
        ].asMap().entries.map((e) {
          final value = e.value;
          return DataRow(
            cells: [
              textDataCell(context: context, text: value.mealName),
              textDataCell(context: context, text: value.quantity.toString()),
              textDataCell(context: context, text: value.type),
              textDataCell(context: context, text: value.price.toString()),
              textDataCell(context: context, text: value.total.toString()),


            ],
          );
        }).toList(),
      ),
    );
  }
}


class MealsDetailsModel {
  final String mealName;
  final int quantity;
  final String type;
  final num price;
  final num total;


  MealsDetailsModel({
    required this.mealName,
    required this.quantity,
    required this.type,
    required this.price,
    required this.total,
  });
}