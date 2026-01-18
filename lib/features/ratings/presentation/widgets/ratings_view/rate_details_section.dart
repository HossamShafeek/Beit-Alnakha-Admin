import 'package:beit_alnakha_admin/core/functions/build_stars_row.dart';
import 'package:beit_alnakha_admin/core/utils/app_assets.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_container_with_title.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';

class RateDetailsSection extends StatelessWidget {
  const RateDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppSize.size12,
      children: [
        CustomContainerWithTitle(
          child: Column(
            children: [
              CustomListTile(
                svgIconPath: AppAssets.awardsUser,
                titleText: AppStrings.customerName,
                trailingTitle: 'محمود جمعة',
              ),
              CustomListTile(
                svgIconPath: AppAssets.hash,
                titleText: AppStrings.requestNumber,
                trailingTitle: '#ORD-40213',
                paddingForTop: AppSize.size8,
              ),
              CustomListTile(
                svgIconPath: AppAssets.drivers,
                titleText: AppStrings.theDriver,
                trailingTitle: 'أحمد جمال',
                paddingForTop: AppSize.size8,
              ),
              CustomListTile(
                svgIconPath: AppAssets.orders,
                titleText: AppStrings.ratingOnRequest,
                trailing: buildStarsRow(5),
                paddingForTop: AppSize.size8,
              ),
              CustomListTile(
                svgIconPath: AppAssets.drivers,
                titleText: AppStrings.ratingOnDriver,
                trailing: buildStarsRow(5),
                paddingForTop: AppSize.size8,
              ),
              CustomListTile(
                svgIconPath: AppAssets.date,
                titleText: AppStrings.ratingDate,
                trailingTitle: '2025-11-20 – 4:20 PM',
                paddingForTop: AppSize.size8,
                paddingForBottom: AppSize.size8,
              ),
              CustomContainerWithTitle(
                backgroundColor: AppColors.white,
                child: Text(
                  'البرجر طيب ولحمه جوسي، بس الخبزة ناشفة شوي',
                  style: AppStyles.medium14(
                    context,
                  ).copyWith(color: AppColors.black5B),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),

      ],
    );
  }


}
