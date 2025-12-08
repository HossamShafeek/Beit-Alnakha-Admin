import 'package:beit_alnakha_admin/core/utils/app_assets.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_container_with_title.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_list_tile.dart';
import 'package:beit_alnakha_admin/core/widgets/text_container_with_icon.dart';
import 'package:flutter/material.dart';

class RequestsSummaryAndPoints extends StatelessWidget {
  const RequestsSummaryAndPoints({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainerWithTitle(
      title: AppStrings.summaryOfRequestAndPoints,
      child: Column(
        spacing: AppSize.size8,
        children: [
          CustomListTile(
            title: AppStrings.requestsNumber,
            svgIconPath: AppAssets.hash,
            trailingTitle: '963212',
          ),
          CustomListTile(
            title: AppStrings.date,
            svgIconPath: AppAssets.date,
            trailingTitle: '12/12/2022',
          ),
          CustomListTile(
            title: AppStrings.requestType,
            svgIconPath: AppAssets.orders,
            trailingTitle: 'الطلب داخل المطعم (Dine-in)',
          ),
          CustomListTile(
            title: AppStrings.tableNumber,
            svgIconPath: AppAssets.table,
            trailingTitle: '8',
          ),
          CustomListTile(
            title: AppStrings.paymentType,
            svgIconPath: AppAssets.dollar,
            trailing: TextContainerWithIcon(
              text: 'نقدًا عند الاستلام',
              iconSvgPath: AppAssets.dollar,
              iconColor: AppColors.white,
              backgroundColor: AppColors.primary,
              textColor:  AppColors.white,
            ),
          ),
          CustomListTile(
            title: AppStrings.discountUserCode,
            svgIconPath: AppAssets.offer,
            trailingTitleColor: AppColors.red,
            trailingTitle: 'CHEF10 (خصم 5.000 د.ع)',
          ),
        ],
      ),
    );
  }
}