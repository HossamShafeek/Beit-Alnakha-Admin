import 'package:beit_alnakha_admin/core/responsive_helper/responsive_pattern_layout.dart';
import 'package:beit_alnakha_admin/core/utils/app_assets.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_list_tile.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_switch.dart';
import 'package:beit_alnakha_admin/core/widgets/text_container_with_icon.dart';
import 'package:flutter/material.dart';

class CustomerDetailsDataSectionBody extends StatelessWidget {
  const CustomerDetailsDataSectionBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  ResponsivePatternLayout(
      patternBuilder: (width) {
        if (width >= 1100) {
          return [3, 4];
        } else if (width >= 650) {
          return [2, 2, 2, 1];
        } else {
          return [1, 1, 1, 1, 1, 1, 1];
        }
      },
      children: [
        CustomListTile(
          svgIconPath: AppAssets.username,
          titleText: AppStrings.fullName,
          trailingTitle: 'حسام شفيق',
        ),
        CustomListTile(
          svgIconPath: AppAssets.address,
          titleText: AppStrings.address,
          trailingTitle: 'الوراق',
        ),
        CustomListTile(
          svgIconPath: AppAssets.call,
          titleText: AppStrings.phoneNumber,
          trailingTitle: '07777777777',
          trailingTitleColor: AppColors.primary,
        ),
        CustomListTile(
          svgIconPath: AppAssets.city,
          titleText: AppStrings.governorate,
          trailingTitle: 'الجيزة',
        ),
        CustomListTile(
          svgIconPath: AppAssets.date,
          titleText: AppStrings.joinDate,
          trailing: TextContainerWithIcon(text: '11/11/2022'),
        ),
        CustomListTile(
          svgIconPath: AppAssets.dateTime,
          titleText: AppStrings.lastRequest,
          trailing: TextContainerWithIcon(text: '11/11/2022'),
        ),
        CustomListTile(
          svgIconPath: AppAssets.status,
          titleText: AppStrings.userStatus,
          trailing: CustomSwitch(value: true, onChanged: (value) {}),
        ),
      ],
    );
  }
}
