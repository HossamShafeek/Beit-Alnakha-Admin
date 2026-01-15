import 'package:beit_alnakha_admin/core/utils/app_assets.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_constants.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_container_with_title.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_dropdown.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_list_tile.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_switch.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddAwardTextsFieldsSection extends StatelessWidget {
  const AddAwardTextsFieldsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainerWithTitle(
      child: Column(
        children: [
          CustomTextField(
            controller: TextEditingController(),
            prefixIcon: FittedBox(
              fit: BoxFit.scaleDown,
              child: SvgPicture.asset(
                AppAssets.awards,
                colorFilter: ColorFilter.mode(
                  AppColors.grey7A,
                  BlendMode.srcIn,
                ),
              ),
            ),
            validator: (value) {
              if (value!.trim().isEmpty) {
                return AppStrings.pleaseEnterAwardName;
              }
              return null;
            },
            hintText: AppStrings.awardName,
          ),
          CustomTextField(
            controller: TextEditingController(),
            textInputType: TextInputType.number,
            inputFormatters: [
              AppConstants.numberFormatter
            ],
            prefixIcon: FittedBox(
              fit: BoxFit.scaleDown,
              child: SvgPicture.asset(
                AppAssets.points,
                colorFilter: ColorFilter.mode(
                  AppColors.grey7A,
                  BlendMode.srcIn,
                ),
                width: AppSize.size24,
                height: AppSize.size24,
              ),
            ),
            validator: (value) {
              if (value!.trim().isEmpty) {
                return AppStrings.pleaseEnterRequiredPoints;
              }
              return null;
            },
            hintText: AppStrings.requiredPoints,
          ),
          CustomDropdown(
            controller: TextEditingController(),
            borderRadius: AppSize.size12,
            enabledBorder: AppConstants.removeBorder,
            focusedBorder: AppConstants.removeBorder,
            hintText: AppStrings.userType,
            prefixIcon: FittedBox(
              fit: BoxFit.scaleDown,
              child: SvgPicture.asset(
                AppAssets.awardsUser,
                colorFilter: ColorFilter.mode(
                  AppColors.grey7A,
                  BlendMode.srcIn,
                ),
              ),
            ),
            items: AppStrings.userTypesForForm
                .map(
                  (e) => PopupMenuItem<String>(
                    value: e,
                    child: Text(e, style: AppStyles.medium16(context)),
                  ),
                )
                .toList(),
          ),
          CustomListTile(
            removeIconPadding: true,
            paddingForTop: AppSize.size12,
            svgIconPath: AppAssets.status,
            titleText: AppStrings.awardStatus,
            trailing: CustomSwitch(value: true, onChanged: (value) {}),
          ),
        ],
      ),
    );
  }
}
