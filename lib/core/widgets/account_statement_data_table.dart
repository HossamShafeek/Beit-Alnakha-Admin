import 'package:beit_alnakha_admin/core/helper/extensions_helper.dart';
import 'package:beit_alnakha_admin/core/utils/app_assets.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_data_table.dart';
import 'package:beit_alnakha_admin/core/widgets/text_container_with_icon.dart';
import 'package:flutter/material.dart';

class AccountStatementDataTable extends StatelessWidget {
  const AccountStatementDataTable({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomDataTable(
      columns: AppStrings.columnsNameForAccountStatementDataTable
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
            AccountStatementModel(
              transactionNumber: '1',
              transactionType: 'توصيل طلب',
              earnedPoints: '20',
              date: '5/10/2025',
              price: '10000',
              status: AppStrings.unsettled,
            ),
            AccountStatementModel(
              transactionNumber: '2',
              transactionType: 'توصيل طلب',
              earnedPoints: '50',
              date: '5/10/2025',
              price: '50000',
              status: AppStrings.unsettled,
            ),
            AccountStatementModel(
              transactionNumber: '3',
              transactionType: 'توصيل طلب',
              earnedPoints: '80',
              date: '5/10/2025',
              price: '20000',
              status: AppStrings.unsettled,
            ),
          ].asMap().entries.map((e) {
            final value = e.value;
            return DataRow(
              cells: [
                textDataCell(context: context, text: value.transactionNumber),
                textDataCell(context: context, text: value.transactionType),
                textDataCell(
                  context: context,
                  text: '+${value.earnedPoints} ${AppStrings.point}',
                ),
                textDataCell(context: context, text: value.date),
                textDataCell(context: context, text: num.parse(value.price).toFormatMoney().toWithIraqCurrency()),
                widgetDataCell(
                  widget: TextContainerWithIcon(
                    text: value.status,
                    iconSvgPath: AppAssets.wallet,
                    iconColor: AppColors.blueE0,
                    backgroundColor: AppColors.blueE0WithOpacity10,
                    textColor: AppColors.blueE0,
                  ),
                ),
              ],
            );
          }).toList(),
    );
  }
}

class AccountStatementModel {
  final String transactionNumber;
  final String transactionType;
  final String earnedPoints;
  final String date;
  final String price;
  final String status;

  AccountStatementModel({
    required this.transactionNumber,
    required this.transactionType,
    required this.earnedPoints,
    required this.date,
    required this.price,
    required this.status,
  });
}
