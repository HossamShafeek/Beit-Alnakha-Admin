import 'package:beit_alnakha_admin/core/utils/app_assets.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_container_with_title.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_list_tile.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_switch.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddDepartmentTextsFieldsSection extends StatelessWidget {
  const AddDepartmentTextsFieldsSection({super.key});

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
                AppAssets.meal,
                colorFilter: ColorFilter.mode(
                  AppColors.grey7A,
                  BlendMode.srcIn,
                ),
              ),
            ),
            validator: (value) {
              if (value!.trim().isEmpty) {
                return AppStrings.pleaseEnterDepartmentMainName;
              }
              return null;
            },
            hintText: AppStrings.departmentMainName,
          ),
          CustomListTile(
            removeIconPadding: true,
            svgIconPath: AppAssets.status,
            titleText: AppStrings.departmentStatus,
            trailing: CustomSwitch(value: true, onChanged: (value) {}),
          ),
        ],
      ),
    );
  }
}
