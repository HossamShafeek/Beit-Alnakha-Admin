import 'package:beit_alnakha_admin/core/utils/app_assets.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_container_with_title.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_list_tile.dart';
import 'package:beit_alnakha_admin/core/widgets/text_container_with_icon.dart';
import 'package:flutter/material.dart';

class RequestDetailsCustomerData extends StatelessWidget {
  const RequestDetailsCustomerData({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainerWithTitle(
      title: AppStrings.customerData,
      child: Column(
        spacing: AppSize.size8,
        children: [
          CustomListTile(
            titleText: AppStrings.fullName,
            svgIconPath: AppAssets.username,
            trailingTitle: 'حسام شفيق',
          ),
          CustomListTile(
            titleText: AppStrings.whatsAppNumber,
            svgIconPath: AppAssets.whatsApp,
            trailingTitle: '01010040257',
            trailingTitleColor: AppColors.primary,
          ),
          CustomListTile(
            titleText: AppStrings.address,
            svgIconPath: AppAssets.address,
            trailingTitle: 'بغداد – المنصور',
          ),
          CustomListTile(
            titleText: AppStrings.deliveryMethod,
            svgIconPath: AppAssets.car,
            trailingTitle: '-',
          ),
          TextContainerWithIcon(
            height: 106,
            disabledMaxLine: true,
            width: double.infinity,
            alignment: Alignment.topRight,
            text: 'من فضلكم بدون مايونيز، والتوصيل بسرعة إذا أمكن.'*10,
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