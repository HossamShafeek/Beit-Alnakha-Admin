import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_container_with_title.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_divider_widget.dart';
import 'package:beit_alnakha_admin/core/widgets/title_and_value_widget.dart';
import 'package:flutter/material.dart';

class SettleSelectedPointsWidget extends StatelessWidget {
  const SettleSelectedPointsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: AppSize.size12,
          left: AppSize.size16, right: AppSize.size16),
      child: CustomContainerWithTitle(
        title: AppStrings.settleSelectedPoints,
        child: Container(
          padding: const EdgeInsets.all(AppSize.size12),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(AppSize.size12),
          ),
          child: Column(
            children: [
              TitleAndValueWidget(
                title: AppStrings.settlementNumber,
                subtitle: '#DG2025',
                viewIraqCurrencyText:false,
              ),
              TitleAndValueWidget(
                title: AppStrings.transactionDate,
                subtitle: '5/10/2025',
                viewIraqCurrencyText:false,
              ),
              TitleAndValueWidget(
                title: AppStrings.totalSelectedPoints,
                subtitle: '10.000 ${AppStrings.point}',
                viewIraqCurrencyText:false,
              ),
              CustomDividerWidget(
                verticalPadding: AppSize.size5,
              ),
              TitleAndValueWidget(
                title: AppStrings.pointsValue,
                subtitle: '20.000',
                titleTextStyle: AppStyles.bold16(context).copyWith(color: AppColors.secondaryBlack),
                subtitleTextStyle: AppStyles.bold16(context).copyWith(color: AppColors.secondaryBlack),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
