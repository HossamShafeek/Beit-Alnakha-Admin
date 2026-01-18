import 'package:beit_alnakha_admin/core/functions/build_stars_row.dart';
import 'package:beit_alnakha_admin/core/helper/extensions_helper.dart';
import 'package:beit_alnakha_admin/core/responsive_helper/responsive_pattern_layout.dart';
import 'package:beit_alnakha_admin/core/utils/app_assets.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_list_tile.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_switch.dart';
import 'package:beit_alnakha_admin/core/widgets/text_container_with_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DriverDetailsDataSectionBody extends StatelessWidget {
  const DriverDetailsDataSectionBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsivePatternLayout(
      patternBuilder: (width) {
        if (width >= 1100) {
          return [3, 2, 3];
        } else if (width >= 650) {
          return [2, 2, 2, 2];
        } else {
          return [1, 1, 1, 1, 1, 1, 1, 1];
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
          trailingTitle: 'بغداد - الكرادة - شارع 10',
        ),
        CustomListTile(
          svgIconPath: AppAssets.call,
          titleText: AppStrings.phoneNumber,
          trailingTitle: '07777777777',
          trailingTitleColor: AppColors.primary,
        ),
        CustomListTile(
          svgIconPath: AppAssets.points,
          titleText: AppStrings.pointsCount,
          trailingTitle: 5000.toFormatMoney(),
          trailingTitleColor: AppColors.primary,
        ),
        CustomListTile(
          svgIconPath: AppAssets.dollarTwo,
          titleText: AppStrings.totalDeliveryProfit,
          trailingTitle: 50000.toFormatMoney().toWithIraqCurrency(),
          trailingTitleColor: AppColors.primary,
        ),

        CustomListTile(
          svgIconPath: AppAssets.date,
          titleText: AppStrings.joinDate,
          trailing: TextContainerWithIcon(text: '11/11/2022'),
        ),
        CustomListTile(
          onTap: () {},
          svgIconPath: AppAssets.rate,
          titleWidget: buildStarsRow(3),
          trailing: RotatedBox(
            quarterTurns: 2,
            child: SvgPicture.asset(
              AppAssets.arrowRight,
              colorFilter: ColorFilter.mode(AppColors.black5B, BlendMode.srcIn),
            ),
          ),
        ),
        CustomListTile(
          svgIconPath: AppAssets.status,
          titleText: AppStrings.driverStatus,
          trailing: CustomSwitch(value: true, onChanged: (value) {}),
        ),
      ],
    );
  }
}
