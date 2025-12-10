import 'package:beit_alnakha_admin/core/helper/extensions_helper.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_container_with_title.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_divider_widget.dart';
import 'package:beit_alnakha_admin/core/widgets/title_and_value_widget.dart';
import 'package:flutter/material.dart';

class RequestsBillsData extends StatelessWidget {
  const RequestsBillsData({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainerWithTitle(
      title: AppStrings.bills,
      child: Container(
        padding: EdgeInsets.all(AppSize.size12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppSize.size12),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            TitleAndValueWidget(
              title: AppStrings.requestAmount,
              subtitle: 20500.toFormatMoney(),
            ),
            TitleAndValueWidget(
              title: AppStrings.deliveryCost,
              subtitle: 500.toFormatMoney(),
            ),
            TitleAndValueWidget(
              title: AppStrings.totalBeforeDiscount,
              subtitle:20000.toFormatMoney(),
            ),
            TitleAndValueWidget(
              title: AppStrings.restaurantCommission,
              subtitle: 18000.toFormatMoney(),
            ),
            TitleAndValueWidget(
              title: AppStrings.driverCommission,
              subtitle: 1000.toFormatMoney(),
            ),
            TitleAndValueWidget(
              title: AppStrings.agentCommission,
              subtitle: 1000.toFormatMoney(),
            ),
            TitleAndValueWidget(
              title: '${AppStrings.couponDiscount} (10%)',
              subtitle: '${2000.toFormatMoney()} -',
              colorSubtitle: AppColors.red,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSize.size12),
              child: CustomDividerWidget(
                color: AppColors.grey200,
              ),
            ),
            TitleAndValueWidget(
              title: AppStrings.total,
              subtitle: 16000.toFormatMoney(),
              titleTextStyle: AppStyles.bold16(context).copyWith(color: AppColors.secondaryBlack),
              subtitleTextStyle: AppStyles.bold16(context).copyWith(color: AppColors.secondaryBlack),
            ),
          ],
        ),
      ),
    );
  }
}