import 'package:beit_alnakha_admin/core/utils/app_assets.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_container_with_title.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_list_tile.dart';
import 'package:beit_alnakha_admin/core/widgets/text_container_with_icon.dart';
import 'package:flutter/material.dart';

class RequestsDeliveryInformation extends StatelessWidget {
  const RequestsDeliveryInformation ({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainerWithTitle(
      title: AppStrings.deliveryInformation,
      child: Column(
        spacing: AppSize.size8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomListTile(
            titleText: AppStrings.driverName,
            svgIconPath: AppAssets.username,
            trailingTitle: 'الشيخ محمود',
          ),
          CustomListTile(
            titleText: AppStrings.governorate,
            svgIconPath: AppAssets.city,
            trailingTitle: 'الجيزة',
          ),
          CustomListTile(
            titleText: AppStrings.region,
            svgIconPath: AppAssets.region,
            trailingTitle: 'الوراق',
          ),
          CustomListTile(
            titleText: AppStrings.price,
            svgIconPath: AppAssets.dollar,
            trailingTitle: '1000.00 ${AppStrings.iraqCurrency}',
          ),
          TextContainerWithIcon(
            height: 106,
            alignment: Alignment.topRight,
            width: double.infinity,
            disabledMaxLine: true,
            text: 'الزبون لم يجب على الاتصال الأول',
            backgroundColor: AppColors.white,
            textStyle: AppStyles.medium16(
              context,
            ).copyWith(color: AppColors.black5B),
          ),
        ],
      ),
    );
  }
}