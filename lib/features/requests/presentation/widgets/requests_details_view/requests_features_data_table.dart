import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_container_with_title.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_data_table.dart';
import 'package:flutter/material.dart';

class RequestsFeaturesDataTable extends StatelessWidget {
  const RequestsFeaturesDataTable({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainerWithTitle(
      title: AppStrings.features,
      child: CustomDataTable(
        shrinkWrap: true,
        columnColor: AppColors.grey200,
        horizontalDividerColor:   AppColors.grey200,
        physics: const NeverScrollableScrollPhysics(),
        columns: AppStrings.columnsNameForFeaturesDataTable
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

          FeatureModel(
            featureName: 'دخان الغيوم',
            time: '20 دقيقة',
            price: 500,
          ),
          FeatureModel(
            featureName: 'عزف كمان',
            time: '10 دقيقة',
            price: 2000,
          ),

        ].asMap().entries.map((e) {
          final value = e.value;
          return DataRow(
            cells: [
              textDataCell(context: context, text: value.featureName),
              textDataCell(context: context, text: value.time),
              textDataCell(context: context, text: value.price.toString()),
            ],
          );
        }).toList(),
      ),
    );
  }
}


class FeatureModel {
  final String featureName;
  final String time;
  final num price;



  FeatureModel({
    required this.featureName,
    required this.time,
    required this.price,
  });
}