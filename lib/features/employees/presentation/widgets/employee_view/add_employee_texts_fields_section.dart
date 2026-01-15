import 'package:beit_alnakha_admin/core/utils/app_assets.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_container_with_title.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_list_tile.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_phone_field.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_switch.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_text_field.dart';
import 'package:beit_alnakha_admin/features/agents/presentation/widgets/agent_view/governorates_drop_down.dart';
import 'package:beit_alnakha_admin/features/agents/presentation/widgets/agent_view/regions_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddEmployeeTextsFieldsSection extends StatelessWidget {
  const AddEmployeeTextsFieldsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainerWithTitle(
      child: Column(
        children: [
          CustomTextField(
            controller: TextEditingController(),
            prefixIcon: FittedBox(
              fit: BoxFit.scaleDown,
              child: SvgPicture.asset(AppAssets.username),
            ),
            validator: (value) {
              if (value!.trim().isEmpty) {
                return AppStrings.pleaseEnterUsername;
              }
              return null;
            },
            hintText: AppStrings.employeeName,
          ),
          CustomPhoneField(
            paddingForBottom: 1,
            controller: TextEditingController(),
            // Validator is typically handled inside or generic
          ),
          GovernoratesDropDown(controller: TextEditingController()),
          RegionsDropDown(controller: TextEditingController()),
          CustomListTile(
            removeIconPadding: true,
            svgIconPath: AppAssets.status,
            titleText: AppStrings.employeeStatus,
            trailing: CustomSwitch(value: true, onChanged: (value) {}),
          ),
        ],
      ),
    );
  }
}
